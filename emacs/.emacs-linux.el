;; Load file just for Linux computers

;; Common Lisp Sly Setup
(use-package sly
  :ensure t
  :config
  (setq inferior-lisp "/usr/bin/sbcl"))

;; Settings for Spell Check
(when (package-installed-p 'ispell)
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "american"))
