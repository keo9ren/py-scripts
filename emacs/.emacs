;;; package --- Summary 
;;; commentary:
(require 'cl)
(require 'package)
;;;
;;; Code:
;;;;; ------ install-packages ---------------------------------------------
(setq cfg-var:packages '(evil powerline powerline-evil
                       evil-leader evil-search-highlight-persist evil-terminal-cursor-changer
                       flycheck
                       company company-c-headers company-shell helm-company
                       cmake-ide cmake-mode cmake-project
                       auctex company-auctex
                       helm-bibtex;to be tested
                       helm-bibtexkey;to be tested
                       helm helm-projectile helm-dictionary helm-c-yasnippet helm-ls-git
                       helm-flx helm-fuzzier helm-descbinds helm-package helm-pydoc
                       helm-chrome helm-ack helm-gitignore helm-git-grep helm-proc
                       helm-systemd helm-unicode helm-helm-commands helm-google
                       helm-orgcard helm-open-github helm-commandlinefu
                       helm-describe-modes helm-git-files
                       helm-org-rifle;to be tested
                       ;helm-c-moccur;to be tested
                       helm-codesearch;install codesearch to test
                       helm-dired-recent-dirs;to be tested
                       helm-dirset;to be tested
                       helm-fuzzy-find;to be tested
                       helm-git;to be tested
                       helm-make;to be tested
                       helm-mode-manager;to be tested
                       ;helm-pages;;to be tested
                       helm-spaces;to be tested
                       wgrep-helm;to be tested
                       flyspell-correct-helm;to be tested
                       smooth-scrolling
                       fill-column-indicator
                       idea-darkula-theme
                       color-theme-approximate
                       clang-format
                       zeal-at-point
                       web-mode markdown-mode
                       yasnippet
                       octave
                       jedi-core company-jedi magit evil-magit fic-mode
                       evil-nerd-commenter; to be tested
                       multi multi-eshell; to be tested
                       fzf; to be tested
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
(cfg:install-packages)
;;;;; ------ install-packages ---------------------------------------------
(require 'helm-pydoc)
;;;;;
;;;;; ----- magit ---------------------------------------------
(require 'magit)
(require 'evil-magit)
(global-unset-key (kbd "C-c m d"))
(global-set-key (kbd "C-c m d") 'magit-diff-popup)
(global-unset-key (kbd "C-c m s"))
(global-set-key (kbd "C-c m s") 'magit-status)
(global-unset-key (kbd "C-c m f"))
(global-set-key (kbd "C-c m f") 'magit-stage-file)
(global-unset-key (kbd "C-c m p"))
(global-set-key (kbd "C-c m p") 'magit-push)
;;;;; ------ evil-magit ---------------------------------------------
;;;;;
;;;;; ------ yasnippet-mode ---------------------------------------------
(require 'helm-fuzzy-find)
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
(require 'helm-company)
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
;;;;;
;;;;; ------ flycheck ---------------------------------------------
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;;;;;
;;;;; ------ rtags ---------------------------------------------
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/rtags.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/company-rtags.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/rtags/src/flycheck-rtags.el")
;(load-file "/usr/local/share/emacs/site-lisp/rtags/rtags.el")
;(load-file "/usr/local/share/emacs/site-lisp/rtags/company-rtags.el")
;(load-file "/usr/local/share/emacs/site-lisp/rtags/flycheck-rtags.el")
(require 'rtags)
(defun my-rtags-keybindings()
 "My-rtags-keybindings."
 ;(local-unset-key (kbd ""))
 ;(local-set-key (kbd "C-c r ") 'rtags-print-symbol-info)
 (local-unset-key (kbd "C-c r s"))
 (local-set-key (kbd "C-c r s") 'rtags-display-summary)
 (local-unset-key (kbd "C-c r i"))
 (local-set-key (kbd "C-c r i") 'rtags-get-include-file-for-symbol)
 (local-unset-key (kbd "C-c r f"))
 (local-set-key (kbd "C-c r f") 'rtags-find-symbol)
 (local-unset-key (kbd "C-c r n"))
 (local-set-key (kbd "C-c r n") 'rtags-rename-symbol)
 (local-unset-key (kbd "C-c r r"))
 (local-set-key (kbd "C-c r r") 'rtags-find-references)
 (local-unset-key (kbd "C-c r v"))
 (local-set-key (kbd "C-c r v") 'rtags-find-virtuals-at-point)
 )
;;;; ------ rtags ---------------------------------------------
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
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
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
(dolist (hook '(text-mode-hook tex-mode-hook LaTex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(emacs-lisp-mode-hook prog-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))
;;;;;
;;;;; ------ spell ---------------------------------------------
;;;;;
;;;;; ------ helm ---------------------------------------------
(require 'helm-fuzzier)
(helm-fuzzier-mode 1)
(require 'helm-flx)
(helm-flx-mode +1)
(require 'helm-descbinds)
(helm-descbinds-mode)
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
(global-unset-key (kbd "C-c b"))
(global-set-key (kbd "C-c b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "M-y") 'helm-show-kill-ring); bad kbd seems useful
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c h x") 'helm-register)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-unset-key (kbd "C-c h @"))
(global-set-key (kbd "C-c h @") 'helm-package)
(setq helm-quick-update)
(setq helm-bookmark-show-location t ;
      helm-buffers-fuzzy-matching t ; helm-mini
      helm-recentf-fuzzy-match t    ; helm-mini
      helm-split-window-in-side-p t ; open helm buffer inside current window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top/bottom
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function'
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
;
;;;;; ------ helm ---------------------------------------------

;;;;; ------ helm-eshell ---------------------------------------------
(require 'eshell)
(require 'helm-eshell)
;
(define-key minibuffer-local-map (kbd "C-c C-l")  'helm-minibuffer-history) ; list actions using C-z
(define-key shell-mode-map (kbd "C-c C-l")  'helm-comint-input-ring) ; list actions using C-z
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
;
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
;;;;;
;;;;; ------ helm-dictionary ---------------------------------------------
(require 'helm-dictionary)
;; sudo apt-get install trans-de-en
;;;;; ------ helm-dictionary ---------------------------------------------
;;;;;
;;;;; ------ vim-scrolling ---------------------------------------------
;vim like scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
;;;;; ------ vim-scrolling ---------------------------------------------
;;;;; ------ clang-format-mode ---------------------------------------------
(require 'powerline)
(load-file "/home/oliver/.tools/scripts-and-more/emacs/airline-themes/airline-themes.el")
(load-file "/home/oliver/.tools/scripts-and-more/emacs/airline-themes/airline-sol-theme.el")
(require 'airline-themes)
;;;;; ------ theme ---------------------------------------------
(load-theme 'idea-darkula t)
(color-theme-approximate-on)
;;;;; ------ theme ---------------------------------------------
(load-theme 'airline-sol)
;(load-theme 'airline-light)
(setq airline-shortened-directory-length 5)
(setq airline-display-directory nil)
;(load-theme 'airline-base16-shell-dark)
;;;;; ------ clang-format-mode ---------------------------------------------
;;;;;
;;;;; ------ clang-format-mode ---------------------------------------------
(require 'clang-format)
(defcustom clang-format-on-save
  t
  "clang-format-on-save."
  :group 'myinit
  :type 'booleanp
  :safe #'booleanp)
(defun clang-format-before-save ()"Add this to .emacs to clang-format on save(add-hook 'before-save-hook 'clang-format-before-save)."
       (interactive)(when (eq major-mode 'c-mode) (clang-format-buffer)))
(when (eq t clang-format-on-save) (add-hook 'before-save-hook  'clang-format-before-save) )
;;;;;
;;;;; ------ clang-format-mode ---------------------------------------------
;
;;;;; ------ spotify-mode ---------------------------------------------
(load-file "/home/oliver/.tools/scripts-and-more/emacs/helm-spotify/helm-spotify.el")
(require 'helm-spotify)
;;;;;
(show-paren-mode 1)
(setq show-paren-delay 0.4)
;;;;; ------ spotify-mode ---------------------------------------------
;;;;;
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
;
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
  (set-fill-column 80)
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
  (set-fill-column 80)
  )
;
(defun my-cmake-mode-hooks()
 "MY-CMAKE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-cmake company-dabbrev-code)))
  )
;
(defun my-org-mode-hooks()
 "MY-ORG-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev)))
  )
;
(defun my-octave-mode-hooks()
 "MY-OCTAVE-MODE-HOOKS."
 (setq-local company-backends '((company-files company-dabbrev-code)))
 (fci-mode)
 (set-fill-column 80)
  )
;
(defun my-python-mode-hooks()
 "MY-PYTHON-MODE-HOOKS."
 (setq-local company-backends '((company-files company-jedi company-dabbrev-code)))
 (fci-mode)
 (set-fill-column 100)
  )
;
(defun my-nxml-mode-hooks()
 "MY-NXML-MODE-HOOKS."
 (setq-local company-backends '((company-files company-nxml company-dabbrev-code)))
  )
;
(defun my-shell-mode-hooks()
 "MY-SHELL-MODE-HOOKS."
 (setq-local company-backends '((company-files company-shell company-dabbrev)))
 )
;
(defun my-text-mode-hooks()
 "MY-TEXT-MODE-HOOKS."
 (setq-local company-backends '((company-ispell company-files company-dabbrev)))
 (turn-on-auto-fill)
 (fci-mode)
 (set-fill-column 80)
 )
;
(defun my-markdown-mode-hooks()
 "MY-MARKDOWN-MODE-HOOKS."
 (setq-local company-backends '((company-ispell company-files company-dabbrev)))
 (turn-on-auto-fill)
 (fci-mode)
 (set-fill-column 80)
 )
;
(defun my-latex-mode-hook ()
  "MY-LATEX-MODE-HOOK."
   (setq-local company-backends '((company-auctex
                                   company-auctex-bib-candidates
                                   company-auctex-bibs
                                   company-dabbrev-code)))
)
;;;;
;;;; ------ apply-mode-hooks ---------------------------------------------
;;;;
;;;; ------ apply-mode-hooks ---------------------------------------------
(add-hook 'c++-mode-hook #'my-c++-mode-hooks)
(add-hook 'c-mode-hook #'my-c-mode-hooks)
(add-hook 'c-mode-hook #'my-rtags-keybindings)
(add-hook 'c++-mode-hook #'my-rtags-keybindings)
(add-hook 'cmake-mode-hook #'my-cmake-mode-hooks)
(add-hook 'org-mode-hook #'my-org-mode-hooks)
(add-hook 'octave-mode-hook #'my-octave-mode-hooks)
(add-hook 'python-mode-hook #'my-python-mode-hooks)
(add-hook 'nxml-mode-hook #'my-nxml-mode-hooks)
(add-hook 'shell-mode-hook #'my-shell-mode-hooks)
(add-hook 'text-mode-hook #'my-text-mode-hooks)
(add-hook 'markdown-mode-hook #'my-markdown-mode-hooks)
(add-hook 'LaTex-mode-hook #'my-latex-mode-hook)
(add-hook 'latex-mode-hook #'my-latex-mode-hook)
;;;;;
;;;;; ------ apply-mode-hooks-end ---------------------------------------------
;;;;;
;;;;;
;;;;; ----- style and behavior -----------
;;;;;
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;;;;;
(setq inhibit-startup-message t)
;;;;;
(setq-default tab-width 4 indent-tabs-mode nil)
;;; open file on last edit
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
;;; disable scrollbar
(scroll-bar-mode -1)
;;; open maximized 
;;;vim like indent
(define-key global-map (kbd "RET") 'newline-and-indent)
;;;;; ----- style and behavior -----------
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
;
(provide '.emacs)
;;; .emacs ends here
