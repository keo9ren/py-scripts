;;; package --- Summary 
;;; commentary:
(require 'cl)
(require 'package)
;;;
;;; Code:
;;;;; ------ install-packages ---------------------------------------------
(setq cfg-var:packages '(evil
                       powerline
                       powerline-evil
                       airline-themes
                       evil-leader
                       evil-search-highlight-persist
                       evil-terminal-cursor-changer
                       flycheck
                       company
                       company-c-headers
                       cmake-mode
                       cmake-project
                       auctex
                       company-auctex
                       cmake-ide
                       helm
                       helm-projectile
                       helm-ls-git
                       helm-dictionary
                       helm-c-yasnippet
                       smooth-scrolling
                       fill-column-indicator
                       idea-darkula-theme
                       color-theme-approximate
                       clang-format
                       zeal-at-point
                       web-mode
                       markdown-mode
                       yasnippet
                       octave
                       company-shell
                       helm-company
                       jedi-core
                       company-jedi
                       magit
                       evil-magit
                       ))
;;;
(defun cfg:install-packages ()
    (let ((pkgs (remove-if #'package-installed-p cfg-var:packages)))
       (when pkgs
            (message "%s" "Emacs refresh packages database...")
            (package-refresh-contents)
            (message "%s" " done.")
            (dolist (p cfg-var:packages)
                (package-install p)))))
;;
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
;;;;; ------ install-packages ---------------------------------------------
;;;;;
(cfg:install-packages)
(setq inhibit-startup-message t)
;;;;
(setq-default tab-width 4 indent-tabs-mode nil)
;;; open file on last edit
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)
;;; disable scrollbar
(scroll-bar-mode -1)
;;; open maximized
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
    ("878e22a7fe00ca4faba87b4f16bc269b8d2be5409d1c513bb7eda025da7c1cf4" default)))
 '(doc-view-continuous t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
;;;;; ------ okular ---------------------------------------------
;;;;;
;;;;; ------ magit ---------------------------------------------
(require 'magit)
;;;;; ------ magit ---------------------------------------------
;;;;;
;;;;;
;;;;; ------ evil-magit ---------------------------------------------
(require 'evil-magit)
;;;;; ------ evil-magit ---------------------------------------------
;;;;;
;;;;; ------ company-mode ---------------------------------------------
;; unused modes;;company-semantic;company-ispell;company-etags;company-gtags;company-css
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;;;; ------ helm-company ---------------------------------------------
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
;;;;; ------ helm-company ---------------------------------------------
;;;;;
;;;;; ------ company-mode yas-mode ---------------------------------------------
  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)
;;;;; ------ company-mode yas-mode ---------------------------------------------
;;;;; ------ company-mode ---------------------------------------------
;;;;; ------ theme ---------------------------------------------
(load-theme 'idea-darkula t)
(color-theme-approximate-on)
;;;;; ------ theme ---------------------------------------------
;;;;;
;;;;; ------ flycheck ---------------------------------------------
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;;;;;
;;;;; ------ rtags ---------------------------------------------
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/rtags.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/company-rtags.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/flycheck-rtags.el")
(require 'rtags)
;;;; ------ rtags ---------------------------------------------
;;;;

;;;fci
(add-hook 'text-mode-hook (lambda () (turn-on-auto-fill)
                            (fci-mode)
                            (set-fill-column 80)))
(add-hook 'markdown-mode-hook (lambda () (turn-on-auto-fill)
                            (fci-mode)
                            (set-fill-column 80)))
(add-hook 'python-mode-hook (lambda () 
                            (fci-mode)
                            (set-fill-column 100)))
(add-hook 'c-mode-hook (lambda () 
                            (fci-mode)
                            (set-fill-column 80)))
(add-hook 'octave-mode-hook (lambda () 
                            (fci-mode)
                            (set-fill-column 80)))
;;;;;
;;;;
;;;; ------ apply-mode-hooks ---------------------------------------------


