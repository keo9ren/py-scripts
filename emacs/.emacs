;;; package --- Summary
;;; commentary:
;;;
;;; Code:
(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "install")
(load-library "magitsetup")
(load-library "rtagssetup")
(load-library "helmsetup")
(load-library "companysetup")
(load-library "yassetup")
(load-library "clangformatsetup")
(defvar *spotifyenabled* nil)
(when *spotifyenabled*
  (load-library "spotifysetup"))
(defvar *sphinxenabled* nil)
(when *sphinxenabled*
  (load-library "sphinxsetup"))

(use-package indent-guide
  :config (progn
            (indent-guide-global-mode)
            (set-face-background 'indent-guide-face "dimgray")
            (setq indent-guide-delay 4)
            (setq indent-guide-recursive t)
            (setq indent-guide-char "|")
            )
)
(use-package anzu
  :config
  (use-package evil-anzu)
  (global-anzu-mode +1)
  (anzu-mode +1)
)
(use-package avy
:init (setq avy-keys '(?j ?h ?k ?l ?f ?g ?d ?s ?u ?r ?n ?v ?i ?e ?o ?w))
:config (progn
          (define-key evil-normal-state-map (kbd "f") 'avy-goto-char)
          (define-key evil-normal-state-map (kbd "C-f") 'avy-goto-char-2)
        )
)
(use-package flycheck
  :config (progn
            (add-hook 'after-init-hook #'global-flycheck-mode)
            (use-package flycheck-checkbashisms
              :config (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))
             )
            )
)
;;;;; ------ gdb ---------------------------------------------
; decent gdb setup
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
(load-library "customvarsetup")
(use-package tex-site)
(use-package reftex
  :config (progn
            (add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
            (add-hook 'latex-mode-hook 'turn-on-reftex) 
            (setq reftex-plug-into-AUCTeX t)
            (setq reftex-external-file-finders
                  '(("tex" . "kpsewhich -format=.tex %f")
                    ("bib" . "kpsewhich -format=.bib %f")))
            (custom-set-faces)
            )
)
(use-package ispell
  :config (progn
            (setq ispell-program-name "hunspell")
            (setq ispell-local-dictionary "en_US"))
)
(use-package zeal-at-point
:commands (zeal-at-point)
:config (global-set-key "\C-cd" 'zeal-at-point)
)
(use-package org
  :bind ("\C-cl" . org-store-link)
        ("\C-ca" . org-agenda)
  :config (setq org-log-done t)
)
(use-package markdown-mode)
(use-package octave
:config (progn
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))
))
(load-library "mymodehooks")
(use-package modern-cpp-font-lock
:config (modern-c++-font-lock-global-mode t)
)
(load-library "style")
; should alway be the last
(load-library "evilsetup")
(provide '.emacs)
;;; .emacs ends here
