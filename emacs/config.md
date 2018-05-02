<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">Repos &amp; Core Packages</a>
<ul>
<li><a href="#sec-1-1">Melpa</a></li>
<li><a href="#sec-1-2">Setup <code>use-package</code> if isn't already</a></li>
</ul>
</li>
<li><a href="#sec-2">Core Setup</a>
<ul>
<li><a href="#sec-2-1">Basic Stuff</a></li>
<li><a href="#sec-2-2">Themes</a></li>
</ul>
</li>
<li><a href="#sec-3">Evil Mode</a></li>
<li><a href="#sec-4">Ivy</a></li>
<li><a href="#sec-5">Key Bindings</a></li>
<li><a href="#sec-6">Writting</a>
<ul>
<li><a href="#sec-6-1">Org Mode</a></li>
<li><a href="#sec-6-2">Markdown</a></li>
</ul>
</li>
<li><a href="#sec-7">Development</a>
<ul>
<li><a href="#sec-7-1">Auto Complete</a></li>
<li><a href="#sec-7-2">Indentation</a></li>
<li><a href="#sec-7-3">Parens</a></li>
<li><a href="#sec-7-4">Git</a></li>
<li><a href="#sec-7-5">Projects</a></li>
<li><a href="#sec-7-6">Pretty Code</a></li>
</ul>
</li>
<li><a href="#sec-8">My Random Functions</a>
<ul>
<li><a href="#sec-8-1">Zoom-Window</a></li>
<li><a href="#sec-8-2">eshell-clear-buffer</a></li>
</ul>
</li>
<li><a href="#sec-9">Load Other Configs</a>
<ul>
<li><a href="#sec-9-1">Work Settings</a></li>
<li><a href="#sec-9-2">Linux</a></li>
</ul>
</li>
<li><a href="#sec-10">The Rest</a>
<ul>
<li><a href="#sec-10-1">Auto Generated Stuff</a></li>
<li><a href="#sec-10-2">Theme Load</a></li>
</ul>
</li>
</ul>
</div>
</div>

So I just learned about the org babel stuff, and I think I might save
my emacs configuration in an org file like this, and then have emacs
just load it with org-babel&#x2026; It deff makes it easier to navigate
around the file&#x2026;

# Repos & Core Packages<a id="sec-1" name="sec-1"></a>

## Melpa<a id="sec-1-1" name="sec-1-1"></a>

Melpa is the big package repo that nearly *everything* can be
found. It's a must for emacs configs.

    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (package-initialize)

