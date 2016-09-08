;;; package --- Summary
;;; commentary:
;;;
;;; Code:
(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "install")
(load-library "magitsetup")
(load-library "rtagssetup")
(load-library "helmsetup")
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
;;;;; ------ yasnippet-mode ---------------------------------------------
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq yas-indent-line (quote none))
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-to-list 'yas-snippet-dirs "/home/oliver/.tools/scripts-and-more/emacs/yasnippet/")
(add-hook 'after-init-hook 'yas-reload-all)
;;;;; ------ yasnippet-mode ---------------------------------------------
;;;;; ------ company-mode ---------------------------------------------
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.1)
(require 'company-statistics)
(company-statistics-mode)
(company-quickhelp-mode 1)
(require 'company-math)
;;;;; ------ helm-company ---------------------------------------------
;;;;;
;;;;; ------ company-mode yas-mode ---------------------------------------------
(defun check-expansion ()
  "My check-expansion."
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))
;;;;------------------------------------------------------
(defun do-yas-expand ()
  "My do-yas-expand."
    (let ((yas-fallback-behavior 'return-nil))
      (yas-expand)))
;;;;------------------------------------------------------
(defun tab-indent-or-complete ()
  "My tab-indent-or-complete.  We need to check if we are in magit-mode and than toggle magit-section-toggle."
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas-minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))
;;;;------------------------------------------------------
(defun tab-complete-or-next-field ()
  "My tab-complete-or-next-field."
  (interactive)
  (if (or (not yas-minor-mode)
      (null (do-yas-expand)))
      (if company-candidates
      (company-complete-selection)
        (when (check-expansion)
         (company-manual-begin)
           (when (null company-candidates)
             (company-abort) (yas-next-field)
           )
         (yas-next-field)
        )
      )
  )
)
;---------------------------------------------------------
(defun expand-snippet-or-complete-selection ()
  "My expand-snippet-or-complete-selection."
  (interactive)
  (if (or (not yas-minor-mode)
      (null (do-yas-expand))
      (company-abort))
      (company-complete-selection)))
;;;;------------------------------------------------------
(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)
(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)
(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
;;;;; ------ company-mode yas-mode ---------------------------------------------
;;;;; ------ company-mode ---------------------------------------------
;;;;;
;;;;; ------ flycheck ---------------------------------------------
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-checkbashisms)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))
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
(require 'tex-site)
(require 'company-auctex)
;;;;; ------ auctex ---------------------------------------------
;;;;; ------ okular ---------------------------------------------
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
;;;;; ------ okular ---------------------------------------------
;;;;;
;;;;;
;;;;; ------ reftex ---------------------------------------------
;;; Anpassungen für RefTeX
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 
(add-hook 'latex-mode-hook 'turn-on-reftex) 
(setq reftex-plug-into-AUCTeX t)
(setq reftex-external-file-finders
      '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;; ------ reftex ---------------------------------------------
;;;;;
;;;;; ------ spell -----------------------------------------
(require 'ispell)
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")
;;;;; ------ spell ---------------------------------------------
;;;;;
;;;;; ------ helm-eshell ---------------------------------------------
(require 'eshell)
(require 'helm-eshell)
;;;;;
(defun helm-my-buffers ()
  "My helm-my-buffers."
 (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-c-source-buffers-list
                         helm-c-source-elscreen
                         helm-c-source-projectile-files-list
                         helm-c-source-ctags
                         helm-c-source-recentf
                         helm-c-source-locate)
                         "*helm-my-buffer*")))
;;;;; ------ helm-eshell ---------------------------------------------
;;;;; ------ clang-format-mode ---------------------------------------------
(require 'clang-format)
(defcustom clang-format-on-save
  t
  "My clang-format-on-save."
  :group 'myinit
  :type 'booleanp
  :safe #'booleanp)
(defun clang-format-before-save ()"Add this to .emacs to clang-format on save(add-hook 'before-save-hook 'clang-format-before-save)."
       (interactive)(when (eq major-mode 'c-mode) (clang-format-buffer)))
(when (eq t clang-format-on-save) (add-hook 'before-save-hook  'clang-format-before-save) )
;;;;; ------ clang-format-mode ---------------------------------------------
;;;;;
;;;;;
;;;;; ------ zeal-mode ---------------------------------------------
;;browse offline documentation
(require 'zeal-at-point)
(global-set-key "\C-cd" 'zeal-at-point)
;;;;; ------ zeal-mode ---------------------------------------------
;;;;;
;;;;; ------ org-mode ---------------------------------------------
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;;;; ------ org-mode ---------------------------------------------
;;;;;
;;;;; ------ markdown-mode ---------------------------------------------
(require 'markdown-mode)
;;;;; ------ markdown-mode ---------------------------------------------
;;;;;
;;;;; ------ Octave-mode ---------------------------------------------
(require 'octave)
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))
;;;;; ------ Octave-mode-end ---------------------------------------------
;;;;;
;;;;; ------ my-x-mode-hooks ---------------------------------------------
(defun my-init-mode-hooks ()
  "MY-INIT-MODE-HOOKS."
  (setq company-backends '((
                            company-files
                            company-dabbrev-code
                            company-dabbrev
                            company-oddmuse
                            company-capf
                            )))
)
;
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)
(defun my-c++-mode-hooks ()
  "MY-C++-MODE-HOOKS."
  (interactive)
  (cmake-ide-setup)
  (setq rtags-completions-enabled t)
  (setq semantic-mode 1)
  (setq-local company-backends '(
  (company-keywords
  company-rtags
  company-clang
  company-semantic
  company-c-headers
  company-files
  company-dabbrev-code
  company-dabbrev
  company-oddmuse
  company-capf)
  ))
  (fci-mode)
  (flyspell-prog-mode)
)
;
(defun my-c-mode-hooks ()
  "MY-C-MODE-HOOKS."
  (interactive)
  (cmake-ide-setup)
  (setq semantic-mode 1)
  (setq rtags-completions-enabled t)
  (setq-local company-backends '(
  (company-keywords
  company-rtags
  company-clang
  company-semantic
  company-c-headers
  company-files
  company-dabbrev-code
  company-dabbrev
  company-oddmuse
  company-capf)
  ))
  (fci-mode)
  (flyspell-prog-mode)
)
;
(defun my-cmake-mode-hooks()
 "MY-CMAKE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-cmake company-dabbrev-code)))
 (flyspell-prog-mode)
)
;
(defun my-org-mode-hooks()
 "MY-ORG-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev)))
 (flyspell-mode 1)
)
;
(defun my-inferior-octave-mode-hooks()
 "MY-Inferior-OCTAVE-MODE-HOOKS."
 (turn-on-font-lock)
 (define-key inferior-octave-mode-map [up]
        'comint-previous-input)
 (define-key inferior-octave-mode-map [down]
  'comint-next-input)
  )
(defun my-octave-mode-hooks()
 "MY-OCTAVE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev-code)))
 (fci-mode)
 (set-fill-column 80)
 (auto-fill-mode 1)
 (abbrev-mode 1)
 (if (eq window-system 'x)
    (font-lock-mode 1))
 )
 (flyspell-prog-mode)
;
(defun my-python-mode-hooks()
 "MY-PYTHON-MODE-HOOKS."
 (setq-local company-backends '((company-files company-jedi company-dabbrev-code)))
 (require 'sphinx-doc)
 (sphinx-doc-mode t)
 (require 'py-isort)
 (add-hook 'before-save-hook 'py-isort-before-save)
 (fci-mode)
 (set-fill-column 100)
 (flyspell-prog-mode)
)
;
(defun my-nxml-mode-hooks()
 "MY-NXML-MODE-HOOKS."
 (setq-local company-backends '((company-files company-nxml company-dabbrev-code)))
 (flyspell-prog-mode)
)
;
(defun my-shell-mode-hooks()
 "MY-SHELL-MODE-HOOKS."
 (setq-local company-backends '((company-files company-shell company-dabbrev)))
 )
;
(defun my-eshell-mode-hooks ()
  "My-eshell-mode-hooks."
  (define-key eshell-mode-map (kbd "C-c C-h")  'helm-eshell-history)
  (define-key minibuffer-local-map (kbd "C-c C-m")  'helm-minibuffer-history) ; list actions using C-z
  (define-key shell-mode-map (kbd "C-c C-r")  'helm-comint-input-ring) ; list actions using C-z
)
;
(defun my-text-mode-hooks()
 "MY-TEXT-MODE-HOOKS."
 (setq-local company-backends '((company-ispell company-files company-dabbrev)))
 (turn-on-auto-fill)
 (fci-mode)
 (set-fill-column 80)
 (flyspell-mode 1)
 )
;
(defun my-markdown-mode-hooks()
 "MY-MARKDOWN-MODE-HOOKS."
 (setq-local company-backends '((company-ispell company-files company-dabbrev)))
 (turn-on-auto-fill)
 (fci-mode)
 (set-fill-column 80)
 (flyspell-prog-mode)
   (when buffer-file-name
     (add-hook 'after-save-hook 'check-parens nil t))
; warning, may yield wrong results in edge-cases like single double-quotes in code block.
; Use only if your files usually are balanced w/r/t double-quotes
; <http://stackoverflow.com/questions/9527593/>
 (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)
)
;
(defun my-latex-mode-hook ()
  "MY-LATEX-MODE-HOOK."
   (setq-local company-backends '((company-auctex
                                   company-auctex-bib-candidates
                                   company-auctex-bibs
                                   company-math-symbols-latex
                                   company-math-symbols-unicode
                                   company-latex-commands
                                   company-dabbrev-code
                                   )))
   (flyspell-mode 1)
)
(defun my-lisp-mode-hook ()
  "MY-elisp-MODE-HOOK."
  (flyspell-prog-mode)
)
(defun my-emacs-lisp-mode-hook ()
  "MY-emacs-elisp-MODE-HOOK."
  (setq-local company-backends '((
  company-dabbrev-code
  company-files
  company-oddmuse
  company-capf
  )))
  (focus-mode t)
  (turn-on-auto-fill)
  (fci-mode)
  (set-fill-column 80)
  (flyspell-prog-mode)
)
;;;;
;;;; ------ apply-mode-hooks ---------------------------------------------
;;;;
;;;; ------ apply-mode-hooks ---------------------------------------------
(add-hook 'c++-mode-hook #'my-c++-mode-hooks)
(add-hook 'c-mode-hook #'my-c-mode-hooks)
(add-hook 'cmake-mode-hook #'my-cmake-mode-hooks)
(add-hook 'org-mode-hook #'my-org-mode-hooks)
(add-hook 'octave-mode-hook #'my-octave-mode-hooks)
(add-hook 'python-mode-hook #'my-python-mode-hooks)
(add-hook 'nxml-mode-hook #'my-nxml-mode-hooks)
(add-hook 'shell-mode-hook #'my-shell-mode-hooks)
(add-hook 'eshell-mode-hook #'my-eshell-mode-hooks)
(add-hook 'text-mode-hook #'my-text-mode-hooks)
(add-hook 'markdown-mode-hook #'my-markdown-mode-hooks)
(add-hook 'LaTex-mode-hook #'my-latex-mode-hook)
(add-hook 'latex-mode-hook #'my-latex-mode-hook)
(add-hook 'lisp-mode-hook #'my-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook #'my-emacs-lisp-mode-hook)
;;;;;
;;;;; ------ apply-mode-hooks-end ---------------------------------------------
(load-library "style")
; should alway be the last
(load-library "evilsetup")
(provide '.emacs)
;;; .emacs ends here
