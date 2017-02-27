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
     python
     ruby
     rust
     (shell :variables
            shell-default-shell 'eshell
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
   dotspacemacs-additional-packages '()
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
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
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
   ;; Evil mode
   evil-shift-round nil

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Org mode
   org-tags-column -80
   org-startup-indented t
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
   org-default-notes-file "~/Dropbox/org/capture.org"
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
   '((sequence "TODO(t)" "|" "DONE(D)")
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
  (setq deft-directory "~/Dropbox/org"
        deft-use-filter-string-for-filename t
        deft-use-filename-as-title t
        deft-extensions '("txt" "md" "org")
        deft-text-mode 'org-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yapfify yaml-mode xterm-color wolfram-mode web-mode web-beautify toml-mode thrift tagedit stan-mode smeargle slim-mode shell-pop scss-mode scad-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder rbenv rake rainbow-mode rainbow-identifiers racer qml-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy pandoc-mode ox-pandoc osx-trash osx-dictionary orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download multi-term mmm-mode minitest matlab-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl julia-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-pydoc helm-gtags helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags flycheck-rust seq flycheck-pos-tip flycheck evil-snipe evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode disaster diff-hl deft dash-at-point cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-c-headers company-anaconda company color-identifiers-mode coffee-mode cmake-mode clang-format chruby cargo rust-mode bundler inf-ruby auto-yasnippet yasnippet arduino-mode anaconda-mode pythonic ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
