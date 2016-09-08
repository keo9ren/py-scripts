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

(semantic-mode 1)
;;;;;
;;;;; ------ sphinx-frontend ---------------------------------------------
(require 'sphinx-frontend)
;;;;; needs some configuration
;;;;; ------ sphinx-frontend ---------------------------------------------
;;;;;
(require 'helm-pydoc)
;;;;; ----- indent-guide ---------------------------------------------
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-delay 4)
(setq indent-guide-recursive t)
(setq indent-guide-char "|")
;;;;; ----- indent-guide halo ---------------------------------------------
;;;;;
;;;;; ----- anzu ---------------------------------------------
(require 'anzu)
(require 'evil-anzu)
(global-anzu-mode +1)
(anzu-mode +1)
;;;;; ----- anzu ---------------------------------------------
;;;;;
;;;;; ----- avy ---------------------------------------------
(define-key evil-normal-state-map (kbd "f") 'avy-goto-char)
(define-key evil-normal-state-map (kbd "C-f") 'avy-goto-char-2)
;(define-key evil-normal-state-map (kbd "M-g f") 'avy-goto-line)binding??
(setq avy-keys '(?j ?h ?k ?l ?f ?g ?d ?s ?u ?r ?n ?v ?i ?e ?o ?w))
;(require 'link-hint)
;(define-key evil-normal-state-map (kbd "C-l") 'link-hint-open-link)
;(global-set-key (kbd "C-l") 'link-hint-open-link)
;;;;; ----- avy ---------------------------------------------
;;;;;
;;;;; ----- ace-jump ---------------------------------------------
;(require 'ace-jump-buffer)
;(global-unset-key (kbd "C-k"))
;(define-key evil-normal-state-map (kbd "C-k") 'ace-jump-buffer)
;(setq ace-jump-mode-move-keys
;      '(?j ?h ?k ?l ?f ?g ?d ?s ?u ?r ?n ?v ?i ?e ?o ?w))
;(require 'ace-jump-helm-line)
;(eval-after-load "helm"
;  '(define-key helm-map (kbd "C-j") 'ace-jump-helm-line))
;(ace-jump-helm-line-idle-exec-add 'helm-mini)
;(ace-jump-helm-line-idle-exec-add 'helm-find-files)
;(setq ace-jump-helm-line-style 'pre)
;(setq ace-jump-helm-line-background t)
;(setq ace-jump-helm-line-idle-delay 1)
;(ace-jump-helm-line-autoshow-mode +1)
;; use `linum-mode' to show
;(setq ace-jump-helm-line-autoshow-mode-use-linum t)
;;;;; ----- ace-jump ---------------------------------------------
;;;;; ------ flycheck ---------------------------------------------
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
;;;;; ------ gdb ---------------------------------------------
;;;;;
(use-package tex-site)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    ((engine-omega "dvi2tty")
     ((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-html "xdg-open")
     (engine-omega "dvi2tty")
     (output-pdf "Okular"))))
 '(custom-safe-themes
   (quote
    ("8e7ca85479dab486e15e0119f2948ba7ffcaa0ef161b3facb8103fb06f93b428" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "878e22a7fe00ca4faba87b4f16bc269b8d2be5409d1c513bb7eda025da7c1cf4" default)))
 '(doc-view-continuous t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (octave)))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-flags-c "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c++ "-I/usr/include/c++/5" "-I/usr/include/x86_64-linux-gnu/c++/5" "-I/usr/include/c++/5/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/t/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c "-I/usr/lib/gcc/arm-none-eabi/4.9.3/include" "-I/usr/lib/gcc/arm-none-eabi/4.9.3/include-fixed" "-I/usr/lib/gcc/arm-none-eabi/4.9.3/../../../arm-none-eabi/include")
     (cmake-ide-flags-c++ "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6/arm-linux-gnueabihf/." "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include/c++/6/backward" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include")
     (cmake-ide-build-dir . "build")
     (cmake-ide-flags-c++ "-I/usr/include/c++/6" "-I/usr/include/x86_64-linux-gnu/c++/6" "-I/usr/include/c++/6/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include")
     (cmake-ide-flags-c "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include")
     (cmake-ide-dir . "build")
     (cmake-ide-flags-c++ quote
                          ("-I/usr/include/c++/6" "-I/usr/include/x86_64-linux-gnu/c++/6" "-I/usr/include/c++/6/backward" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include" "-I/usr/local/include" "-I/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed" "-I/usr/include/x86_64-linux-gnu" "-I/usr/include"))
     (cmake-ide-flags-c quote
                        ("-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/include-fixed" "-I/usr/lib/gcc-cross/arm-linux-gnueabihf/6/../../../../arm-linux-gnueabihf/include" "-I/usr/include"))))))
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
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)
(load-library "style")
; should alway be the last
(load-library "evilsetup")
(provide '.emacs)
;;; .emacs ends here
