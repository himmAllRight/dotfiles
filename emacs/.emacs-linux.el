;; Load file just for Linux computers

(use-package sly-mode
  :ensure t
  :config
  (setq inferior-lisp "/usr/bin/sbcl"))
