(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package spacious-padding
  :config
  (spacious-padding-mode 1))

(use-package emacs
  :config
  (electric-pair-mode 1)
  (tool-bar-mode -1)
  (add-to-list 'default-frame-alist '(font . "Inconsolata Nerd Font Propo-18"))
  (set-face-attribute 'variable-pitch nil :family "IBM Plex Sans" :height 240)
  
  :custom
  (org-directory "~/.org")
  (org-agenda-files '("~/.org"))
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package org
  :hook
  (org-mode . variable-pitch-mode)
  (org-mode . writeroom-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package doom-themes
  :config
  (load-theme 'doom-sourcerer t))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-trigger ".")
  (corfu-quit-no-match 'separator))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner 'logo)
  (dashboard-center-content t)
  (dashboard-show-shortcuts t))

(use-package writeroom-mode)

(use-package org-modern
  :config
  (global-org-modern-mode))

(setq custom-file ".custom.el")
(setq backup-directory-alist `(("." . "~/.config/emacs/backups/")))
