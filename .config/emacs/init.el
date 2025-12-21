;; package.el initialization
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; -- UI --

(with-eval-after-load 'org (global-org-modern-mode))

(use-package kanagawa-themes
  :config (load-theme 'kanagawa-wave t))

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode 1))

(use-package ultra-scroll
  ;:vc (:url "https://github.com/jdtsmith/ultra-scroll") ; if desired (emacs>=v30)
  :init
  (setq scroll-conservatively 3 ; or whatever value you prefer, since v0.4
        scroll-margin 0)        ; important: scroll-margin>0 not yet supported
  :config
  (ultra-scroll-mode 1))

;; org-modern basic setup
(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode)
  (org-mode . variable-pitch-mode)
  (org-agenda-finalize . org-modern-agenda)
  :config
  ;; Headline bullets (replace stars)
  (setq org-modern-star '("◉" "○" "●" "◆" "▶" "▸"))
  (setq org-modern-label-border 0.25)
  (setq org-modern-todo-faces
        '(("TODO" . (:foreground "#ff6c6b" :weight bold))
          ("NEXT" . (:foreground "#ECBE7B" :weight bold))
          ("DONE" . (:foreground "#98be65" :weight bold))
          ("WAIT" . (:foreground "#51afef" :weight bold))))

  ;; Make headlines scale by level
  (setq org-modern-scale-headlines nil)
  (setq org-modern-headline nil)

  ;; Optional: nicer priority cookies
  (setq org-modern-priority
        '((?A . "🔥")
          (?B . "⬆")
          (?C . "⬇")))
  (add-hook 'org-mode-hook #'org-indent-mode))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-banner-logo-title "\"Every soul has its dark\" - John Darksoul")
  (setq dashboard-startup-banner "~/.config/emacs/kms.txt"))

(use-package vertico
  :init (vertico-mode))

;; -- LANG --
(use-package eglot
  :ensure t
  :hook ((c-mode go-mode python-mode web-mode emmet-mode) . eglot-ensure)
  :config
  (setq eglot-sync-connect nil)
  (setq eglot-events-buffer-size 0))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)                ;; Enable auto completion
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 1)
  (corfu-cycle t)               ;; Cycle through candidates
  (corfu-preselect 'prompt)
  (corfu-quit-no-match 'separator))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package go-mode
  :mode "\\.go\\'"
  :config
  (defun eglot-format-buffer-before-save ()
    (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
  (add-hook 'go-mode-hook #'eglot-format-buffer-before-save))

(use-package python-mode)
(use-package web-mode)
(use-package emmet-mode)

(electric-pair-mode t)
(set-frame-font "Inconsolata Nerd Font 18" nil t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(setq tab-always-indent 'complete)
(setq text-mode-ispell-word-completion nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-auto-save-files t)
(setq kill-buffer-delete-auto-save-files t)
(setq org-agenda-files '("~/org"))
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons ccls corfu dashboard emmet-mode exec-path-from-shell
                   flycheck go-mode kanagawa-themes lsp-docker
                   posframe python-mode spacious-padding ultra-scroll
                   vertico web-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
