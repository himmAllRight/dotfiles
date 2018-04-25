;; Base Emacs Configuration

;; Add Melpa packages to Repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Core Setup ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Remove splash screen and use *scratch* as home buffer
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq backup-directory-alist '(("." . "~/nextcloud/emacs/backups")))

(require 'powerline-evil)
(powerline-evil-vim-color-theme)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 ;; Power line colors
 '(powerline-evil-normal-face ((t (:background "#CE690a" :foreground "#eee8d5"))))
 '(powerline-evil-insert-face ((t (:background "#12a80d" :foreground "#eee8d5"))))
 '(powerline-evil-visual-face ((t (:background "#12a80d" :foreground "#eee8d5"))))
 '(powerline-evil-operator-face ((t (:background "#12a80d" :foreground "#eee8d5"))))
 '(powerline-evil-replace-face ((t (:background "#12a80d" :foreground "#eee8d5"))))
 '(powerline-evil-motion-face ((t (:background "#12a80d" :foreground "#eee8d5"))))
 '(powerline-evil-emacs-face ((t (:background "#410da8" :foreground "#eee8d5"))))
 )
(display-time-mode t)

;; Evil Mode
(require 'evil)
(evil-mode 1)

;; Line Numbers On
(global-linum-mode 1)

;; Menubar off by default
(menu-bar-mode -1)

;; New line auto indents
(define-key global-map (kbd "RET")
  'newline-and-indent)

;; Tool Tips in echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Smooth Scroll
(require 'smooth-scroll)

(defun zoom-window ()
  (interactive)
  (if zoom-temp-window-configuration
      (progn
        (set-window-configuration zoom-temp-window-configuration)
       (setq zoom-temp-window-configuration nil)
        (message "Window un-zoomed"))
    (progn
      (setq zoom-temp-window-configuration (current-window-configuration))
      (delete-other-windows)
      (message "Window zoomed"))))


;; Eshell clear
(defun eshell-clear-buffer ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook
      '(lambda()
         (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

(global-set-key (kbd "C-c <delete>") 'eshell-clear-buffer)


;;;;;;;;;;;;;;;;;;;;
;;;;; Ivy Mode ;;;;;
;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Ivy Keybindings
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Key Bindings ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell Check Word key-binds
(global-set-key (kbd "C-c w") 'ispell-word)
(global-set-key (kbd "C-c r") 'ispell-region)

;; Toggle menubar keybind
(global-set-key (kbd "C-c m") 'menu-bar-mode)

;; Eshell launch keybind
(global-set-key (kbd "C-c t") 'eshell)

;; Comment/Uncomment region
(global-set-key (kbd "C-c ;") 'comment-region)


;; Previous Window shortcut
(global-set-key (kbd "C-x p")
                (lambda() (interactive) (other-window -1)))
(global-set-key (kbd "C-x O")
                (lambda() (interactive) (switch-window)))
(global-set-key (kbd "C-x o")
                (lambda() (interactive) (other-window 1)))
(global-set-key (kbd "C-x \)")
                (lambda() (interactive) (other-frame 1)))
(global-set-key (kbd "C-x 0")
                (lambda() (interactive) (delete-window)))

(global-set-key (kbd "C-c z") 'zoom-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Writting Settings ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;
;; Org Mode;;
;;;;;;;;;;;;; 
(defun org-code (start end)
  "Wraps selected text with org code tags"
  (interactive "r")
  (let ((selected-text (buffer-substring (mark) (point)))
        (db-name (read-from-minibuffer "Language[common-lisp]: ")))
    (when (eq db-name "")
      (setf db-name "common-lisp"))
    (kill-region start end)
    (insert (format "#+BEGIN_SRC %s \n%s \n#+END_SRC" db-name selected-text))))

;; Persistent Clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Default Table Params
(setq org-clock-clocktable-default-properties '(:maxlevel 3 :scope subtree :tags "-Lunch"))


;; Org Pomodoro ;;
;; Setup pomodoro timer keybind
(global-set-key (kbd "C-S-c C-S-p") 'org-pomodoro)
(global-set-key (kbd "C-S-c C-S-e") 'org-pomodoro-extend-last-clock)

(defun org-pomodoro-get-times ()
  (interactive)
  (message "work length: %s  short break: %s  long break: %s"
           org-pomodoro-length
           org-pomodoro-short-break-length
           org-pomodoro-long-break-length))

(defun org-pomodoro-set-pomodoro ()
  (interactive)
  (setf org-pomodoro-length 35)
  (setf org-pomodoro-short-break-length 9)
  (setf org-pomodoro-long-break-length 15))


(org-pomodoro-set-pomodoro)

(defun org-pomodoro-set-52-17 ()
  (interactive)
  (setf org-pomodoro-length 52)
  (setf org-pomodoro-short-break-length 17)
  (setf org-pomodoro-long-break-length 17))

;; Org Agenda stuff
(setq org-agenda-files '("~/nextcloud/emacs/org/archive/work.org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Developer Settings ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'pretty-mode)
;; (pretty-lambda-mode t)

(ac-config-default) ;; Auto Complete

(require 'smartparens-config)
;; Remove ' and  from pairing
(sp-pair "'" nil :actions :rem)
(sp-pair "`" "'" :actions :rem)

;; (sp-local-pair 'emacs-lisp-mode "`" "")  ;; only use single ` or ' in emacs-lisp
;; (sp-local-pair 'common-lisp-mode "`" "") ;; only use single ` or ' in common-lisp
;; (sp-local-pair 'lisp-mode "`" "")        ;; only use single ` or ' in "lisp"
;; (sp-local-pair 'fi:common-lisp-mode "`" "") ;; only use single ` or ' in ACL common-lisp

;;(global-pretty-lambda-mode t)
(global-aggressive-indent-mode t)

;; Magit
(require 'evil-magit)
(global-set-key (kbd "C-c g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; Work Settings ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load functions for using Allegro
(load "~/.emacs-work.el")

;; Settings for Spell Check
(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-dictionary "american")





;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings added by emacs GUI options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#ffffff" "#183691" "#969896" "#a71d5d" "#969896" "#969896" "#795da3" "#969896"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fec6c786b1d3088091715772839ac6051ed972b17991af04b50e9285a98c7463" "08e47c1b4faf013eadb945fd15748fe4bc98435c75c0e3014541ecdb5adf7196" "5d05adb1e515a6739f6929089497369a70f6e460521200ba0626e2ea819ec18c" "7f6796a9b925f727bbe1781dc65f7f23c0aa4d4dc19613aa3cf96e41a96651e4" "9a58c408a001318ce9b4eab64c620c8e8ebd55d4c52327e354f24d298fb6978f" "5c3ae5c27605201867f0fa0b315cba0761f38502dae6be85c2846af982f9f054" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "f41ecd2c34a9347aeec0a187a87f9668fa8efb843b2606b6d5d92a653abe2439" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" default)))
 '(display-time-mode t)
 '(fci-rule-color "#969896")
 '(nrepl-message-colors
   (quote
    ("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896")))
 '(package-selected-packages
   (quote
    (evil-magit magit powerline-evil smart-mode-line-powerline-theme smart-mode-line pretty-mode pretty-symbols powerline auto-complete kaolin-themes github-theme challenger-deep-theme gruvbox-theme klere-theme monokai-alt-theme aggressive-indent smartparens smooth-scroll ivy org-pomodoro org evil)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(sml/mode-width
   (if
       (eq
	(powerline-current-separator)
	(quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote sml/global)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active2)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(smooth-scroll-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#b0cde7")
 '(vc-annotate-color-map
   (quote
    ((20 . "#969896")
     (40 . "#183691")
     (60 . "#969896")
     (80 . "#969896")
     (100 . "#969896")
     (120 . "#a71d5d")
     (140 . "#969896")
     (160 . "#969896")
     (180 . "#969896")
     (200 . "#969896")
     (220 . "#63a35c")
     (240 . "#0086b3")
     (260 . "#795da3")
     (280 . "#969896")
     (300 . "#0086b3")
     (320 . "#969896")
     (340 . "#a71d5d")
     (360 . "#969896"))))
 '(vc-annotate-very-old-color "#969896"))



;; Load Theme
(load-theme 'gruvbox-dark-hard)

(put 'dired-find-alternate-file 'disabled nil)
