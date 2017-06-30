;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-help-tooltip 'manual
                      :disabled-for org erc)
     (c-c++ :variables c-c++-enable-clang-support t)
     colors
     dash
     deft
     docker
     emacs-lisp
     erc
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     extra-langs
     git
     github
     html
     markdown
     osx
     org
     pandoc
     python
     puppet
     ranger
     ruby
     rust
     (scala :variables
            ensime-startup-snapshot-notification nil
            ensime-startup-notification nil)
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all
              theming-headings-bold 'all)
     version-control
     yaml
     )
   dotspacemacs-additional-packages '(all-the-icons)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'nil
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         monokai
                         sanityinc-solarized-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Hack"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   ;; Cursor
   cursor-type 'bar

   ;; Split window vertically
   ;; split-height-threshold nil
   ;; split-width-threshold 0

   ;; Evil mode
   evil-shift-round nil

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Org mode
   org-tags-column -100
   org-startup-indented t
   org-src-tab-acts-natively t
   org-startup-align-all-tables t
   org-footnote-auto-adjust t
   org-footnote-auto-label 'confirm
   org-M-RET-may-split-line
   '((headline . nil) (item . nil) (table . nil))
   org-agenda-restore-windows-after-quit t
   org-catch-invisible-edits 'show-and-error
   org-list-demote-modify-bullet '(("-" . "*") ("*" . "+") ("+" . "-"))
   org-list-allow-alphabetical t
   org-directory "~/Dropbox/org"
   org-default-notes-file (concat org-directory "/capture.org")
   org-capture-templates
   '(("t" "Tasks")
     ("tg" "General" entry (file+headline "" "Tasks")
      "* TODO %?\n%i\n%T"
      :empty-lines 1)
     ("tl" "Location" entry (file+headline "" "Tasks")
      "* TODO %?\n%i\n%T\n%a"
      :empty-lines 1)
     ("n" "Notes")
     ("ng" "General" entry (file+headline "" "Notes")
      "* %?\n%i\n%T"
      :empty-lines 1)
     ("nl" "Location" entry (file+headline "" "Notes")
      "* %?\n%i\n%T\n%a"
      :empty-lines 1))
   org-todo-keywords
   '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(D)")
     (type "SIMPLE(s)" "FAST-TRACK(f)" "CONFLICTING(c)" "WAITING(w)" "DUBIOUS(d)"
           "|" "MERGED(M)" "CLOSED(C)"))
   org-todo-keyword-faces
   '(("SIMPLE" . "khaki2")
     ("FAST-TRACK" . "OrangeRed1")
     ("WAITING" . "deepskyblue1"))
   org-agenda-files (list org-directory)

   ;; Theming
   monokai-highlight-line "#3A3A3A"
   theming-modifications
  '((monokai
      ;; Font locking
      (font-lock-comment-face :slant italic)
      (font-lock-string-face :slant italic)
      (font-lock-doc-face :slant italic)
      (font-lock-keyword-face :weight bold :foreground "#ff4185")
      (font-lock-builtin-face :foreground "#ffabd6" :weight semi-bold)
      (font-lock-warning-face :underline nil)
      (web-mode-html-attr-value-face
      :inherit font-lock-string-face :foreground nil)
      (web-mode-html-attr-name-face
      :inherit font-lock-variable-name-face :foreground nil)
      (web-mode-html-tag-face
      :inherit font-lock-builtin-face :foreground nil :weight bold)
      (web-mode-html-tag-bracket-face
      :inherit web-mode-html-tag-face :foreground nil)
      (web-mode-comment-face
      :inherit font-lock-comment-face :foreground nil)

      ;; Modeline
      (header-line :box (:color "#555555" :line-width 1))
      (mode-line :box (:color "#999999" :line-width 1 :style released-button))
      (powerline-active1 :box (:color "#999999" :line-width 1 :style released-button)
                        :background "#5a5a5a")
      (powerline-active2 :box (:color "#999999" :line-width 1 :style released-button))
      (mode-line-inactive :box (:color "#666666" :line-width 1 :style released-button))
      (powerline-inactive1 :box (:color "#666666" :line-width 1 :style released-button))
      (powerline-inactive2 :box (:color "#666666" :line-width 1 :style released-button))
      (helm-prefarg :foreground "PaleGreen")

      ;; Flycheck
      (flycheck-fringe-error :background nil)
      (flycheck-fringe-warning :background nil)
      (flycheck-fringe-info :background nil)

      ;; Other
      (company-tooltip-annotation :foreground "#ff9eb8")
      (company-tooltip-annotation-selection :background "#66d9ef")
      (erc-timestamp-face
      :inherit font-lock-comment-face :foreground nil)
      (evil-search-highlight-persist-highlight-face
      :background "#fc5fef" :foreground "#000000")
      (font-latex-verbatim-face :inherit nil)
      (helm-ff-prefix :background nil :foreground "#666666" :weight bold)
      (org-done :foreground "MediumSpringGreen")
      (region :background "#998f84")
      (spacemacs-transient-state-title-face :background nil :foreground nil :inherit font-lock-warning-face)
      (term :foreground nil :background nil)))

    ;; Shell
    shell-default-term-shell "/bin/zsh"
    exec-path-from-shell-arguments '("-l")
   )
  )

