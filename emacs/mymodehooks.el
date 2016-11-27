;;; package --- Summary
;;; commentary:
;;; Code:

(defun my-c++-mode-hooks ()
  "MY-C++-MODE-HOOKS."
  (interactive)
  (cmake-ide-setup)
  (setq rtags-completions-enabled t)
  (setq semantic-mode 1)
  (setq-local company-backends '(
  (company-keywords
  company-rtags
  ;company-clang
  ;company-semantic
  ;company-c-headers
  ;company-files
  ;company-dabbrev-code
  ;company-dabbrev
  ;company-oddmuse
  ;company-capf)
  )
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
  ;company-clang
  ;company-semantic
  ;company-c-headers
  ;company-files
  ;company-dabbrev-code
  ;company-dabbrev
  ;company-oddmuse
  ;company-capf)
  )
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
(defun my-typescript-mode-hook ()
  "MY-typescript-MODE-HOOK."
  (tide-setup)
  (setq-local company-backends '((
  company-tooltip-align-annotations t
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
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;;(eldoc-mode +1)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
)
(defun my-javascript-mode-hook ()
  "MY-javascript-MODE-HOOK."
  
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
(add-hook 'typescript-mode-hook #'my-typescript-mode-hook)
(add-hook 'js2-mode-hook #'setup-tide-mode)
;;;;;
;;;;; ------ apply-mode-hooks-end ---------------------------------------------

(provide 'mymodehooks.el)
;;; mymodehooks.el ends here
