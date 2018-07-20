;; Writting some org functions to help me manage my stuff easier.

(defclass ryan/task ()
  ((level    :initarg :level    :initform 0)
   (todo     :initarg :todo     :initform nil)
   (priority :initarg :priority :initform nil)
   (title    :initarg :title    :initform "")
   (tags     :initarg :tags     :initform nil)
   (time     :initarg :time     :initform 0)))

(defun ryan/generate-task-table ()
  "Generates a table from a sub tree"
  (interactive)
  (let* ((parsed-list (ryan/get-org-task-list-data))
	 (output-list (calc-table-output parsed-list)))

    (save-excursion
      (end-of-line 0)
      (open-line 1))

    (apply #'insert
	   '("\n| Task | Time (hr) |"
	     "\n|----|"))
    
    (apply #'insert output-list)

    (org-cycle)

    ))

(defun ryan/get-org-task-list-data ()
  "Parses a sub tree and grabs the data to generate the table from."
  (interactive)
  (let (output-items)
    (org-map-entries
     (lambda ()
       (multiple-value-bind (level rlevel todo priority title tags)
	   (org-heading-components)
	 (let* ((time (org-element-property :TIME (org-element-at-point))))
	   (push
	    (make-instance 'ryan/task
			   :level    level
			   :todo     todo
			   :priority priority
			   :title    title
			   :tags     tags
			   :time     (when time (string-to-number time)))
	    output-items))))
     nil
     'tree)
    output-items))

(defun calc-table-output (parsed-list)
  "Takes the parsed list of lists for the table, sums up the total
  time and then returns a list of strings to insert."
  (interactive)
  (let ((top-level-total 0)
	(output-list))
    (reduce (lambda (prev-values obj)
	      (let ((prev-level   (car prev-values))
		    (time        (if (oref obj :time)
				     (oref obj :time)
				   0)))
		;; TODO: Cleanup all this redundancy
		(cond ((= prev-level (oref obj :level))
		       (push (format "\n| %s | %s |"
				     (oref obj :title)
				     time)
			     output-list)
		       (cons (oref obj :level) (+ (cdr prev-values) time)))
		      ((<= prev-level (oref obj :level))
		       (push (format "\n| %s | %s |"
				     (oref obj :title)
				     time)
			     output-list)
		       (cons (oref obj :level) 0))
		      ((> prev-level (oref obj :level))
		       (push (format "\n| %s | %s |"
				     (oref obj :title)
				     (+ time (cdr prev-values)))
			     output-list)
		       (cons (oref obj :level) (+ (cdr prev-values) time))))))
	    parsed-list :initial-value (cons 0 0))
    output-list))


;; Scratch
(setf foo nil)
(setf bar (car foo))

(mapcar (lambda (obj) (oref obj :time)) foo)
