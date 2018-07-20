;; Writting some org functions to help me manage my stuff easier.

(defclass ryan/task ()
  ((level    :initarg :level    :initform 0)
   (status   :initarg :status   :initform nil)
   (heading  :initarg :heading  :initform "")
   (tags     :initarg :tags     :initform nil)
   (time     :initarg :time     :initform 0)))


;; An alist to manage the status names and their respective columns.
(setf *columns-alist* '(("Backlog"    "\n| %s | | | |")
			("Working On" "\n| | %s | | |")
			("On Hold"    "\n| | | %s | |")
			("Finished"   "\n| | | | %s |")))

(defun ryan/generate-scrum-board ()
  (interactive)
  (let ((task-list (ryan/get-tasks-with-status)))
    ;; Create Header
    (insert
     (format "|--|\n|%s|\n|--|"
	     (mapconcat #'car *columns-defs* " | ")))

    ;; Insert rows for each task
    (mapcar #'ryan/insert-scrum-board-task
	    task-list)

    (insert (format "\n|--|"))

    (org-cycle)
    ))

(defun ryan/insert-scrum-board-task (task)
  (let* ((status       (oref task :status))
	 (link-heading (format "[[%s]]" (oref task :heading)))
	 (str          (ryan/scrum-row-format-string status)))
    ;; Only write task it matches a proper status
    (when str
      (insert (format str link-heading)))))

(defun ryan/scrum-row-format-string (status)
  "Returns the format string based on status/column placement
using *coumns-alist*."
  (let ((var (assoc status *columns-alist* #'string-equal)))
    (when var
      (cadr var))))



(defun ryan/get-tasks-with-status ()
  "Returns a list of task objects in the buffer that have a
status marked."
  (interactive)
  (let (output-items)
    (org-map-entries
     (lambda ()
       (let* ((heading-data (org-heading-components))w
	      (level        (elt heading-data 0))
	      (status       (elt heading-data 2))
	      (heading      (elt heading-data 4))
	      (tags         (elt heading-data 5))
	      (time (org-element-property :TIME (org-element-at-point))))
	 (when status
	   (push
	    (make-instance 'ryan/task
			   :level    level
			   :status   status
			   :heading  heading
			   :tags     tags
			   :time     (when time (string-to-number time)))
	    output-it))))
     nil
     nil)
    output-items))

;; Scratch
(setf foo nil)
(setf bar (car foo))

(mapcar #'ryan/insert-scrum-board-task foo)



(mapcar (lambda (obj) (oref obj :status)) foo)


