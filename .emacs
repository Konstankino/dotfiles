(add-to-list 'load-path "~/.emacs.d/manual-install/")
(add-to-list 'load-path "~/.emacs.d/manual-install/smartparens")

(require 'package)
; Activate installed packages
(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)


(defun shell-command-to-string (command)
  "Execute shell command COMMAND and return its output as a string."
  (with-output-to-string
    (with-current-buffer standard-output
      (call-process shell-file-name nil t nil shell-command-switch command))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(coffee-tab-width 2 t)
 '(custom-safe-themes
   (quote
    ("2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "357d5abe6f693f2875bb3113f5c031b7031f21717e8078f90d9d9bc3a14bcbd8" "7d29241c918c19f741b3f37e6adc27f3b16f7dc6086f28bea272cd85169659b6" "6e69cab2af9e1ef7f6304bc6c8dc5641fc742ef433e4db81ee4b32077e4245cf" "486759384769d44b22bb46072726c2cfb3ccc3d49342e5af1854784d505ffc01" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "4a9f829d554ec72227c2de650a8a6b57e6682acd078a315553a505e0a954e296" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "405b0ac2ac4667c5dab77b36e3dd87a603ea4717914e30fcf334983f79cfd87e" "d30a78ecaf43c9816c328d4361b3ca21bafb49c6dee4da680997bd98b9e07787" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "2dd32048690787844d8cba601ed3dd8b2f419e9bd985898d0c3792671a05b96b" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade" "c0dd384b870de1c769d37fec8f9ff22f191b1eba7a49b1181d361e7a3c4713f0" default)))
 '(ecb-options-version "2.40")
 '(fci-rule-color "#383838")
 '(handlebars-basic-offset 2)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (origami jedi company-jedi rhtml-mode yasnippet-snippets rjsx-mode jsx-mode markdown-mode markdown-mode+ solarized-theme dired-filter evil-mc-extras evil-mc flycheck flymake-jshint wrap-region blank-mode monokai-theme eslint-fix xo linum-relative multi-term flx-ido zenburn-theme yasnippet yaml-mode web-mode vagrant string-inflection smooth-scroll smart-tabs-mode smart-tab rvm rspec-mode robe rainbow-mode racer python-mode python-django projectile-rails perspective multiple-cursors mmm-mode magit key-chord helm-projectile haml-mode flymake-ruby flymake-coffee expand-region evil enh-ruby-mode company bundler avy autopair auto-complete ag ack ace-jump-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-globally-ignored-files (quote ("*.sql" "tags" "TAGS" ".*\\.sql")))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tab-stop-list (quote (2 4)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))


(defun ensure-package-installed (&rest packages)
      "Assure every package is installed, ask for installation if it’s not.
  Return a list of installed packages or nil for every skipped package."
      (mapcar
       (lambda (package)
   (if (package-installed-p package)
       nil
    (if (y-or-n-p (format "Package %s is missing. Install it? " package))
        (package-install package)
    package)))
packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
(package-refresh-contents))

(ensure-package-installed 'magit 'evil 'saveplace 'autopair 'helm 'helm-projectile 'projectile 'rust-mode 'racer 'company 'auto-complete 'enh-ruby-mode 'ag 'rainbow-mode
        'robe 'rvm 'projectile-rails 'inf-ruby 'flymake-ruby 'rspec-mode 'bundler 'flymake-ruby 'python-django 'python-mode 'multiple-cursors 'ace-jump-mode
        'expand-region 'haml-mode 'avy 'yaml-mode 'vagrant 'ack 'flymake-coffee 'smooth-scroll 'perspective 'yasnippet 'key-chord 'smart-tab 'string-inflection 'web-mode
        'zenburn-theme 'smart-tabs-mode 'mmm-mode 'linum-relative 'evil-mc 'coffee-mode)

;; ('flymake-coffee 'flymake-easy 'flymake-coffee 'ace-jump-mode 'ack 'ag 's 'dash 'auto-complete 'popup 'autopair 'avy 'blank-mode 'bundler
;; 'inf-ruby 'company 'enh-ruby-mode 'evil 'goto-chg 'undo-tree 'expand-region 'flymake-ruby 'flymake-easy 'full-ack 'goto-chg 'haml-mode
;; 'helm-ag 'helm 'helm-core 'async 'async 'helm-projectile 'dash 'projectile 'pkg-info 'epl 'dash 'helm 'helm-core 'async 'async
;; 'highlight-chars 'key-chord 'literate-coffee-mode 'coffee-mode 'magit 'magit-popup 'dash 'async 'git-commit 'with-editor 'dash
;; 'async 'dash 'with-editor 'dash 'async 'dash 'async 'magit-popup 'dash 'async 'multiple-cursors 'popup 'projectile-rails 'rake 'dash 'f
;; 'dash 's 'f 'dash 's 'inf-ruby 'inflections 'projectile 'pkg-info 'epl 'dash 'python-django 'python-mode 'racer 's 'dash 'rust-mode 'rainbow-mode
;; 'rake 'dash 'f 'dash 's 'robe 'inf-ruby 'rspec-mode 'rust-mode 'rvm 's 'undo-tree 'vagrant 'with-editor 'dash 'async 'yaml-mode 'yasnippet)

(setq evil-want-C-i-jump nil)
(require 'evil)
(require 'smart-tab)

(defun bk/find-file (&optional arg)
  "Jump to a project's file using completion.
   With a prefix ARG invalidates the cache first."
  (interactive "P")
  (projectile-maybe-invalidate-cache arg)
  (let ((file (projectile-completing-read "Find file: "
                                          (projectile-current-project-files)
                                          (replace-regexp-in-string "\\([\/\']\\)" " " (string-inflection-underscore-function (projectile-symbol-or-selection-at-point))) )))
    (find-file (expand-file-name file (projectile-project-root)))
    (run-hooks 'projectile-find-file-hook)))

(defun bk/find-selection-in-file (&optional arg)
  (interactive)
  (read-kbd-macro "M-w" nil)
  (evil-search-forward)
  (read-kbd-macro "M-y" nil))

(require 'string-inflection)
(global-unset-key (kbd "M-s"))
(global-set-key (kbd "M-s M-t") 'string-inflection-cycle)

(when (not (display-graphic-p))
    (menu-bar-mode -1))

;; (require 'autopair)
;; (autopair-global-mode)
(show-paren-mode t)

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(setq gdb-many-windows t)

(require 'helm)
(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(projectile-mode)

; Disable start up welcome scree.
(setq inhibit-startup-message t)

;; this disables backup files creation.
(setq make-backup-files nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (load-theme 'wombat t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'zenburn t)
;; (load-theme 'monokai t)
;; (load-theme 'busybee t)
;; (load-theme 'darktooth t)
;; (load-theme 'tsdh-light t)
;; (load-theme 'tsdh-dark t) default
;; (load-theme 'dracula t)
(load-theme 'tango-dark t)

(yas-global-mode)

; Rust autocompletion integration
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; (add-hook 'racer-mode-hook #'company-mode)
;; (setq company-tooltip-align-acompany-mode t)
;; (push 'company-robe company-backends)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))

(global-company-mode t)
(push 'company-robe company-backends)
(add-hook 'racer-mode-hook #'company-mode)


(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

; set indentation in ruby files natural
(setq ruby-deep-indent-paren nil)

; check syntax for ruby files
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

; set autoscrolling during output
(setq compilation-scroll-output t)

; check ruby syntax
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

          ; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
          ; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(setq python-shell-interpreter "ipython")

(delete-selection-mode)

;; Lisp specific defuns
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
       (current-buffer))
    (error (message "Invalid expression")
                (insert (current-kill 0)))))


(defun bk/select-one-line ()
  (interactive)
  (beginning-of-line nil)
  (set-mark-command nil)
  (next-line)
  (beginning-of-line nil))


(unless window-system
  (add-hook 'linum-before-numbering-hook
      (lambda ()
        (setq-local linum-format-fmt
        (let ((w (length (number-to-string
              (count-lines (point-min) (point-max))))))
          (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
  (setq linum-format 'linum-format-func))


(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)

      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )

(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)

(defun add-mode-line-dirtrack ()
  "When editing a file, show the last 2 directories of the current path in the mode line."
  (add-to-list 'mode-line-buffer-identification
         '(:eval (substring default-directory
          (+ 1 (string-match "/[^/]+/[^/]+/$" default-directory)) nil))))
  (add-hook 'find-file-hook 'add-mode-line-dirtrack)

(defun find-file-selected ()
  (interactive)
  (read-kbd-macro "M-w" nil)
  (projectile-find-file nil)
  (yank nil))


(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "rm -f tags && rm -f TAGS && find ./ -regex '.+\.\(py\|rb\|erb\|haml\)' -not -path '*tmp*' -not -path '*.git*' | xargs /usr/local/bin/ctags -o tags -a && find ./ -regex '.*\.\(py\|rb\|erb\|html\)' -not -path '*tmp*' -not -path '*.git*' | xargs etags -a" (directory-file-name dir-name)))
  )


(define-key global-map (kbd "C-c f s") 'find-file-selected)

(global-set-key (kbd "M-x") 'helm-M-x)
;; (define-key global-map (kbd "RET") 'newline-and-indent)

(setq mm-text-html-renderer 'w3m)
(setq gnus-inhibit-images nil)

(defun my-gnus-summary-view-html-alternative ()
  "Display the HTML part of the current multipart/alternative MIME message
    in current browser."
  (interactive)
  (save-current-buffer
    (gnus-summary-show-article)
    (set-buffer gnus-article-buffer)
    (let ((file (make-temp-file "html-message-" nil ".html"))
    (handle (nth 3 (assq 1 gnus-article-mime-handle-alist))))
      (mm-save-part-to-file handle file)
      (browse-url (concat "file://" file)))))

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

(evil-mode 1)
;; (global-relative-line-numbers-mode)
(key-chord-mode 1)

;; (add-to-list 'projectile-globally-ignored-files "TAGS")
;; (add-to-list 'projectile-globally-ignored-files "tags")
;; (add-to-list 'projectile-globally-ignored-files "*\.sql")


(setq key-chord-two-keys-delay 0.01)
(setq key-chord-one-key-delay 0.5)

(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-normal-state-map "ff" 'projectile-find-file)
(key-chord-define evil-normal-state-map "fd" 'helm-projectile-find-dir)
(key-chord-define evil-normal-state-map "fo" 'helm-projectile-find-other-file)
(key-chord-define evil-normal-state-map "fb" 'switch-to-buffer)

(key-chord-define evil-normal-state-map "RR" 'kill-some-buffers)
(key-chord-define evil-normal-state-map "fi" 'helm-projectile-ack)
(key-chord-define evil-normal-state-map "fp" 'rgrep)
(key-chord-define evil-normal-state-map "gb" (read-kbd-macro "M-*"))
(key-chord-define evil-normal-state-map "fw" 'sp-rewrap-sexp)
;; (global-set-key (kbd "TAB") 'company-indent-or-complete-common)

;; find selected text
;; (key-chord-define evil-normal-state-map "fs" 'bk/find-selection-in-file)
(global-set-key (kbd "M-n") 'end-of-line)



(global-set-key  [f5] (read-kbd-macro "M-."))
(global-set-key  [f6] (read-kbd-macro "C-u M-."))
;; (global-set-key  [f7] (read-kbd-macro "M-*"))
(global-set-key [f8] 'copy-to-clipboard)
(global-set-key [f9] 'paste-from-clipboard)

(define-key global-map (kbd "C-c SPC") 'avy-goto-word-or-subword-1)

;; (global-set-key (kbd "C-x j") 'python-django-open-project)

;; (global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)
(global-set-key (kbd "C-c r r") 'inf-ruby)
(define-key global-map (kbd "C-c @") 'er/expand-region)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
            (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
    (lambda ()
  (let ((color (cond ((minibufferp) default-color)
      ((evil-insert-state-p) '("#006fa0" . "#ffffff"))
      ((evil-emacs-state-p)  '("#4e4e4e" . "#ffffff"))
      ;; ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
      ((buffer-modified-p)   '("#4e4e4e" . "#ffffff"))
      (t default-color))))
  (set-face-background 'mode-line (car color))
  (set-face-foreground 'mode-line (cdr color))))))


;; This makes debug buybug to work in tests.
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; 2 spaces as indent always
(setq auto-indent-assign-indent-level 2)

;; this makes Tabs to work as expected
(smart-tabs-advice ruby-indent-line ruby-indent-level)
(setq ruby-indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-hook 'python-mode-hook
    (function (lambda ()
    (setq evil-shift-width python-indent))))

(add-hook 'ruby-mode-hook
    (function (lambda ()
    (setq evil-shift-width ruby-indent-level))))

(add-hook 'haml-mode-hook
    (function (lambda ()
    (setq evil-shift-width 2))))

(add-hook 'coffee-mode-hook
    (function (lambda ()
    (setq evil-shift-width 2))))

; activate robe
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

;; (setq debug-on-error t)
(setq coffee-tab-width 2)

;; set javascript indentation to 2 spaces
(setq js-indent-level 2)

(appt-activate 1)
(setq appt-display-duration 120)

(setq make-backup-files nil)

(setq sgml-basic-offset 2)
;; (setq indent-tabs-mode t)
(setq css-indent-offset 2)
(setq scss-indent-offset 2)

(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)

(setq backup-directory-alist '(("." . "~/.saves")))

(add-hook 'html-mode-hook
(lambda ()
  ;; Default indentation is usually 2 spaces
  (local-set-key (kbd "RET") 'newline-and-indent)
  (set (make-local-variable 'sgml-basic-offset) 2)))

(setq web-mode-script-padding 1)

(require 'mmm-auto)
(setq mmm-global-mode 'auto)

(mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(add-hook 'ruby-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))

;; (require 'flymake-jslint)
(require 'flymake-node-jshint)
;; (setq flymake-node-jshint-config "~/.jshintrc-node.json")
(add-hook 'js-mode-hook (lambda () (flymake-mode 1)))
(add-hook 'js-mode-hook (lambda () (flymake-jshint-load 1)))

(require 'groovy-mode)
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

(add-hook 'groovy-mode-hook
          (lambda ()
            (c-set-offset 'label 4)))


(require 'expand-region)
(global-set-key (kbd "M--") 'er/expand-region)


(require 'smartparens)

(global-set-key  [f6] (message "%s" (battery)))

(setq multi-term-program "/bin/zsh")

(setq linum-format "%3d ")

(defun jp-rel-format (offset)
  "Another formatting function for relative line numbers"
  (format "%3d \u2502 " (abs offset)))


; (setq relative-line-numbers-format 'jp-rel-format)
; (setq relative-line-numbers-current-line "->")

(defun dont-kill-emacs()
  "Disable C-x C-c binding execute kill-emacs."
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key (kbd "C-x C-c") 'dont-kill-emacs)

(setq confirm-kill-emacs 'y-or-n-p)

(global-set-key (kbd "M-]") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-'") 'insert-pair)
(global-set-key (kbd "M-)") 'insert-pair)

(smartparens-global-mode 1)

(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) (read-shell-command "Shell command on buffer: ") t))

(setq explicit-shell-file-name "/bin/zsh")

(global-set-key (kbd "<f7>") (flyspell-mode 1))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x))) ; Load Dired X when Dired is loaded.
(setq dired-omit-mode t) ; Turn on Omit mode.

(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
;;(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(setq dired-listing-switches "-laGh1v --group-directories-first")

(global-set-key (kbd "C-c ;") 'comment-dwim)

(require 'solarized)
(deftheme solarized-light "The light variant of the Solarized colour theme")
;; (create-solarized-theme 'light 'solarized-light)
;; (provide-theme 'solarized-light)


;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

;; Preset nlinum for lines number to be shown
(require 'linum-relative)
(linum-relative-on)
(global-linum-mode 1)
(setq linum-relative-backend 'display-line-numbers-mode)


(when (eq system-type 'darwin)
    (require 'ls-lisp)
      (setq ls-lisp-use-insert-directory-program nil))

(add-to-list 'projectile-globally-ignored-directories "public")
(add-to-list 'projectile-globally-ignored-directories "build")

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f4>") 'switch-to-minibuffer-window)