;;;;; ------ mode-hook ---------------------------------------------
;;;vim like indent
(define-key global-map (kbd "RET") 'newline-and-indent)
;;;;; ------ mode-hook ---------------------------------------------


;;;;; ------ gdb ---------------------------------------------
; decent gdb setup
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
;;;;; ------ gdb ---------------------------------------------


;;;;; ------ auctex ---------------------------------------------
;;; Anpassungen für AUCTeX
;;(load "auctex.el" nil t t)
;maybe outdated as well integrated
;(load "preview-latex.el" nil t t)
(require 'tex-site)
(require 'company-auctex)
(add-hook 'LaTex-mode-hook 'company-auctex-init)
(add-hook 'latex-mode-hook 'company-auctex-init)
(add-hook 'LaTex-mode-hook
          (lambda ()
            (setq-local company-backends '((company-auctex company-auctex-bib-candidates company-auctex-bibs company-dabbrev-code)))))
(add-hook 'latex-mode-hook
          (lambda ()
            (setq-local company-backends '((company-auctex company-auctex-bib-candidates company-auctex-bibs company-dabbrev-code)))))
;;;;; ------ auctex ---------------------------------------------


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

;;;;; ------ spell -----------------------------------------
(require 'ispell)
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")
(dolist (hook '(text-mode-hook tex-mode-hook LaTex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(emacs-lisp-mode-hook prog-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))
;
;;;;; ------ spell ---------------------------------------------

;;;;; ------ helm ---------------------------------------------
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(semantic-mode 1)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "M-x") 'helm-M-x)
;;
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;;
(setq helm-quick-update)
(setq helm-bookmark-show-location t ;
      helm-buffers-fuzzy-matching t ; helm-mini
      helm-recentf-fuzzy-match t    ; helm-mini
      helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t;
      helm-M-x-fuzzy-match t; 
      helm-semantic-fuzzy-match t;
      helm-apropos-fuzzy-match t;
      helm-lisp-fuzzy-completion t;
      )
(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;;;;; ------ helm ---------------------------------------------

;;;;; ------ helm-eshell ---------------------------------------------
(require 'eshell)
(require 'helm-eshell)

(define-key minibuffer-local-map (kbd "C-c C-l")  'helm-minibuffer-history) ; list actions using C-z
(define-key shell-mode-map (kbd "C-c C-l")  'helm-comint-input-ring) ; list actions using C-z
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

(defun helm-my-buffers ()
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

;;;;; ------ helm-ls-git ---------------------------------------------
(require 'helm-ls-git)
(global-set-key (kbd "C-<f6>") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
;;;;; ------ helm-ls-git ---------------------------------------------


;;;;; ------ helm-dictionary ---------------------------------------------
(require 'helm-dictionary)
;; sudo apt-get install trans-de-en
;;;;; ------ helm-dictionary ---------------------------------------------

;; display line numbers
(require 'linum)
(setq linum-mode t)
;;;;; ------ vim-scrolling ---------------------------------------------
;vim like scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
;;;;; ------ vim-scrolling ---------------------------------------------
;;;;; ------ clang-format-mode ---------------------------------------------
(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-sol)
;;;;; ------ clang-format-mode ---------------------------------------------

;;;;; ------ clang-format-mode ---------------------------------------------
(require 'clang-format)
;;Hook function
;;(defun clang-format-before-save ()"Add this to .emacs to clang-format on save(add-hook 'before-save-hook 'clang-format-before-save)."
;;       (interactive)(when (eq major-mode 'c-mode) (clang-format-buffer)))
;;use clang-format on save
;;(add-hook 'before-save-hook 'clang-format-before-save)
;;;;; ------ clang-format-mode ---------------------------------------------

;;;;; ------ spotify-mode ---------------------------------------------
;;(load-file "/home/oliver/.tools/scripts-and-more/emacs/helm-spotify/helm-spotify.el")

;;helm spotify has errors if called without debug-on-error set. So i wrote this wrapper
(defun john-spotify ()
  "wrapper for calling spotify from keyboard shortcut and removing possibility for error"
  (interactive)
  (setq debug-on-error t)
  (helm-spotify)
  (setq debug-on-error nil))
(global-set-key (kbd "C-x M-s") 'john-spotify)

(defun spotify-start ()
  "Start the spotify server."
  (interactive)
  (shell-command (format "spotify --minimized &"))
  )
;;(get-process "spotify")
(show-paren-mode 1)
(setq show-paren-delay 0)
;;;;; ------ spotify-mode ---------------------------------------------


;; have to fct here to quit on one ESC

;;start maximised to be determinated

;;;;; ------ zeal-mode ---------------------------------------------
;;browse offline documentation
(require 'zeal-at-point)
(global-set-key "\C-cd" 'zeal-at-point)
;;;;; ------ zeal-mode ---------------------------------------------

;;;;; ------ org-mode ---------------------------------------------
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;;;; ------ org-mode ---------------------------------------------


;;;;; ------ markdown-mode ---------------------------------------------
(require 'markdown-mode)
(add-hook 'markdown-mode-hook
            (lambda ()
              (when buffer-file-name
                (add-hook 'after-save-hook
                          'check-parens
                          nil t))))

; warning, may yield wrong results in edge-cases like single double-quotes in code block.
; Use only if your files usually are balanced w/r/t double-quotes
; <http://stackoverflow.com/questions/9527593/>
(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))
;;;;; ------ markdown-mode ---------------------------------------------

;;;;; ------ yasnippet-mode ---------------------------------------------
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(yas-global-mode t)
(add-to-list 'yas-snippet-dirs "/home/oliver/.tools/scripts-and-more/emacs/yasnippet/")
;;(yas-indent-line 'fixed)
;;(yas-load-directory "")
;;;;; ------ yasnippet-mode ---------------------------------------------

;;;;; ------ Octave-mode ---------------------------------------------
(require 'octave)
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))
;; to turn on the abbrevs, auto-fill and font-lock features automatically  
(add-hook 'octave-mode-hook
    (lambda ()
    (abbrev-mode 1)
    (auto-fill-mode 1)
    (if (eq window-system 'x)
    (font-lock-mode 1))))
;; And finally, inferior-octave-mode-hook is run after starting the process 
;; and putting its buffer into Inferior Octave mode. Hence, if you like 
;; the up and down arrow keys to behave in the interaction buffer as in 
;; the shell, and you want this buffer to use nice colors:
(add-hook 'inferior-octave-mode-hook
    (lambda ()
    (turn-on-font-lock)
    (define-key inferior-octave-mode-map [up]
        'comint-previous-input)
    (define-key inferior-octave-mode-map [down]
        'comint-next-input))) 


;;;;; ------ Octave-mode-end ---------------------------------------------

;;;;; ------ my-x-mode-hooks ---------------------------------------------
(defun my-c++-mode-hooks ()
  "MY C++."
  (interactive)
  (cmake-ide-setup)
  (setq rtags-completions-enabled t)
  (setq semantic-mode 1)
  (setq-local company-backends '(
  (company-clang)
  (company-keywords);doesn't work well
  (company-rtags); slow compared to clang
  (company-files)
  (company-dabbrev-code)
  (company-dabbrev)
  (company-oddmuse)
  (company-capf)
  ))
  )
(add-hook 'c++-mode-hook #'my-c++-mode-hooks)
(defun my-c-mode-hooks ()
  "MY C++."
  (interactive)
  (cmake-ide-setup)
  (setq semantic-mode 1)
  (setq rtags-completions-enabled t)
  (setq-local company-backends '(
  (company-clang)
  (company-keywords);doesn't work well
  (company-rtags); slow compared to clang
  (company-files)
  (company-dabbrev-code)
  (company-dabbrev)
  (company-oddmuse)
  (company-capf)
  ))
  )
(add-hook 'c-mode-hook #'my-c-mode-hooks)
(setq company-backends '((
                          company-files
                          company-dabbrev-code
                          company-dabbrev
                          company-oddmuse
                          company-capf
                          )))
(defun my-cmake-mode-hooks()
 "MY-CMAKE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-cmake company-dabbrev-code)))
  )
(defun my-org-mode-hooks()
 "MY-ORG-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev)))
  )
(defun my-octave-mode-hooks()
 "MY-OCTAVE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev-code)))
  )
(defun my-python-mode-hooks()
 "MY-PYTHON-MODE-HOOKS."
 (setq-local company-backends '((company-files company-jedi company-dabbrev-code)))
  )
(defun my-nxml-mode-hooks()
 "MY-NXML-MODE-HOOKS."
 (setq-local company-backends '((company-files company-nxml company-dabbrev-code)))
  )
(defun my-shell-mode-hooks()
 "MY-SHELL-MODE-HOOKS."
 (setq-local company-backends '((company-shell company-files company-dabbrev)))
  )
;;;; ------ apply-mode-hooks ---------------------------------------------
(add-hook 'cmake-mode-hook #'my-cmake-mode-hooks)
(add-hook 'org-mode-hook #'my-org-mode-hooks)
(add-hook 'octave-mode-hook #'my-octave-mode-hooks)
(add-hook 'python-mode-hook #'my-python-mode-hooks)
(add-hook 'nxml-mode-hook #'my-nxml-mode-hooks)
(add-hook 'shell-mode-hook #'my-shell-mode-hooks)

;;;;; ------ apply-mode-hooks-end ---------------------------------------------
;;;;;
;;;;; ------ evil-mode-start ---------------------------------------------
; should alway be the last
(require 'evil)
(evil-mode 1)
;;browse visual-line
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;;screen up/down
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))
(setq evil-move-cursor-back nil)
;;own leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)
;;highligh persist
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
;; clean highlight leader(,) Space
(evil-leader/set-key "u" 'evil-search-highlight-persist-remove-all)
;;
(unless (display-graphic-p) (require 'evil-terminal-cursor-changer))
(setq evil-visual-state-cursor '("red" box))
(setq evil-insert-state-cursor '("green" bar))
(setq evil-emacs-state-cursor '("blue" hbar))
;;;;; ------ evil-mode-end ---------------------------------------------

(provide '.emacs)
;;; .emacs ends here
