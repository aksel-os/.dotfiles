;; Dette fjerner velkomstskjermen ved oppstart av Emacs.
(setq inhibit-splash-screen t)

;; Emacs ber deg iblant svare "yes" eller "no".  Dette gjør at Emacs
;; nøyer seg med "y" eller "n".
(setq use-short-answers t)

;; Skru av blinkende peker.
(blink-cursor-mode 0)

;; Disse skrur av diverse GUI-elementer.
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      create-lockfiles nil)
(setq custom-file (locate-user-emacs-file "custom.el")) 
(load custom-file t t)


(setq backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)
(package-initialize)
;; (use-package my-package-name
;;   :ensure t    ; Ensure my-package is installed
;;   :after foo   ; Load my-package after foo is loaded (seldom used)
;;   :init        ; Run this code before my-package is loaded
;;   :bind        ; Bind these keys to these functions
;;   :custom      ; Set these variables
;;   :config      ; Run this code after my-package is loaded

;; Python LSP
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

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
  :bind ("C-x b" . consult-buffer)
  :config
  (setq consult-preview-key (list :debounce 0.1 'any)))

;; Tidligere besøkte filer
(recentf-mode t)
(setq recentf-max-saved-items 1000)

;; Display available keybindings in popup
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

;; Themes
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)) ;; or 'latte, 'macchiato, or 'mocha)

;; Multiple Cursors
(use-package multiple-cursors
  :ensure t)

;; Linjenummer - Relative
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(show-paren-mode 1) 

;; ----=[ Modes ]=----
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