## Setup `use-package` if isn't already<a id="sec-1-2" name="sec-1-2"></a>

    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    
    (eval-when-compile
      (require 'use-package))

# Core Setup<a id="sec-2" name="sec-2"></a>

## Basic Stuff<a id="sec-2-1" name="sec-2-1"></a>

Remove splash screen and use **scratch** instead as the home buffer

    (setq inhibit-startup-message t
          inhibit-startup-echo-area-message t)

Funnel all the auto backup files to one location.

    (setq backup-directory-alist '(("." . "~/nextcloud/emacs/backups")))

Switch line numbers on by default in all buffers

    (global-linum-mode 1)

Switch the Menubar off by default (I like to keep everything clean)

    (menu-bar-mode -1)

New lines auto indents

    (define-key global-map (kbd "RET")
      'newline-and-indent)

Tool Tips in echo area

    (tooltip-mode -1)
    (setq tooltip-use-echo-area t)

Smooth Scrolling

    ;;(require 'smooth-scroll)

## Themes<a id="sec-2-2" name="sec-2-2"></a>

    (use-package monokai-alt-theme
      :ensure t)
    ;;  (use-package gruvbox-theme
    ;;         :ensure t)
    ;; (use-package darkokai-theme
    ;;         :ensure t)
    ;; (use-package darktooth-theme
    ;;         :ensure t)
    ;; (use-package creamsody-theme
    ;;         :ensure t)
    ;; (use-package github-theme
    ;;   :ensure t)

# Evil Mode<a id="sec-3" name="sec-3"></a>

Here is my Evile Mode setup. I've nested other `use-pacages` inside of
it, so that if I am using `evil`, the packages that depend on it go
ahead and configure themselves.

    ;; Evil Mode
    (use-package evil
      :ensure t
      :config
    
      (evil-mode 1)
      (use-package evil-leader
        :ensure t
        :config
        (global-evil-leader-mode t)
        (evil-leader/set-leader "<SPC>")
        (evil-leader/set-key
          "s s" 'swiper
          "d x w" 'delete-trailing-whitespace)) 
    
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

# Ivy<a id="sec-4" name="sec-4"></a>

Setup and use Ivy

    (use-package ivy
      :ensure t
      :config
      (ivy-mode 1)
      (setq ivy-use-virtual-buffers t)
      (setq enable-recursive-minibuffers t)
      ;; Ivy Keybindings
      (global-set-key (kbd "C-c C-r") 'ivy-resume))

Configure Swiper

    (use-package swiper
      :ensure t
      :config
      (global-set-key "\C-s" 'swiper)
      )

Counsel configuration

    (use-package counsel 
      :ensure t
      :config 
      (global-set-key (kbd "M-x") 'counsel-M-x)
      (global-set-key (kbd "C-x C-f") 'counsel-find-file))

# Key Bindings<a id="sec-5" name="sec-5"></a>

These will eventually be relocations to just be included with their
respective `use-package` calls&#x2026;

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

# Writting<a id="sec-6" name="sec-6"></a>

## Org Mode<a id="sec-6-1" name="sec-6-1"></a>

Yes. It get's it's own section. Again, I've nested everything. I might
break that up though now if I the babel stuff to generate my
configs&#x2026;

    (use-package org
      :ensure t
      :config
    
      (setq org-todo-keywords '((sequence "TODO" "In Progress" "|" "Waiting" "DONE" "DONE DONE")))
    
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

## Markdown<a id="sec-6-2" name="sec-6-2"></a>

    (use-package markdown-mode
      :ensure t)

# Development<a id="sec-7" name="sec-7"></a>

## Auto Complete<a id="sec-7-1" name="sec-7-1"></a>

    (use-package auto-complete
      :ensure t
      :config
      (ac-config-default))

## Indentation<a id="sec-7-2" name="sec-7-2"></a>

`aggressive-indent` automatically indents buffers as I type out my
code. I love it.

    (use-package aggressive-indent
      :ensure t
      :config
      (global-aggressive-indent-mode t))

## Parens<a id="sec-7-3" name="sec-7-3"></a>

smart parens does auto paring for my parenthesis

    (use-package smartparens
      :ensure t
      :config
      ;; Remove ' and  from pairing
      (sp-pair "'" nil :actions :rem)
      (sp-pair "`" "'" :actions :rem))

## Git<a id="sec-7-4" name="sec-7-4"></a>

I use magit for easy git management

    (use-package magit
      :ensure t
      :config 
      (global-set-key (kbd "C-c g") 'magit-status))

## Projects<a id="sec-7-5" name="sec-7-5"></a>

Starting to learn projectile a little bit&#x2026;

    (use-package projectile
      :ensure t
      :config
      (projectile-global-mode)
    
      (use-package counsel-projectile
        :ensure t
        )
      )

## Pretty Code<a id="sec-7-6" name="sec-7-6"></a>

    ;; (require 'pretty-mode)
    ;; (pretty-lambda-mode t)
    
    ;;(global-pretty-lambda-mode t)

# My Random Functions<a id="sec-8" name="sec-8"></a>

## Zoom-Window<a id="sec-8-1" name="sec-8-1"></a>

Saves the current state of the buffers, and then zooms the current
buffer full screen. When called again, goes back to origonal buffer
setup.

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

## eshell-clear-buffer<a id="sec-8-2" name="sec-8-2"></a>

Clears my eshell more like a normal terminal would

    (defun eshell-clear-buffer ()
      "Clear terminal"
      (interactive)
      (let ((inhibit-read-only t))
        (erase-buffer)
        (eshell-send-input)))

I need this hook for the function, and I like to set it to a keybind:

    (add-hook 'eshell-mode-hook
              '(lambda()
                 (local-set-key (kbd "C-l") 'eshell-clear-buffer)))
    
    (global-set-key (kbd "C-c <delete>") 'eshell-clear-buffer)

# Load Other Configs<a id="sec-9" name="sec-9"></a>

## Work Settings<a id="sec-9-1" name="sec-9-1"></a>

Load functions for using Allegro when on Work computer

    (when (string-equal (upcase system-name) "LAFAYETTE")
      (load "~/.emacs-work.el"))

## Linux<a id="sec-9-2" name="sec-9-2"></a>

Load my Linux-specific configs

    (when (string-equal system-type "gnu/linux")
      (load "~/.emacs-linux.el"))

# The Rest<a id="sec-10" name="sec-10"></a>

## Auto Generated Stuff<a id="sec-10-1" name="sec-10-1"></a>

Not sure what to do with this crap in my babel org config&#x2026;

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

## Theme Load<a id="sec-10-2" name="sec-10-2"></a>

I like to load the theme after the custom stuff the GUI adds, so I
don't have to verify loading it whenever emacs boots up.

    ;; Load Theme
    (when (package-installed-p 'creamsody-theme)
      (load-theme 'creamsody))
    (put 'dired-find-alternate-file 'disabled nil)