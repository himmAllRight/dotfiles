; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     shell-scripts
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Completion/Checking
     helm
     auto-completion
     better-defaults
     syntax-checking

     ;; Markdowns/Writting
     spell-checking
     org
     markdown
     html
     latex
     yaml

     ;; Programming Languages
     ;; Lisps/Function
     emacs-lisp
     clojure
     common-lisp
     racket
     scheme
     haskell
     ;; Systems
     c-c++
     rust
     ;; All Purpose
     python
     go

     ;; Tools
     git
     github
     tmux
     shell
     finance
     ranger

     ;; Pair Program
     floobits

     ;; Themes
     ;;themes-megapack

     ;; OS
     ;; systemd
     ;;nixos

     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(wc-mode
                                      synonyms

                                      ;; Themes
                                      monokai-alt-theme
                                      badger-theme
                                      base16-theme
                                      gruvbox-theme
                                      avk-emacs-themes
                                      gotham-theme
                                      kaolin-themes
                                      sourcerer-theme
                                      creamsody-theme
                                      paganini-theme
                                      yoshi-theme
                                      github-modern-theme
                                      flatland-theme
                                      molokai-theme
                                      badwolf-theme
                                      emojify

                                      ;; Coding
                                      pretty-lambdada
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text 
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai-alt
                         wombat
                         kaolin
                         creamsody
                         github-modern)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 11
                               :weight bold
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (spacemacs|use-package-add-hook org
    :pre-init
    (package-initialize)
    )

  (setq zoom-temp-window-configuration nil)
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

  ;; Crates a commented code section header
  (defun create-header (in-string &optional width)
    (interactive "r")
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

      (insert (create-header in-string width))

      (message width)
      ))

  ;; Like insert-header but without user prompts.
  (defun insert-header2 (in-string &optional width)
    (unless width
      (setf width 80))
    (insert (create-header in-string width)))

  ;; Keybind
  (global-set-key (kbd "C-c z") 'zoom-window)

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
  (global-linum-mode t)

  ;; Dev stuff
  (smartparens-global-mode t)
  (global-pretty-lambda-mode t)
  (global-aggressive-indent-mode t)
  (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
  (add-to-list 'auto-mode-alist '("\\.lpr\\'" . lisp-mode))

  ;; Org Agenda stuff
  (setq org-agenda-files '("~/nextcloud/emacs/org/archive/work.org"))

  ;; Code Style stuff for CS61
  (setq c-basic-offset 4)

  ;; Fix current issues in spacemacs
  (require 'helm-bookmark)

  )



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight bold :height 88 :width normal)))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#26292c" "#ff4a52" "#40b83e" "#f6f080" "#afc4db" "#dc8cc3" "#93e0e3" "#f8f8f8"])
 '(ansi-term-color-vector
   [unspecified "#485867" "#b38686" "#87b386" "#aab386" "#868cb3" "#b386b2" "#868cb3" "#b0c5c8"] t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "44c566df0e1dfddc60621711155b1be4665dd3520b290cb354f8270ca57f8788" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "b550fc3d6f0407185ace746913449f6ed5ddc4a9f0cf3be218af4fb3127c7877" "2e2ecba9a216bc734276a0642def5fccec44ee1facb4b6562a74e7fdcd5db997" "355e1c0eb7cd20794e983b4c6f5c0c978a85b159d6aadb2fae15faa25fb344e5" "628cc301749fc392d32c26ba913402967a17d9f44c0a2b5e4c77850b50b5588b" "df258df60e7e87aa3f3b0ba727f54d6c968036e23ac60673b8375525e5ea9c28" "2f9216992371bcc9bc26bca11698d9c778ef4609ad94f86e4810607bf0fde82e" "b447129c5efd45c7dcfaaf99b94caf479637ff205b4e5b566efc7ce5496272ab" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "77a46326228485699b378a8537f9bc5d6b0d087566ac179bec752fab322d814a" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "c0429683ff6ea4bed2f3d5a1c94717dff22d4f52ec1f5ebaf67dfab5d78787f1" "20e23cba00cf376ea6f20049022241c02a315547fc86df007544852c94ab44cb" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "7f3ef7724515515443f961ef87fee655750512473b1f5bf890e2dc7e065f240c" "2b6bd2ebad907ee42b3ffefa4831f348e3652ea8245570cdda67f0034f07db93" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#202325" t)
 '(kaolin-hl-line-colored t)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#032f62" "#6a737d" "#d73a49" "#6a737d" "#005cc5" "#6f42c1" "#d73a49" "#6a737d")))
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (powerline slime faceup alert log4e gntp org-plus-contrib markdown-mode macrostep parent-mode projectile request haml-mode gitignore-mode gh marshal logito pcache flyspell-correct pos-tip flycheck flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree ht diminish autothemer web-completion-data dash-functional go-mode ghc haskell-mode company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl rust-mode bind-map bind-key yasnippet packed auctex anaconda-mode pythonic f dash s helm avy helm-core async auto-complete popup monokai-alt-theme auctex-latexmk xkcd kaolin-themes gruvbox-dark-hard-theme-theme gruvbox-dark-hard-theme web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern tern coffee-mode floobits rainbow-mode base16-theme yoshi-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode wc-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill toml-mode toc-org tagedit synonyms spaceline sourcerer-theme smeargle slime-company slim-mode shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters racket-mode racer pyvenv pytest pyenv-mode py-isort pug-mode pretty-lambdada popwin pip-requirements persp-mode pcre2el paradox paganini-theme orgit org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text molokai-theme mmm-mode markdown-toc magit-gitflow magit-gh-pulls lorem-ipsum live-py-mode linum-relative link-hint less-css-mode ledger-mode kaolin-theme intero insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets gruvbox-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot github-search github-modern-theme github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md geiser fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-ledger flycheck-haskell flx-ido flatland-theme fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emojify emmet-mode elisp-slime-nav dumb-jump disaster define-word cython-mode csv-mode creamsody-theme company-web company-statistics company-shell company-go company-ghci company-ghc company-cabal company-c-headers company-auctex company-anaconda common-lisp-snippets column-enforce-mode cmm-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu cargo badwolf-theme badger-theme avk-emacs-themes auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#6a737d" . "#fffbdd")))
 '(pos-tip-background-color "#1A3734")
 '(pos-tip-foreground-color "#FFFFC8")
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
 '(vc-annotate-very-old-color "#dc8cc3")
 '(window-divider-default-right-width 1)
 '(window-divider-mode t))



