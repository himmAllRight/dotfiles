;; Allegro Common LISP Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is sample code for starting and specifying defaults to the
;; {{[[-Emacs-]]}}-Lisp interface.

(load "c:/acl100-smp.64/eli/fi-site-init.el")

;; Global var for the acl exe. Currently sets to ACL 10
(setq acl-version "c:/acl100-smp.64/allegro")

;; Function to set to another version of acl
(defun set-acl-version ()
  (interactive)
  (let ((test-name nil)
        (name-options '("9" "10")))
    (while (not (remove nil (mapcar (lambda (name) (equalp name test-name)) name-options)))
      (setf test-name
            (read-from-minibuffer (format "test-name not one of: %s. Please enter one of them: " name-options))))
    (cond ((equalp test-name "9")
           (setf acl-version "c:/acl90-smp.64/allegro"))
          ((equalp test-name "10")
           (setq acl-version "c:/acl100-smp.64/allegro"))
          (t
           (error "test-name not correct.")))
    (message "'acl-version set to \"%s\" (%s)." acl-version (get-acl-version t))))

;; Function that returns the currently set ACL version
(defun get-acl-version (&optional str-return)
  (interactive)
  (let ((return-message nil))
    (cond ((equalp acl-version "c:/acl90-smp.64/allegro")
           (setf return-message "Allegro 9"))
          ((equalp acl-version "c:/acl100-smp.64/allegro")
           (setf return-message "Allegro 10"))
          (t
           (setf return-message acl-version)))
    (if str-return
        return-message
      (message return-message))))


;; A function that will launch acl-smp, but with the path set to a defined project
;; path. If path is lpr file, will open the project. If a project that is not in the
;; list is entered, defaults to the vault folder.
(defun acl-project ()
  "Opens an allegro lisp environment with a default path for a particular project."
  (interactive)
  (let ((project-src-list
         '((ggplot-1-2 "s:/_Vault_Working/Libraries/ggplot/src/branches/1.2/GGPLOT.lpr")
           (ggplot "s:/_Vault_Working/Libraries/ggplot/src/development/trunk/GGPLOT.lpr")
           (ggplot-1-1 "s:/_Vault_Working/Libraries/ggplot/src/development/trunk/GGPLOT.lpr")
           (pros-edi "S:/_Vault_Working/2-applications/ProsEDICreator/src/development/trunk/pros-edi-creator.lpr")
           (pros-edi-1-0 "s:/_Vault_Working/2-applications/ProsEDICreator/src/branches/Version1.0/pros-edi-creator.lpr")
           (dset-flis "s:/_Vault_Working/Libraries/DSET-FLIS/src/development/trunk/DSET-FLIS.lpr")
           (dset-flis-1-0 "s:/_Vault_Working/Libraries/DSET-FLIS/src/branches/DSET-FLIS 1.0/DSET-FLIS.lpr")
           (dset-pep "s:/_Vault_Working/Libraries/DSET-PEP/src/development/trunk/DSET-PEP.lpr")
           (dset-pep-1-0 "s:/_Vault_Working/Libraries/DSET-PEP/src/branches/DSET-PEP 1.0/DSET-PEP.lpr")
           (data-updater "s:/_Vault_Working/3-blocks/DataUpdater/src/development/trunk/data-updater.lpr")
           (data-updater-demo "s:/_Vault_Working/3-blocks/DataUpdater/User Documentation/data-updater-example/data-updater-example.lpr")
           (flis-foi "S:/_Vault_Working/Interfaces/flis-foi/src/development/trunk/flis-foi.lpr")
           (flis-foi-1-1 "S:/_Vault_Working/Interfaces/flis-foi/src/branches/1.1/flis-foi.lpr")
           (flis-foi-2-0 "S:/_Vault_Working/Interfaces/flis-foi/src/branches/2.0/flis-foi.lpr")
           (flis-foi-client "S:/_Vault_Working/Interfaces/flis-foi/src/development/trunk/flis-foi-client.lpr")
           (contract-history "s:/_Vault_Working/Libraries/ContractHistory/src/branches/2.1.4/contract-history.lpr")
           (apex "s:/_Vault_Working/Libraries/AutoPrice Explorer/src/development/Version 1.6 - Trunk/APEX.lpr")
           (bls "s:/_Vault_Working/Interfaces/BLS/src/development/BLS.lpr")
           (spreadsheet "S:/_Vault_Working/Interfaces/spreadsheet/src/development/trunk/spreadsheet.lpr")
           (winstoic-base "s:/_Vault_Working/2-applications/winStoic/winStoic Base/Trunk/winStoicBase.lpr")
           (ihs-dvd "s:/_Vault_Working/2-applications/IHS-DVD/src/branches/1.0/WebServer/IHS-DVD.lpr")
           (ihs-dvd-trunk "s:/_Vault_Working/2-applications/IHS-DVD/src/development/trunk/WebServer/IHS-DVD.lpr")
           (2isBuild "s:/_Vault_Working/Libraries/2isBuild/src/development/trunk/2isBuild.lpr")
           (2apbase "s:/_Vault_Working/1-saas/2AP/src/development/base/trunk/demo-env-base/demo-env-base.lpr")
           (2apdataexec-base "s:/_Vault_Working/1-saas/2AP/src/development/base/trunk/base.dataexec/2AP-dataexec.lpr")
           (2apdataexec "s:/_Vault_Working/1-saas/2AP/src/development/2AP-C27J/trunk/DataExec/DataExec.lpr")
	   (2apdataexec-sema "s:/_Vault_Working/1-saas/2AP/src/development/SEMA/trunk/DataExec/DataExec.lpr")
           (DB-Builder "s:/_Vault_Working/1-saas/PriceEdge/src/development/trunk/DB-builder/DB-builder.lpr")
           (2is-apps "C:/2is-apps/")))
        (project-name (read-from-minibuffer "Select Project: "))
        (execute-args (quote ("+B" "+cn")))
        project-path
        project-dir)

    ;; Unless no project is provided, set paths
    (cond ((equalp project-name "")
           (setf project-dir "S:/_Vault_Working/")
           (setf project-name "no-project"))
          (t
           (setf project-path (second (assoc (intern project-name) project-src-list)))
           (setf project-dir (file-name-directory project-path))
           ;; When project-lpr is specified, add it to args list to load up by default.
           (when (equalp "lpr" (file-name-extension project-path))
             (setf execute-args (concatenate 'list execute-args (list "-project" project-path))))))
    (message acl-version)
    ;; Launch ACL Session from {{[[-emacs-]]}}
    (fi:common-lisp (format "*common-lisp-%s*" project-name)
                    project-dir
                    acl-version
                    execute-args
                    "localhost"
                    nil)))

(defun open-work-files ()
  (interactive)
  (mapcar 'find-file
	  '(;; Data Update Block Trunk
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/3-blocks/DataUpdater/src/development/trunk/build-jobs.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/3-blocks/DataUpdater/src/development/trunk/build-database.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/3-blocks/DataUpdater/src/development/trunk/utilities.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/3-blocks/DataUpdater/src/development/trunk/main.cl"

	    ;; Data Exec Trunk
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/1-saas/2AP/src/development/2AP-C27J/trunk/DataExec/dataupdater.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/1-saas/2AP/src/development/2AP-C27J/trunk/DataExec/data-deployer.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/1-saas/2AP/src/development/2AP-C27J/trunk/DataExec/sim-integration.cl"
	    "~/Network/Server-Node-Files/Work/S/_Vault_Working/1-saas/2AP/src/development/2AP-C27J/trunk/DataExec/ac-sim-build.cl"

	    ;; Org Notes
	    "~/nextcloud/emacs/org/archive/work.org"
	    )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Allegro Keybindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uncomment Region  Note: "C-c ;" is already set to comment region in allegro
(global-set-key (kbd "C-c :") 'uncomment-region)
(global-set-key (kbd "C-c p") 'acl-project)



;; Org Pomodoro
(setq org-pomodoro-clock-break t)

;; Settings for Spell Check
(when (package-installed-p 'ispell)
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "american"))
