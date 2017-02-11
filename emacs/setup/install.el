;;; package --- Summary
;;; commentary:
;;; Code:
(require 'cl)
(require 'package)
(setq cfg-var:packages '(
                       use-package
                       multi; required for helm-spotify
                       evil
                       powerline
                       powerline-evil
                       evil-leader
                       evil-search-highlight-persist
                       evil-terminal-cursor-changer
                       evil-nerd-commenter
                       flycheck
                       flycheck-checkbashisms
                       company
                       company-c-headers
                       company-shell
                       helm-company
                       company-math
                       company-quickhelp
                       company-statistics
                       cmake-ide
                       cmake-mode
                       cmake-project
                       cmake-font-lock
                       auctex
                       company-auctex
                       helm
                       helm-projectile
                       helm-flx
                       helm-fuzzier
                       helm-descbinds
                       helm-package
                       helm-pydoc
                       helm-chrome
                       helm-gitignore
                       helm-git-grep
                       helm-proc
                       helm-systemd
                       helm-unicode
                       helm-helm-commands
                       helm-google
                       helm-orgcard
                       helm-open-github
                       helm-commandlinefu
                       helm-describe-modes
                       helm-git-files
                       helm-c-yasnippet;kdb
                       dictcc
                       google-translate
                       password-generator
                       nlinum
                       indent-guide
                       xcscope
                       helm-cscope
                       avy
                       link-hint
                       ace-jump-buffer
                       ace-jump-helm-line
                       evil-anzu
                       anzu
                       adjust-parens
                       helm-flyspell
                       smooth-scrolling
                       helm-mode-manager
                       fill-column-indicator
                       idea-darkula-theme
                       color-theme-approximate
                       clang-format
                       zeal-at-point
                       web-mode
                       markdown-mode
                       yasnippet
                       octave
                       jedi-core
                       company-jedi
                       fic-mode
                       sphinx-doc
                       py-import-check
                       sphinx-frontend
                       py-isort
                       magit
                       evil-magit
                       magit-annex
                       magit-gh-pulls
                       magit-gerrit;gerrit not configured
                       popup-kill-ring; to be configured
                       company-dict; check better
                       company-flx; check better
                       helm-ag;
                       moe-theme;
                       modern-cpp-font-lock;
                       tide
                       elisp-format
                       writeroom-mode
                       ;helm-ls-git ;helm-bibtex; ;helm-bibtexkey; ;list-processes+ ;helm-ag-r; ;x-dict; ;helm-org-rifle; ;helm-c-moccur;
                       ;helm-codesearch;install codesearch to test
                       ;helm-dired-recent-dirs; ;helm-dirset; ;helm-fuzzy-find; ;helm-git; ;helm-make;
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
(provide 'install.el)
;;; install.el ends here
