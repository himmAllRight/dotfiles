(setq sml/no-confirm-load-theme t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#26292c" "#ff4a52" "#40b83e" "#f6f080" "#afc4db" "#dc8cc3" "#93e0e3" "#f8f8f8"])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "c39ae5721fce3a07a27a685c08e4b856a13780dbc755a569bb4393c932f226d7" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#202325")
 '(font-use-system-font t)
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")))
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(package-selected-packages
   (quote
    (alect-themes airline-themes color-theme-sanityinc-solarized color-theme-buffer-local yoshi-theme markdown-preview-mode flatui-theme badwolf-theme flatland-theme smooth-scroll helm auto-complete recentf helm-swoop w3m spotify smartparens smart-mode-line slime rust-mode pretty-lambdada pianobar persistent-scratch org-pomodoro org-page multiple-cursors molokai-theme material-theme markdown-mode magit jazz-theme indent-guide highlight-parentheses hide-comnt helm-spotify flymd flymake-yaml erc-image badger-theme aggressive-indent ac-helm)))
 '(scroll-bar-mode nil)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "simp" :slant normal :weight normal :height 98 :width normal)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Package Management ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add Melpa Repos
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


;; Emacs Configs
;; Backup all files in 1 place.
(setq backup-directory-alist '(("." . "~/nextcloud/emacs/backups")))

 ;; Remove splash screen and use *scratch* as home
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Load Smart-mode-lines
(require 'smart-mode-line)
(sml/setup)

(setq-default indent-tabs-mode nil)

;; Lines  on
(global-linum-mode 1)

;; Menubar off by default
(menu-bar-mode -1)

;; remove splash screen and use *scratch*
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; New line for C-n
(setq net-line-add-newlines t)

;; Tool Tips in echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Toggle menubar keybind
(global-set-key (kbd "C-c m") 'menu-bar-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Org Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add Wrap org-mode code with appropriate code section
(defun org-code (start end)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Key Bindings  ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell Check Word key-binds
(global-set-key (kbd "C-c w") 'ispell-word)
(global-set-key (kbd "C-c r") 'ispell-region)

;; Toggle menubar keybind
(global-set-key (kbd "C-c m") 'menu-bar-mode)

;; Eshell launch keybind
(global-set-key (kbd "C-c t") 'eshell)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Helm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(require 'ac-helm)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(global-set-key (kbd "C-r") 'helm-recentf)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "M-s") 'helm-multi-swoop-current-mode)

(helm-autoresize-mode t)

(setq helm-swoop-speed-or-color t)
(set-face-attribute 'helm-selection nil
                    :background "purple"
                    :foreground "white")

;; (global-set-key (kbd "M-i") 'helm-swoop)
 (global-set-key (kbd "M-l") 'helm-multi-swoop)




;;; IDE Stuff

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
;; Keybind
(global-set-key (kbd "C-c z") 'zoom-window)

;; Crates a commented code section header
(defun create-header (in-string &optional width)
  (unless width
    (setf width 80))

  (let*  ((comment-char ?\;)
          (outString (concatenate 'string " " in-string " "))
          (side-buffer-count (/ (- width (length outString)) 2))
          (middle-line (concatenate 'string
                                    (make-string side-buffer-count comment-char)
                                    " " in-string " "
                                    (make-string
                                     (- width (+ side-buffer-count (length outString)))
                                     comment-char)))
          (buffer (make-string width comment-char)))

    (concatenate 'string buffer "\n" middle-line "\n" buffer)))


;; Prompts user for Header text and option width, and inserts header into buffer.
(defun insert-header (in-string &optional width)
  (interactive "r")
  (let ((in-string (read-from-minibuffer "Header Text: "))
        (width (read-from-minibuffer "Width (Enter for default [80]): ")))
    (message width)
    (if (eq width "")
        (setf width 80)
      (setf width (string-to-number width)))
    (insert (length in-string))
    (message (width))
    (when (> (+ 2 (length in-string)) width)
      (error "Error: Header string is too long. String can at max (width - 2) characters long."))

    (insert (create-header in-string width))))

;; Smooth Scroll
(require 'smooth-scroll)

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




(load-theme 'badwolf)
(put 'dired-find-alternate-file 'disabled nil)
