(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(set-frame-font "SauceCodePro Nerd Font 14" nil t)
(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font-14"))

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

(use-package doom-themes
  :ensure t)

(use-package writeroom-mode
  :ensure t
  :bind
  ("C-M-z" . writeroom-mode))

(use-package ultra-scroll
  :ensure t
  :init (ultra-scroll-mode t))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "SauceCodePro Nerd Font"))

(use-package dashboard
  :ensure t
  :config
  (setq
   initial-buffer-choice 'dashboard-open
   dashboard-startup-banner 'logo
   dashboard-center-content t
   dashboard-display-icons-p t
   dashboard-icon-type 'nerd-icons
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-show-shortcuts t)
  (dashboard-setup-startup-hook))

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode 1))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package which-key
  :config (which-key-mode t))

(use-package savehist
  :init (savehist-mode))

(use-package corfu
  :ensure t
  :init (global-corfu-mode 1)
  :config
  (setq corfu-auto t
      corfu-auto-delay 0.1
      corfu-auto-trigger "." ;; Custom trigger characters
      corfu-quit-no-match 'separator)
  
  (add-hook 'corfu-mode-hook
          (lambda ()
            ;; Settings only for Corfu
            (setq-local completion-styles '(basic)
                        completion-category-overrides nil
                        completion-category-defaults nil)))) ;; or t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

(use-package go-mode
  :ensure t)

(use-package org
  :config (add-hook 'org-mode-hook 'variable-pitch-mode))

(use-package org-modern
  :ensure t
  :init
  (global-org-modern-mode))

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq
 inhibit-startup-screen t
 auto-save-default nil
 make-backup-files nil)


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(electric-pair-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-tokyo-night))
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
