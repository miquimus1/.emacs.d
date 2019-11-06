(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list
   'package-archives
   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
  (package-initialize))

(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )



;Me guarda el escritorio
(desktop-save-mode 1)

;No quiero las barras de herramientas
(tooltip-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)
(global-linum-mode 1)
(set-fringe-mode 0)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ee89863f86247942d9fc404d47b2704475b146c079c1dcd2390d697ddfa9bdf4" default)))
 '(package-selected-packages
   (quote
    (rainbow-mode elpy auto-complete multiple-cursors rainbow-delimiters use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;;Completion
(ido-mode t)
(use-package flx-ido
  :ensure t)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;;Theme
;(use-package ample-theme
          ; :init
   ;(load-theme 'ample)
    ;:ensure t)

(use-package darkokai-theme
  :ensure t
  :init (load-theme 'darkokai t))

;Para moverme entre ventanas
(use-package windmove
  :ensure t
  :bind (("C-c <up>" . windmove-up)
         ("C-c <left>" . windmove-left)
         ("C-c <right>" . windmove-right)
         ("C-c <down>" . windmove-down))
  )

(if (file-exists-p "~/.ciaoroot/master/ciao_emacs/elisp/ciao-site-file.el")
  (load-file "~/.ciaoroot/master/ciao_emacs/elisp/ciao-site-file.el")) 

;Para el autocompletado
(use-package ido
  :init (ido-mode))

(use-package auto-complete
  :ensure t
  :config (ac-config-default))

 ;;Parens
(setq show-paren-delay 0)
(show-paren-mode 1)
(electric-pair-mode 1)

;Paquete de python
(use-package elpy
  :ensure t
  :mode "\\.hs\\'"
  :init (elpy-enable))

;;Parentesis
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :mode "\\.css\\'"
  )



;Reemplazar yes o no por y o n
;(fset ‘yes-or-no-p ‘y-or-n-p)

;;Multiple Cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/add-cursor-on-click)))


(put 'upcase-region 'disabled nil)
