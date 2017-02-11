;;; package --- Summary
;;; commentary:
;;; Code:
(defun my-inferior-octave-mode-hooks() 
  "MY-Inferior-OCTAVE-MODE-HOOKS."
  (turn-on-font-lock) 
  (define-key inferior-octave-mode-map [up] 'comint-previous-input) 
  (define-key inferior-octave-mode-map [down] 'comint-next-input))
(defun my-octave-mode-hooks() 
  "MY-OCTAVE-MODE-HOOKS."
  (abbrev-mode 1) 
  (if (eq window-system 'x) 
      (font-lock-mode 1))) 
(defun my-python-mode-hooks() 
  "MY-PYTHON-MODE-HOOKS."
  (require 'sphinx-doc) 
  (sphinx-doc-mode t) 
  (require 'py-isort) 
  (add-hook 'before-save-hook 'py-isort-before-save) 
  )
(defun my-eshell-mode-hooks () 
  "My-eshell-mode-hooks."
  (define-key eshell-mode-map (kbd "C-c C-h")  'helm-eshell-history) 
  (define-key minibuffer-local-map (kbd "C-c C-m")  'helm-minibuffer-history) ; list actions using C-z
  (define-key shell-mode-map (kbd "C-c C-r")  'helm-comint-input-ring) ; list actions using C-z
  )
(defun my-markdown-mode-hooks() 
  "MY-MARKDOWN-MODE-HOOKS."
  (setq-local company-backends '((company-ispell company-files company-dabbrev))) 
  (when buffer-file-name (add-hook 'after-save-hook 'check-parens nil t))
                                        ; Use only if your files usually are balanced w/r/t double-quotes
                                        ; <http://stackoverflow.com/questions/9527593/>
  (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table))
(provide 'mymodehooks.el)
;;; mymodehooks.el ends here
