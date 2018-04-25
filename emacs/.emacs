;;Base Emacs Configuration

;; Add Melpa packages to Repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Core Setup ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Remove splash screen and use *scratch* as home buffer
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq backup-directory-alist '(("." . "~/nextcloud/emacs/backups")))

;; Evil Mode
(use-package evil
  :ensure t
  :config

  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-org
    :ensure t
    :config
    (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
    (add-hook 'org-mode-hook (lambda () (evil-org-mode))))

  (use-package powerline-evil
    :ensure t
    :config
    (powerline-evil-vim-color-theme)
    )
  )


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
;;(require 'smooth-scroll)

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

;; Themes
(use-package monokai-alt-theme
  :ensure t)
;; (use-package gruvbox-theme
;; 	     :ensure t)
;; (use-package darkokai-theme
;; 	     :ensure t)
;; (use-package darktooth-theme
;; 	     :ensure t)
;; (use-package creamsody-theme
;; 	     :ensure t)
;; (use-package github-theme
;;   :ensure t)


;;;;;;;;;;;;;;;;;;;;
;;;;; Ivy Mode ;;;;;
;;;;;;;;;;;;;;;;;;;;
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; Ivy Keybindings
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel 
  :ensure t
  :config 
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Key Bindings ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell Check Word key-binds
(global-set-key (kbd "C-c w") 'ispell-word)
(global-set-key (kbd "C-c r") 'ispell-region)

;; ;; Toggle menubar keybind
(global-set-key (kbd "C-c m") 'menu-bar-mode)

;; ;; Eshell launch keybind
(global-set-key (kbd "C-c t") 'eshell)

;; ;; Comment/Uncomment region
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
(use-package markdown-mode
  :ensure t)

;;;;;;;;;;;;;
;; Org Mode;;
;;;;;;;;;;;;;

(defun open-org-file ()
  (interactive)
  (find-file "~/nextcloud/emacs/org/archive/work.org"))


(use-package org
  :ensure t
  :config

  (evil-leader/set-key-for-mode 'org-mode
    "m i" 'org-clock-in
    "m C" 'org-toggle-checkbox
    "m o" 'org-clock-out
    "m c" 'org-clock-jump-to-current-clock
    "m d" 'org-clock-display
    "m e" 'org-set-effort
    "m p" 'org-pomodoro
    "m t" 'org-set-tags-command
    "m m" 'org-clock-modify-effort-estimate
    "m s" 'org-schedule)
  
  ;; ;; Org Agenda stuff
  (setq org-agenda-files '("~/nextcloud/emacs/org/archive/work.org"))
  
  (defun org-code (start end)
    "Wraps selected text with org code tags"
    (interactive "r")
    (let ((selected-text (buffer-substring (mark) (point)))
  	  (db-name (read-from-minibuffer "Language[common-lisp]: ")))
      (when (eq db-name "")
  	(setf db-name "common-lisp"))
      (kill-region start end)
      (insert (format "#+BEGIN_SRC %s \n%s \n#+END_SRC" db-name selected-text))))

  (use-package org-pomodoro
    :ensure t
    :config
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
      (setf org-pomodoro-long-break-length 17)))
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Developer Settings ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'pretty-mode)
;; (pretty-lambda-mode t)

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package smartparens
  :ensure t
  :config
  ;; Remove ' and  from pairing
  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" "'" :actions :rem))


;;(global-pretty-lambda-mode t)
(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode t))

;; Magit
(use-package magit
  :ensure t
  :config 
  (global-set-key (kbd "C-c g") 'magit-status))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; Work Settings ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Settings for Spell Check
(when (package-installed-p 'ispell)
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "american"))



;;;;;;;;;;;;;;;;;;;;;;
;; Load Other Files ;;
;;;;;;;;;;;;;;;;;;;;;;
;; Load functions for using Allegro when on Work computer
(when (string-equal system-name "LAFAYETTE")
  (load "~/.emacs-work.el"))


(when (string-equal system-type "gnu/linux")
  (load "~/.emacs-linux.el"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings added by emacs GUI options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242728" "#ff0066" "#63de5d" "#E6DB74" "#06d8ff" "#ff8eff" "#53f2dc" "#f8fbfc"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "3b5ce826b9c9f455b7c4c8bff22c020779383a12f2f57bf2eb25139244bb7290" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#424748")
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896")))
 '(package-selected-packages
   (quote
    (markdown-mode magit aggressive-indent smartparens auto-complete org-pomodoro counsel swiper ivy monokai-alt-theme powerline-evil evil-org evil-indent-textobject evil-surround evil-leader evil use-package)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Load Theme
(when (package-installed-p 'creamsody-theme)
  (load-theme 'creamsody))
(put 'dired-find-alternate-file 'disabled nil)
