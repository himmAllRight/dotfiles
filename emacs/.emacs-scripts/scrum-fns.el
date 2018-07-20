;; Writting some org functions to help me manage my stuff easier.

(defun ryan/generate-task-table ()
  "Generates a table from a sub tree"
  (interactive)
  (let* ((parsed-list (ryan/get-org-task-list-data))
	 (output-list (calc-table-output parsed-list)))

    (save-excursion
      (end-of-line 0)
      (open-line 1))
    
    (apply #'insert output-list)

    (org-cycle)

    (insert "\n")))

(defun ryan/get-org-task-list-data ()
  "Parses a sub tree and grabs the data to generate the table from."
  (interactive)
  (let (output-items)
    (org-map-entries
     (lambda ()
       (let* ((name (org-heading-components))
	      (time (org-element-property :TIME (org-element-at-point))))
	 (push (list name time) output-items)))
     nil
     'tree)
    output-items))


(defun calc-table-output (parsed-list)
  "Takes the parsed list of lists for the table, sums up the total
  time and then returns a list of strings to insert."
  (interactive)
  (let ((output-list))
    (reduce (lambda (prev-values header-list)
	      (let ((header-data (car header-list))
		    (prev-level   (car prev-values))
		    (time        (if (cadr header-list)
				     (string-to-number
				      (cadr header-list))
				   0)))
		(cond ((= prev-level (car header-data))
		       (push (format "\n| %s | %s |"
				     (elt header-data 4)
				     time)
			     output-list)
		       (cons (car header-data) (+ (cdr prev-values) time)))
		      ((<= prev-level (car header-data))
		       (push (format "\n| %s | %s |"
				     (elt header-data 4)
				     time)
			     output-list)
		       (cons (car header-data) 0))
		      ((> prev-level (car header-data))
		       (push (format "\n| %s | %s |"
				     (elt header-data 4)
				     (+ time (cdr prev-values)))
			     output-list)
		       (cons (car header-data) (+ (cdr prev-values) time))))))
	    parsed-list :initial-value (cons 0 0))
    output-list))
