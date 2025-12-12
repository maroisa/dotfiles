;;; Initialize package sources
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if missing
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; PATH
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))


;; Company
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; Flycheck
(use-package flycheck
  :hook (after-init . global-flycheck-mode))

;; Eglot
(use-package eglot
  :commands (eglot)
  :hook ((go-mode php-mode python-mode) . eglot-ensure))

;; Go mode
(use-package go-mode
  :mode "\\.go\\'"
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save))

;; PHP mode
(use-package php-mode
  :mode "\\.php\\'")

(use-package python-mode
  :mode "\\.py\\'")

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Treemacs
(use-package treemacs
  :bind (("C-x d" . treemacs))
  :config (setq treemacs-width 36))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package spacious-padding
  :config (setq spacious-padding-widths 10))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(auto-save-mode -1)
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(electric-pair-mode 1)

(spacious-padding-mode 1)
(load-theme 'kanagawa-wave t)
(set-frame-font "Inconsolata Nerd Font 16" nil t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company dap-mode dashboard eglot-booster exec-path-from-shell
             flycheck go-mode kanagawa-themes lsp-ui php-mode
             python-mode python-tdd-mode spacious-padding
             treemacs-magit treemacs-projectile yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
