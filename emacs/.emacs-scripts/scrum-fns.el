;; Writting some org functions to help me manage my stuff easier.

(defun ryan/generate-task-table ()
  "Generates a table from a sub tree"
  (interactive)
  (let* ((parsed-list (ryan/get-org-task-list-data))
	 (output-list (calc-table-output parsed-list)))

    (save-excursion
      (end-of-line 0)
      (open-line 1))

    (apply #'insert
	   '("| Task | Time (hr) |\n"
	     "|----|\n"))
    
    (apply #'insert output-list)

    (org-cycle)

    ))

(setf foo nil)

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
	    foo))))
     nil
     'tree)
    output-items))

;; (defun ryan/get-org-task-list-data ()
;;   "Parses a sub tree and grabs the data to generate the table from."
;;   (interactive)
;;   (let (output-items)
;;     (org-map-entries
;;      (lambda ()
;;        (let* ((item-data (org-heading-components))
;; 	      (level    (elt item-data 0))
;; 	      (todo     (elt item-data 2))
;; 	      (priority (elt item-data 3))
;; 	      (title    (elt item-data 4))
;; 	      (tags     (elt item-data 5))
;; 	      (time     (org-element-property :TIME (org-element-at-point))))
;; 	 (push
;; 	  (make-instance 'ryan/task
;; 			 :level    level
;; 			 :todo     todo
;; 			 :priority priority
;; 			 :title    title
;; 			 :tags     tags
;; 			 :time     time)
;; 	  foo)))
;;      nil
;;      'tree)
;;     output-items))


(defun calc-table-output (parsed-list)
  "Takes the parsed list of lists for the table, sums up the total
  time and then returns a list of strings to insert."
  (interactive)
  (let ((top-level-total 0)
	(output-list))
    (reduce (lambda (prev-values obj)
	      (let ((prev-level   (car prev-values))
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

(org-element)
(mapcar (lambda (item) (insert (format "\n%s" item))) (reverse foo))


(defclass ryan/task ()
  ((level    :initarg :level    :initform 0)
   (todo     :initarg :todo     :initform nil)
   (priority :initarg :priority :initform nil)
   (title    :initarg :title    :initform "")
   (tags     :initarg :tags     :initform nil)
   (time     :initarg :time     :initform 0)))


(setf foo nil)
(setf bar (car foo))

(mapcar (lambda (obj) (oref obj :time)) foo)
