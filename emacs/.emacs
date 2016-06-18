;;; package --- Summary 

;;; commentary:
(require 'cl)
(require 'package)
;;;
;;; Code:
;;;;; ------ install-packages ---------------------------------------------
(setq cfg-var:packages '(evil powerline powerline-evil
                       evil-leader evil-search-highlight-persist evil-terminal-cursor-changer
                       flycheck flycheck-checkbashisms
                       company company-c-headers company-shell helm-company
                       company-math company-quickhelp company-statistics
                       cmake-ide cmake-mode cmake-project cmake-font-lock
                       auctex company-auctex
                       helm helm-projectile helm-dictionary helm-c-yasnippet helm-ls-git
                       helm-flx helm-fuzzier helm-descbinds helm-package helm-pydoc
                       helm-chrome helm-gitignore helm-git-grep helm-proc
                       helm-systemd helm-unicode helm-helm-commands helm-google
                       helm-orgcard helm-open-github helm-commandlinefu
                       helm-describe-modes helm-git-files
                       dictcc google-translate password-generator
                       nlinum indent-guide
                       xcscope helm-cscope
                       avy link-hint
                       ace-jump-buffer ace-jump-mode ace-jump-helm-line
                       ace-popup-menu; effect unclear
                       ace-window; integrate with helm C-w w
                       evil-anzu anzu
                       adjust-parens focus;at least good for emacs-lisp
                       helm-flyspell smooth-scrolling helm-mode-manager
                       fill-column-indicator idea-darkula-theme color-theme-approximate
                       clang-format zeal-at-point web-mode markdown-mode yasnippet
                       octave
                       jedi-core company-jedi fic-mode sphinx-doc py-import-check
                       sphinx-frontend py-isort
                       magit evil-magit magit-annex magit-gh-pulls
                       magit-gerrit;gerrit not configured
                       popup-kill-ring; to be configured
                       company-dict; check better
                       company-flx; check better
                       ;helm-bibtex;to be tested
                       ;helm-bibtexkey;to be tested
                       ;list-processes+
                       ;helm-ag;
                       ;helm-ag-r;
                       ;x-dict;
                       ;helm-org-rifle;to be tested
                       ;helm-c-moccur;to be tested
                       ;helm-codesearch;install codesearch to test
                       ;helm-dired-recent-dirs;to be tested
                       ;helm-dirset;to be tested
                       ;helm-fuzzy-find;to be tested
                       ;helm-git;to be tested
                       ;helm-make;to be tested
                       ;evil-nerd-commenter; to be tested
                       ;multi multi-eshell; to be tested
                       ;fzf; to be tested
                       ;helm-pages;wgrep-helm;wgrep;
                       ;org-redmine; to be tested org-repo-todo; to be tested org-pdfview; to be tested org-projectile; to be tested org-vcard; to be tested org-tracktable; to be tested org-bullets; org-present; org-gcal; org-bullets; org-autolist;
                       ;yafolding; yahoo-weather; x86-lookup; writegood-mode; which-key; wanderlust; vkill; visual-regexp; visual-regexp-steroids; viewer; use-package; auctex-lua; latex-preview-pane; latex-pretty-symbols; latex-unicode-math-mode; latex-math-preview; latex-extra; gscholar-bibtex; bibtex-utils; bibretrieve; bibslurp; ebib; empos; ivy-bibtex;
                       ;yapfify; grep+; ag; aok; arview; ascii; asilea; asn1-mode; assess; autodisass-llvm-bitcode; bog; butler; calfw; calfw-gcal; camcorder; capture; coffee-mode; col-highlight; csv-mode; csv-nav; define-word; demangle-mode; diffview; dired-dups; dired-efap; dropbox; edbi; edbi-sqlite; edbi-minor-mode; elfeed; elisp-sandbox; elmine; elpy; emacs-setup; emacs-eclim; evil-args; evil-easymotion; evil-cleverparens; evil-commentary; evil-exchange; evil-org; evil-vimish-fold; excorporate; fasd; figlet; flx; flx-ido; flx-isearch; flycheck-clangcheck; flycheck-google-cpplint; flycheck-tip; fsm; fuzzy; fuzzy-match; geben-helm-projectile; german-holidays; gist; gnuplot; gnuplot-mode; hide-comnt; hl-todo; ibuffer-git; ibuffer-projectile; igrep; initsplit; inline-crypt; insert-shebang; irfc; jenkins; json-mode; json-reformat; json-snatcher; json-rpc; jumplist; kaesar-mode; kaesar-file; kanban; know-your-http-well; kwin; live-py-mode; llvm-mode; logview; lxc; macro-math; macros+; markdown-mode+; markdown-preview-eww; markdown-toc; markdownfmt; markup; md-readme; mew; milkode; mouse+; multicolumn; nasm-mode; nav; nav-flash; navi-mode; neotree;
                       ;ninja-mode; noccur; occur-x; nose; notes-mode; omn-mode; on-parens; on-screen;
                       ;one-time-pad-encrypt; openwith; org-agenda-property; org-alert; org-attach-screenshot; org-caldav;org-dashboard;org-doing;
                       ;org-download;org-dropbox;org-themis;org-tree-slide;palette;parse-csv;
                       ;pass;passthword;password-store;password-vault;
                       ;path-headerline-mode;
                       ;pcre2el;pinentry;popup-switcher;pretty-mode;private-diary;
                       ;pungi;px;ssh;syslog-mode;systemd;telepathy;travis;
                       ))
;;;
(defun cfg:install-packages ()
  "My cfg:install-packages."
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
;;;;;
;;;;; ------ sphinx-frontend ---------------------------------------------
(require 'sphinx-frontend)
;;;;; needs some configuration
;;;;; ------ sphinx-frontend ---------------------------------------------
;;;;;
(require 'helm-pydoc)
(require 'helm-flyspell)
(define-key flyspell-mode-map (kbd "C-,") 'helm-flyspell-correct)
;;;;;
;;;;; ----- indent-guide ---------------------------------------------
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-delay 4)
(setq indent-guide-recursive t)
(setq indent-guide-char "|")
;;;;; ----- indent-guide ---------------------------------------------
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
(require 'link-hint)
(define-key evil-normal-state-map (kbd "C-l") 'link-hint-open-link)
(global-set-key (kbd "C-l") 'link-hint-open-link)
;;;;; ----- avy ---------------------------------------------
;;;;;
;;;;; ----- ace-jump ---------------------------------------------
(require 'ace-jump-buffer)
(global-unset-key (kbd "C-k"))
(define-key evil-normal-state-map (kbd "C-k") 'ace-jump-buffer)
(setq ace-jump-mode-move-keys
      '(?j ?h ?k ?l ?f ?g ?d ?s ?u ?r ?n ?v ?i ?e ?o ?w))
(require 'ace-jump-helm-line)
(eval-after-load "helm"
  '(define-key helm-map (kbd "C-j") 'ace-jump-helm-line))
(ace-jump-helm-line-idle-exec-add 'helm-mini)
(ace-jump-helm-line-idle-exec-add 'helm-find-files)
(setq ace-jump-helm-line-style 'pre)
(setq ace-jump-helm-line-background t)
(setq ace-jump-helm-line-idle-delay 1)
(ace-jump-helm-line-autoshow-mode +1)
;; use `linum-mode' to show
(setq ace-jump-helm-line-autoshow-mode-use-linum t)
(require 'ace-popup-menu)
;;; effect unclear
(ace-popup-menu-mode 1)
(setq ace-popup-menu-show-pane-header t)
;;;;; ----- ace-jump ---------------------------------------------
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
(add-hook 'after-save-hook 'magit-after-save-refresh-status)
(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
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
(require 'company-statistics)
(company-statistics-mode)
(company-quickhelp-mode 1)
(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
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
(define-key evil-normal-state-map (kbd "SPC") 'helm-occur)
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
(setq airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)
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
  "My clang-format-on-save."
  :group 'myinit
  :type 'booleanp
  :safe #'booleanp)
(defun clang-format-before-save ()"Add this to .emacs to clang-format on save(add-hook 'before-save-hook 'clang-format-before-save)."
       (interactive)(when (eq major-mode 'c-mode) (clang-format-buffer)))
(when (eq t clang-format-on-save) (add-hook 'before-save-hook  'clang-format-before-save) )
;;;;;
;;;;; ------ clang-format-mode ---------------------------------------------
;;;;;
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
  (set-fill-column 80)
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
(add-hook 'c-mode-hook #'my-rtags-keybindings)
(add-hook 'c++-mode-hook #'my-rtags-keybindings)
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
(define-key evil-normal-state-map (kbd "C-b") (lambda ()
                                               (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-n") (lambda ()
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
;()
;
(provide '.emacs)
;;; .emacs ends here
