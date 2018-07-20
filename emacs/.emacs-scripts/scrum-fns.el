;; Writting some org functions to help me manage my stuff easier.

(defclass ryan/task ()
  ((level    :initarg :level    :initform 0)
   (status   :initarg :status   :initform nil)
   (heading  :initarg :heading  :initform "")
   (tags     :initarg :tags     :initform nil)
   (time     :initarg :time     :initform 0)))


;; An alist to manage the status names and their respective columns.
(setf *columns-alist* '(("Queue"    "\n| %s | | | |")
			("Working On" "\n| | %s | | |")
			("On Hold"    "\n| | | %s | |")
			("Finished"   "\n| | | | %s |")))

(defun ryan/create-scrum-board ()
  "Create a new scrum board, with BEGIN and END tags."
  (interactive)
  (insert (format "#+BEGIN: scrum-board\n"))
  (ryan/generate-scrum-board)
  (insert (format "\n#+END:")))

(defun org-dblock-write:scrum-board (params)
  (ryan/generate-scrum-board))

(defun ryan/generate-scrum-board ()
  (interactive)
  (let ((task-list (ryan/get-tasks-with-status)))
    ;; Create Header
    (insert
     (format "|--|\n|%s|\n|--|"
	     (mapconcat #'car *columns-alist* " | ")))

    ;; Insert rows for each task
    (mapcar #'ryan/insert-scrum-board-task
	    task-list)

    ;; Align compelted table
    (org-table-align)))

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
	    output-items))))
     nil
     nil)
    (reverse output-items)))
