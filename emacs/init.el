(require 'package)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruber-darker-theme)

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package eglot
  :hook (c-mode . eglot-ensure))

(use-package corfu
  :init (global-corfu-mode)
  :config
  (setq corfu-auto t
      corfu-auto-delay 0.1
      corfu-auto-trigger "."
      corfu-quit-no-match 'separator))

(use-package emacs
  :custom
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t)
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))
  
(load-theme 'gruber-darker t)

(add-to-list 'default-frame-alist '(font . "Inconsolata Nerd Font-18"))

(tool-bar-mode -1)

(electric-pair-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq make-backup-files nil)
(setq custom-file "/dev/null")
(setq eglot-ignored-server-capabilities '(:inlayHintProvider))
