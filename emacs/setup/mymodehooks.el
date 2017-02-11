;;; package --- Summary
;;; commentary:
;;; Code:
(defun my-cmake-mode-hooks() 
  "MY-CMAKE-MODE-HOOKS."
  (setq-local company-backends '((company-files company-cmake company-dabbrev-code))) 
  )
(defun my-org-mode-hooks() 
  "MY-ORG-MODE-HOOKS."
  (setq-local company-backends '((company-files company-dabbrev))) 
  )
(defun my-inferior-octave-mode-hooks() 
  "MY-Inferior-OCTAVE-MODE-HOOKS."
  (turn-on-font-lock) 
  (define-key inferior-octave-mode-map [up] 'comint-previous-input) 
  (define-key inferior-octave-mode-map [down] 'comint-next-input))
(defun my-octave-mode-hooks() 
  "MY-OCTAVE-MODE-HOOKS."
  (setq-local company-backends '((company-files company-dabbrev-code))) 
  (set-fill-column 80) 
  (auto-fill-mode 1) 
  (abbrev-mode 1) 
  (if (eq window-system 'x) 
      (font-lock-mode 1))) 
(defun my-python-mode-hooks() 
  "MY-PYTHON-MODE-HOOKS."
  (setq-local company-backends '((company-files company-jedi company-dabbrev-code))) 
  (require 'sphinx-doc) 
  (sphinx-doc-mode t) 
  (require 'py-isort) 
  (add-hook 'before-save-hook 'py-isort-before-save) 
  (set-fill-column 100) 
  )
(defun my-nxml-mode-hooks() 
  "MY-NXML-MODE-HOOKS."
  (setq-local company-backends '((company-files company-nxml company-dabbrev-code))) 
  )
(defun my-shell-mode-hooks() 
  "MY-SHELL-MODE-HOOKS."
  (setq-local company-backends '((company-files company-shell company-dabbrev))))
(defun my-eshell-mode-hooks () 
  "My-eshell-mode-hooks."
  (define-key eshell-mode-map (kbd "C-c C-h")  'helm-eshell-history) 
  (define-key minibuffer-local-map (kbd "C-c C-m")  'helm-minibuffer-history) ; list actions using C-z
  (define-key shell-mode-map (kbd "C-c C-r")  'helm-comint-input-ring) ; list actions using C-z
  )
(defun my-text-mode-hooks() 
  "MY-TEXT-MODE-HOOKS."
  (setq-local company-backends '((company-ispell company-files company-dabbrev))) 
  (turn-on-auto-fill) 
  (set-fill-column 80) 
  (flyspell-mode 1))
(defun my-markdown-mode-hooks() 
  "MY-MARKDOWN-MODE-HOOKS."
  (setq-local company-backends '((company-ispell company-files company-dabbrev))) 
  (turn-on-auto-fill) 
  (set-fill-column 80) 
  (when buffer-file-name (add-hook 'after-save-hook 'check-parens nil t))
                                        ; warning, may yield wrong results in edge-cases like single double-quotes in code block.
                                        ; Use only if your files usually are balanced w/r/t double-quotes
                                        ; <http://stackoverflow.com/questions/9527593/>
  (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table))
(defun my-latex-mode-hook () 
  "MY-LATEX-MODE-HOOK."
  (setq-local company-backends '((company-auctex company-auctex-bib-candidates company-auctex-bibs
                                                 company-math-symbols-latex
                                                 company-math-symbols-unicode company-latex-commands
                                                 company-dabbrev-code))) 
  )
(defun my-emacs-lisp-mode-hook () 
  "MY-emacs-elisp-MODE-HOOK."
  (setq-local company-backends '((company-dabbrev-code company-files company-oddmuse company-capf))) 
  (focus-mode t)
  (turn-on-auto-fill) 
  (set-fill-column 80))
;; (add-hook 'cmake-mode-hook #'my-cmake-mode-hooks)
;; (add-hook 'org-mode-hook #'my-org-mode-hooks)
;; (add-hook 'octave-mode-hook #'my-octave-mode-hooks)
;; (add-hook 'python-mode-hook #'my-python-mode-hooks)
;; (add-hook 'nxml-mode-hook #'my-nxml-mode-hooks)
;; (add-hook 'shell-mode-hook #'my-shell-mode-hooks)
;; (add-hook 'eshell-mode-hook #'my-eshell-mode-hooks)
;; (add-hook 'text-mode-hook #'my-text-mode-hooks)
;; (add-hook 'markdown-mode-hook #'my-markdown-mode-hooks)
;; (add-hook 'LaTex-mode-hook #'my-latex-mode-hook)
;; (add-hook 'latex-mode-hook #'my-latex-mode-hook)
;; (add-hook 'lisp-mode-hook #'my-lisp-mode-hook)
;; (add-hook 'emacs-lisp-mode-hook #'my-emacs-lisp-mode-hook)
(provide 'mymodehooks.el)
;;; mymodehooks.el ends here