(defun dotspacemacs/user-config ()
  ;; OSX prevent visual selection overriding system clipboard
  (fset 'evil-visual-update-x-selection 'ignore)
  (setq x-select-enable-clipboard nil)
  ;; Neotree
  (setq neo-theme 'icons)
  (setq all-the-icons-color-icons t
        all-the-icons-for-buffer t)

  ;; Filenames
  (dolist (e '(("xml" . web-mode)
               ("xinp" . web-mode)
               ("C" . web-mode)))
    (push (cons (concat "\\." (car e) "\\'") (cdr e)) auto-mode-alist))
  (dolist (e '(("PKGBUILD" . shell-script-mode)))
    (push e auto-mode-alist))
  (with-eval-after-load 'projectile
    (push '("C" "h") projectile-other-file-alist))

  ;; Make linums relative by default
  (with-eval-after-load 'linum
    (linum-relative-toggle))

  ;; Shell
  (setq multi-term-program "/usr/local/bin/zsh")

  ;; Deft
  (setq deft-directory "~/Dropbox/org"
        deft-use-filter-string-for-filename t
        deft-use-filename-as-title t
        deft-extensions '("txt" "md" "org")
        deft-text-mode 'org-mode)

  ;; Whitespace and wrapping
  (add-hook 'org-mode-hook #'toggle-word-wrap)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; C-C++
  (setq c-default-style "linux"
        c-basic-offset 4
        tab-width 4
        indent-tabs-mode t)

  ;; Rust config
  (setq racer-cmd "/Users/ashrith/.cargo/bin/racer")
  (setq racer-rust-src-path "/Users/ashrith/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")

  ;; Misc
  (add-hook 'text-mode-hook 'auto-fill-mode) ;; word wrap only in text mode not in programming mode
  (setq-default fill-column 100)

  ;; Modeline separators
  (setq powerline-default-separator 'alternate)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(compilation-message-face (quote default))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#3A3A3A" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3A3A3A" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3A3A3A" . 100))))
 '(magit-diff-use-overlays nil)
 '(neo-theme (quote icons) t)
 '(package-selected-packages
   (quote
    (puppet-mode railscast-theme noflet ensime sbt-mode scala-mode dockerfile-mode docker tablist docker-tramp color-theme-sanityinc-solarized oceanic-theme-theme oceanic-theme all-the-icons font-lock+ ranger yapfify yaml-mode xterm-color wolfram-mode web-mode web-beautify toml-mode thrift tagedit stan-mode smeargle slim-mode shell-pop scss-mode scad-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder rbenv rake rainbow-mode rainbow-identifiers racer qml-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy pandoc-mode ox-pandoc osx-trash osx-dictionary orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download multi-term mmm-mode minitest matlab-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl julia-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-pydoc helm-gtags helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags flycheck-rust seq flycheck-pos-tip flycheck evil-snipe evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode disaster diff-hl deft dash-at-point cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-c-headers company-anaconda company color-identifiers-mode coffee-mode cmake-mode clang-format chruby cargo rust-mode bundler inf-ruby auto-yasnippet yasnippet arduino-mode anaconda-mode pythonic ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3A3A3A" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-annotation ((t (:foreground "#ff9eb8"))))
 '(company-tooltip-annotation-selection ((t (:background "#66d9ef"))))
 '(erc-timestamp-face ((t (:inherit font-lock-comment-face :foreground nil))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "#fc5fef" :foreground "#000000"))))
 '(flycheck-fringe-error ((t (:background nil))))
 '(flycheck-fringe-info ((t (:background nil))))
 '(flycheck-fringe-warning ((t (:background nil))))
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-verbatim-face ((t (:inherit nil))))
 '(font-lock-builtin-face ((t (:foreground "#ffabd6" :weight semi-bold))))
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-doc-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:weight bold :foreground "#ff4185"))))
 '(font-lock-string-face ((t (:slant italic))))
 '(font-lock-warning-face ((t (:underline nil))))
 '(header-line ((t (:box (:color "#555555" :line-width 1)))))
 '(helm-ff-prefix ((t (:background nil :foreground "#666666" :weight bold))))
 '(helm-prefarg ((t (:foreground "PaleGreen"))))
 '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(mode-line ((t (:box (:color "#999999" :line-width 1 :style released-button)))))
 '(mode-line-inactive ((t (:box (:color "#666666" :line-width 1 :style released-button)))))
 '(org-document-title ((t (:inherit default :height 1.0 :weight bold))))
 '(org-done ((t (:foreground "MediumSpringGreen"))))
 '(org-level-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-7 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-8 ((t (:inherit default :height 1.0 :weight bold))))
 '(powerline-active1 ((t (:box (:color "#999999" :line-width 1 :style released-button) :background "#5a5a5a"))))
 '(powerline-active2 ((t (:box (:color "#999999" :line-width 1 :style released-button)))))
 '(powerline-inactive1 ((t (:box (:color "#666666" :line-width 1 :style released-button)))))
 '(powerline-inactive2 ((t (:box (:color "#666666" :line-width 1 :style released-button)))))
 '(region ((t (:background "#998f84"))))
 '(spacemacs-transient-state-title-face ((t (:background nil :foreground nil :inherit font-lock-warning-face))))
 '(term ((t (:foreground nil :background nil))))
 '(web-mode-comment-face ((t (:inherit font-lock-comment-face :foreground nil))))
 '(web-mode-html-attr-name-face ((t (:inherit font-lock-variable-name-face :foreground nil))))
 '(web-mode-html-attr-value-face ((t (:inherit font-lock-string-face :foreground nil))))
 '(web-mode-html-tag-bracket-face ((t (:inherit web-mode-html-tag-face :foreground nil))))
 '(web-mode-html-tag-face ((t (:inherit font-lock-builtin-face :foreground nil :weight bold)))))
