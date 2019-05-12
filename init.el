(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; Misc emacs config
(electric-pair-mode 1)
(show-paren-mode 1)
(global-auto-revert-mode 1)

(setq default-directory "C:\\Users\\rfink")
(setq comint-prompt-read-only t)
 (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-frame-font "Hack-9" t t)


;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(use-package magit
  :defer t)

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (define-key yas-keymap [(tab)]       nil)
  (define-key yas-keymap (kbd "TAB")   nil)
  (define-key yas-keymap [(shift tab)] nil)
  (define-key yas-keymap [backtab]     nil)
  (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
  (define-key yas-keymap (kbd "C-j") 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap (kbd "C-k") 'yas-prev))

(use-package helm
  :ensure t
  ;; :defer t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (helm-autoresize-mode t)
  :custom
  (helm-buffers-fuzzy-matching t)
  (helm-recentf-fuzzy-match t))
  ;; (setq helm-buffers-fuzzy-matching t
  ;; 	helm-recentf-fuzzy-match    t))

(use-package tramp
  :defer t
  :config
  (set-default 'tramp-auto-save-directory "C:\\Users\\rfink\\AppData\\Local\\Temp")
  (set-default 'tramp-default-method "plink"))

(use-package company
  :ensure t
  :custom
  (company-idle-delay 0)
  (company-global-modes '(not org-mode eshell-mode shell-mode))
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-u-scroll t)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-want-C-d-scroll t)
  :config
  (evil-mode 1)
  (evil-commentary-mode 1)
  (global-evil-surround-mode 1)
  (define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
  (define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
  (define-key evil-normal-state-map (kbd "SPC") 'evil-ex)
  (define-key evil-normal-state-map (kbd "gcc") 'comment-line)
  (define-key evil-visual-state-map (kbd "gc") 'comment-or-uncomment-region)
  (define-key evil-insert-state-map (kbd "\t") 'company-complete)
  ;; (define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

  (evil-define-key 'normal org-mode-map (kbd "C-j")'windmove-down)
  (evil-define-key 'normal org-mode-map (kbd "C-k")'windmove-up)
  ;; (org-defkey org-mode-map [M-l] 'org-indent-item)
  ;; (org-defkey org-mode-map [M-h] 'org-)
  (setq evil-normal-state-cursor '(box "NavajoWhite")))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package flycheck
  :config
  (add-hook 'python-mode-hook 'flycheck-mode))

(use-package blacken
  :config
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package python-mode
  :mode "\\.py\\'"
  :custom
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "--simple-prompt -i")
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))

  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package org
  ;; :mode "\\.org\\'"
  :custom
  (org-highlight-latex-and-related '(latex script entities))
  (org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (org-confirm-babel-evaluate nil)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/org/wiki/")))
 '(package-selected-packages
   (quote
    (which-key yasnippet-snippets use-package solarized-theme material-theme htmlize helm-org-rifle flycheck evil-surround evil-org evil-magit evil-commentary evil-collection doom-themes company-jedi color-theme-sanityinc-tomorrow blacken arduino-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
