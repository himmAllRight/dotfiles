;; Load file just for Linux computers

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp "/usr/bin/sbcl"))
