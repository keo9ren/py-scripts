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
  )
(defun my-markdown-mode-hooks() 
  "MY-MARKDOWN-MODE-HOOKS."
  (setq-local company-backends '((company-ispell company-files company-dabbrev))) 
  (when buffer-file-name (add-hook 'after-save-hook 'check-parens nil t))
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
  )
(provide 'mymodehooks.el)
;;; mymodehooks.el ends here
