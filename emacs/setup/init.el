;;; package --- Summary
;;; commentary:
;;;
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(defvar *installenabled* t)
(defvar *magitenabled* t)
(defvar *rtagsenabled* nil)
(defvar *helmenabled* t)
(defvar *companyenabled* t)
(defvar *yasenabled* t)
(defvar *clangformatenabled* t)
(defvar *spotifyenabled* nil)
(defvar *sphinxenabled* nil)
(defvar *indentguideenabled* nil)
(defvar *anzuenabled* t)
(defvar *avyenabled* t)
(defvar *flycheckenabled* t)
(defvar *customvarenable* t)
(defvar *mymodehooksenable* t)
(defvar *styleenable* t)
(defvar *markdownenable* nil)
(defvar *texsiteenable* t)
(defvar *reftexenable* t)
(defvar *zealenable* t)
(defvar *moderncppenable* t)
(defvar *orgenable* nil)
(defvar *gdbenable* nil)
(defvar *octaveenable* t)
(defvar *typescriptenable* t)
(defvar *evilmultieditenable* nil)
(defvar *webmodeenable* t)
(defvar *sudoeditenable* t)
(defvar *systemdenable* t)
(defvar *elispformatenable* t)
(defvar *fcimodeenable* t)
(defvar *flyspellenable* t)
(defvar *writeroomenable* nil)
(defvar *fillcolumnenable* t)
(when *installenabled*
  (load-library "install"))
(when *companyenabled*
  (load-library "companysetup"))
(when *flycheckenabled*
  (load-library "flychecksetup"))
(when *magitenabled*
  (load-library "magitsetup"))
(when *rtagsenabled*
  (load-library "rtagssetup"))
(when *helmenabled*
  (load-library "helmsetup"))
(when *typescriptenable*
  (load-library "typescriptsetup"))
(when *yasenabled*
  (load-library "yassetup"))
(when *clangformatenabled*
  (load-library "clangformatsetup"))
(when *spotifyenabled*
  (load-library "spotifysetup"))
(when *sphinxenabled*
  (load-library "sphinxsetup"))
(when *indentguideenabled*
  (load-library "indentguidesetup"))
(when *anzuenabled*
  (load-library "anzusetup"))
(when *avyenabled*
  (load-library "avysetup"))
(when *customvarenable*
  (load-library "customvarsetup"))
(when *mymodehooksenable*
  (load-library "mymodehooks"))
(when *styleenable*
      (load-library "style"))
(when *reftexenable*
      (load-library "reftexsetup"))
(when *zealenable*
      (load-library "zealsetup"))
(when *orgenable*
      (load-library "orgsetup"))
(when *gdbenable*
      (load-library "gdbsetup"))
(when *octaveenable*
      (load-library "octavesetup"))
(when *moderncppenable*
      (load-library "moderncppsetup"))
(when *texsiteenable*
      (load-library "texsitesetup"))
(when *markdownenable*
      (load-library "markdownsetup"))
; should alway be the last
(load-library "evilsetup")
(provide '.emacs)
;;; .emacs ends here
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
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (company-tern smartparens-config evil-smartparens tide systemd sudo-edit evil-multiedit modern-cpp-font-lock moe-theme helm-ag company-flx company-dict popup-kill-ring magit-gerrit magit-gh-pulls magit-annex evil-magit magit py-isort sphinx-frontend py-import-check sphinx-doc fic-mode company-jedi jedi-core octave yasnippet markdown-mode web-mode zeal-at-point clang-format color-theme-approximate idea-darkula-theme fill-column-indicator helm-mode-manager smooth-scrolling helm-flyspell focus adjust-parens anzu evil-anzu ace-jump-helm-line ace-jump-buffer link-hint avy helm-cscope xcscope indent-guide nlinum password-generator google-translate dictcc helm-c-yasnippet helm-git-files helm-describe-modes helm-commandlinefu helm-open-github helm-orgcard helm-google helm-helm-commands helm-unicode helm-systemd helm-proc helm-git-grep helm-gitignore helm-chrome helm-pydoc helm-package helm-descbinds helm-fuzzier helm-flx helm-projectile helm company-auctex auctex cmake-font-lock cmake-project cmake-mode cmake-ide company-statistics company-quickhelp company-math helm-company company-shell company-c-headers company flycheck-checkbashisms flycheck evil-nerd-commenter evil-terminal-cursor-changer evil-search-highlight-persist evil-leader powerline-evil powerline evil multi use-package)))
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when *evilmultieditenable*
  (load-library "evil-multieditsetup"))

(when *webmodeenable*
  (load-library "webmodesetup"))
(when *sudoeditenable*
  (load-library "sudoeditsetup"))
(when *systemdenable*
  (load-library "systemdsetup"))
  (load-library "evilsmartparenssetup")
  (load-library "smartparenssetup")
  (load-library "ternsetup")
(load-library "companyternsetup")
(when *elispformatenable*
  (load-library "elispformatsetup"))
(when *fcimodeenable*
  (load-library "fcimodesetup"))
(when *flyspellenable*
  (load-library "flyspellsetup"))
(when *writeroomenable*
  (load-library "writeroomsetup"))
(when *fillcolumnenable*
  (load-library "fillcolumnsetup"))
(provide 'init.el)
;;; init.el ends here
