(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (smart-mode-line-light)))
 '(custom-safe-themes
   (quote
    ("6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#c7c7c7")
 '(font-use-system-font t)
 '(load-theme atom-dark)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-color-map
   (quote
    ((20 . "#437c7c")
     (40 . "#336c6c")
     (60 . "#205070")
     (80 . "#2f4070")
     (100 . "#1f3060")
     (120 . "#0f2050")
     (140 . "#a080a0")
     (160 . "#806080")
     (180 . "#704d70")
     (200 . "#603a60")
     (220 . "#502750")
     (240 . "#401440")
     (260 . "#6c1f1c")
     (280 . "#935f5c")
     (300 . "#834744")
     (320 . "#732f2c")
     (340 . "#6b400c")
     (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Package Management ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add Melpa Repos
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )



;; Ryan Added
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load specific config files
(load "~/.emacs_secret")		                     ; Personal stuff
(load "~/dotfiles/emacs/emacs_linux")	     ; Linux Specifics
;;(load "~/dotfiles/emacs/emacs_windows")    ; Windows Specifics (Boo)

;; Backup all files in 1 place.
(setq backup-directory-alist '(("." . "~/owncloud/emacs/backups")))

 ;; Remove splash screen and use *scratch* as home
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)  

;; Load Smart-mode-lines
;(require 'smart-mode-line)
(sml/setup)

;; Monitor thing
(require 'symon)
(symon-mode)

;; Lines  on
(global-linum-mode 1)

;; Menubar off by default
(menu-bar-mode -1)

;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; New line for C-n
(setq net-line-add-newlines t)

;; Tool Tips in echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Redisplay pause
(setq redisplay-dont-pause t)


;; Stuff to auto find files better
;; ido path completemode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; ido version of imenu bind
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; Supercharge recentf
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Org Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-Mode Global list of my TODOs
(setq org-agenda-files (list "~/owncloud/emacs/org/work.org"
                             "~/owncloud/emacs/org/homeorg" 
                             "~/owncloud/emacs/org/me.org"))

;; Persistent Clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Applications ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Twittering
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; EMMS Multimendia player
(require 'emms-setup)
(emms-standard)
(emms-default-players)

'(elfeed-feeds
   (quote
    ("http://www.theminimalists.com/feed/" "http://feeds.feedburner.com/StudyHacks" "http://www.rowdykittens.com/feed/" "http://zenhabits.net/feed" "zenhabits.net/feed" "http://sachachua.com/blog/feed/")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Key Bindings ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m
(eval-after-load 'w3m
  '(progn
     (define-key w3m-mode-map "q" 'w3m-previous-buffer)
     (define-key w3m-mode-map "w" 'w3m-next-buffer)
     (define-key w3m-mode-map "x" 'w3m-close-window)))

;; Spell Check Word key-binds
(global-set-key (kbd "C-c w") 'ispell-word)
(global-set-key (kbd "C-c r") 'ispell-region)

;; Toggle menubar keybind
(global-set-key (kbd "C-c m") 'menu-bar-mode)

;; Eshell launch keybind
(global-set-key (kbd "C-c t") 'eshell)

;; run allegro-common lisp
(global-set-key (kbd "C-c l") 'fi:common-lisp)

;; run elfeed keybind
(global-set-key (kbd "C-c p") 'elfeed)

