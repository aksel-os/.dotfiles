;;; -*- lexical-binding: t -*-

;; ----=[ DEFAULTS ]=----
(setq inhibit-splash-screen t             ; Removes splash screen
	  default-input-method "TeX"          ; Dont really know
	  echo-keystrokes 0.1                 ; Dont really know
	  use-short-answers t                 ; Allows you to type y/n instead fo yes/no
	  scroll-margin 1                     ; Space between cursor and top/ bottom
	  ring-bell-function 'ignore          ; No dumb alerts
	  recentf-max-saved-items 1000        ; Show more recent files
	  ns-alternate-modifier 'none         ; Lets option-key stay as option
	  ns-right-alternate-modifier 'meta)  ; Sets right option-key to meta

(setq-default tab-width 4         ; Smaller tabs
              fill-column 79      ; Max line width
			  truncate-lines t)   ; Dont fold lines

(set-face-attribute 'default nil :height 140)

(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-<wheel-up>"))
(global-unset-key (kbd "C-<wheel-down>"))

;; ----=[ AUTOSAVE ]=----
(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever your .emacs.d/ is
  located.")

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

;; ----=[ Custom Keymap ]=----
(defvar custom-bindings-map (make-keymap)
  "A keymap for custom bindings.")


;; ----=[ VISUAL ]=----
(dolist (mode
		 '(blink-cursor-mode ; No stupid blinking cursor
		   menu-bar-mode
		   tool-bar-mode     ; Removes toolbars
		   scroll-bar-mode)) ; Removes scrollbars
  (funcall mode 0))

(dolist (mode
         '(abbrev-mode                  ; E.g. sopl -> System.out.println
           column-number-mode           ; Show column number in mode line
           delete-selection-mode        ; Replace selected text
           dirtrack-mode                ; directory tracking in *shell*
           global-so-long-mode          ; Mitigate performance for long lines
           recentf-mode                 ; Recently opened files
           show-paren-mode))            ; Highlight matching parentheses
  (funcall mode 1))

(add-to-list 'default-frame-alist     '(fullscreen . maximized))

;; ----=[ PACKAGES ]=----
(require 'use-package)
(setq use-package-always-ensure t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(package-refresh-contents)
;;(package-initialize)

;; VERTical Interactive COmpletion
(use-package vertico
  :ensure t
  :config
  (setq vertico-count 25)
  (vertico-mode 1))

;; Save minibuffer history
(use-package savehist
  :config
  (savehist-mode 1))

;; Forbedrer mange kommandoer når du skal navigere og søke
(use-package consult
  :ensure t
  :bind (:map custom-bindings-map
			  ("C-x C-b" . consult-buffer)
			  ("C-x b" . consult-buffer))
  :config
  (setq consult-preview-key (list :debounce 0.1 'any)))

;; Display available keybindings in popup
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

;; Themes
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'latte) ;; 'latte, 'frappe, 'macchiato, or 'mocha)
  (catppuccin-reload))

;; Multiple Cursors
(use-package multiple-cursors
  :ensure t)

;; Doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; A Git porcelain inside Emacs.
(use-package magit
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :bind (:map custom-bindings-map ("C-c m" . magit-status)))

;; Highlight uncommitted changes using VC
(use-package diff-hl
  :config
  (global-diff-hl-mode 1))

;; ----=[ EXPERIMENTAL PACKAGES ]=----

;; TODO: Make them your own
;;(use-package windmove
;;  :ensure nil)
;;  :bind (:map custom-bindings-map
;;              ("M-˙" . windmove-left)
;;              ("M-∆" . windmove-down)
;;              ("M-˚" . windmove-up)
;;              ("M-¬" . windmove-right)
;;
;;              ("M-ó" . windmove-swap-states-left)
;;              ("M-ô" . windmove-swap-states-down)
;;              ("M-" . windmove-swap-states-up)
;;              ("M-ò" . windmove-swap-states-right)))


;; A terminal via libvterm
(use-package vterm
  :defer t
  :preface
  (defvar vterms nil)

  (defun toggle-vterm (&optional n)
    (interactive)
    (setq vterms (seq-filter 'buffer-live-p vterms))
    (let ((default-directory (or (vc-root-dir) default-directory)))
     (cond ((numberp n) (push (vterm n) vterms))
           ((null vterms) (push (vterm 1) vterms))
           ((seq-contains-p vterms (current-buffer))
            (switch-to-buffer (car (seq-difference (buffer-list) vterms))))
           (t (switch-to-buffer (car (seq-intersection (buffer-list) vterms)))))))

  :bind (:map custom-bindings-map
              ("C-z" . toggle-vterm)
              ("s-1" . (lambda () (interactive) (toggle-vterm 1)))
              ("s-2" . (lambda () (interactive) (toggle-vterm 2)))
              ("s-3" . (lambda () (interactive) (toggle-vterm 3)))
              ("s-4" . (lambda () (interactive) (toggle-vterm 4)))
              ("s-5" . (lambda () (interactive) (toggle-vterm 5)))
              ("s-6" . (lambda () (interactive) (toggle-vterm 6)))
              ("s-7" . (lambda () (interactive) (toggle-vterm 7)))
              ("s-8" . (lambda () (interactive) (toggle-vterm 8)))
              ("s-9" . (lambda () (interactive) (toggle-vterm 9))))

  :config
  ;; Don't query about killing vterm buffers, just kill it
  (defadvice vterm (after kill-with-no-query nil activate)
    (set-process-query-on-exit-flag (get-buffer-process ad-return-value) nil)))


;; -=*[ Auto completion ]*=-
;; Enrich existing commands with completion annotations
(use-package marginalia
  :init 
  (marginalia-mode 1))

;; Modular text completion framework
(use-package corfu
  :init
  (global-corfu-mode 1)
  (corfu-popupinfo-mode 1)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.5)
  (corfu-cycle t))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic partial-completion)
        completion-category-overrides '((file (styles basic partial-completion)))
        orderless-component-separator "[ |]"))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)  
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (message (format "Loading my capf extensions: %s" completion-at-point-functions)))

;; Minor mode for a nice writing environment
(use-package olivetti
  :defer t
  :bind (:map custom-bindings-map ("C-c o" . olivetti-mode))
  :config
  (setq-default olivetti-body-width (+ fill-column 3)))

;; Emacs support library for PDF files
(use-package pdf-tools
  :defer t
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("c" . (lambda ()
                       (interactive)
                       (if header-line-format
                           (setq header-line-format nil))))
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

;; Highlight specific keywords
;; Taken from https://www.reddit.com/r/emacs/comments/f8tox6/comment/fipxb2w/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)
		 (org-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

;; display the definition of word at point
(use-package define-word
  :defer t
  :bind (:map custom-bindings-map ("C-c D" . define-word-at-point)))

;; For moving lines up and down
(use-package move-text
  :bind (:map custom-bindings-map
              ("C-M-<down>" . move-text-down)
              ("C-M-<up>" . move-text-up)))

;; Eglot
(use-package eglot
  :defer t
  :hook (eglot-managed-mode . (lambda ()
                                (eglot-inlay-hints-mode -1)
                                (add-hook 'before-save-hook 'eglot-format nil t)))
  :config
  (setq eglot-events-buffer-size 0)
  (add-to-list 'eglot-server-programs
               '(web-mode . ("svelteserver" "--stdio"))))


;; ----=[ Modes ]=----

;; -=* Nix-Mode *=-
(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'"))
(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")
(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))
(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl))

;; -=* Org-Mode *=-
(use-package org
  :defer t
  :config
  (setq org-adapt-indentation nil
		org-pretty-entities t)
  (setq org-latex-packages-alist'())
  (add-to-list 'org-latex-packages-alist '("margin=2cm" "geometry" nil)) ; Probably a better way to do this
  (add-to-list 'org-latex-packages-alist '(nil "parskip" nil)))

;; Org-modern - Modern looks for Org
(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-block-fringe nil
        org-modern-star 'replace))

;; Org-appear
(use-package org-appear
  :commands (org-appear-mode)
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t
		org-appear-autoemphasis t
        org-appear-autoentities t
		org-appear-autosubmarkers t
        org-appear-autolinks t))

;; Org-appear for latex
(use-package org-fragtog
  :hook (org-mode-hook . org-fragtog-mode))

;; C and other c compiled langs
(defun c-setup ()
  (local-set-key (kbd "C-c C-c") 'compile))

(add-hook 'c-mode-hook 'c-setup)

;; Java
(define-abbrev-table 'java-mode-abbrev-table
  '(("psv" "public static void main(String[] args) {" nil 0)
    ("sopl" "System.out.println" nil 0)
    ("sop" "System.out.printf" nil 0)))
(add-hook 'java-mode-hook 'eglot-ensure)

;; Activating the keymap
(define-minor-mode custom-bindings-mode
  "A mode that activates custom keybindings."
  :init-value t
  :keymap custom-bindings-map)
