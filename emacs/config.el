
(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode t))

(use-package smartparens
  :ensure t
  :config
  ;; Remove ' and  from pairing
  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" "'" :actions :rem))

(use-package magit
  :ensure t
  :bind 
  (("C-c g"   . 'magit-status)))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)

  (use-package counsel-projectile
    :ensure t
    )
  )

;; (require 'pretty-mode)
;; (pretty-lambda-mode t)

;;(global-pretty-lambda-mode t)

(add-hook 'before-save-hook 'gofmt-before-save)

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

(when (string-equal (upcase system-name) "LAFAYETTE")
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
    (counsel-projectile projectile ess org-babel-eval-in-repl org-beautify-theme sly sly-mode markdown-mode magit aggressive-indent smartparens auto-complete org-pomodoro counsel swiper ivy monokai-alt-theme powerline-evil evil-org evil-indent-textobject evil-surround evil-leader evil use-package)))
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
 '(default ((((class color) (min-colors 89)) (:background "#262626" :foreground "#f8f8f2")))))

;; Load Theme
(when (package-installed-p 'creamsody-theme)
  (load-theme 'creamsody))
(put 'dired-find-alternate-file 'disabled nil)
