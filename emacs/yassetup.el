;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(require 'cl)
(use-package yasnippet
  :diminish yas-minor-mode
  :init (progn
    (defun check-expansion ()
    "My check-expansion."
        (save-excursion
        (if (looking-at "\\_>") t
            (backward-char 1)
            (if (looking-at "\\.") t
            (backward-char 1)
            (if (looking-at "->") t nil)))))
    (defun do-yas-expand ()
    "My do-yas-expand."
        (let ((yas-fallback-behavior 'return-nil))
        (yas-expand)))
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
    (defun expand-snippet-or-complete-selection ()
    "My expand-snippet-or-complete-selection."
    (interactive)
    (if (or (not yas-minor-mode)
        (null (do-yas-expand))
        (company-abort))
        (company-complete-selection)))
            )
  :bind (
         ([tab] . tab-indent-or-complete)
         ([(control return)] . company-complete-common)
         )
  :config (progn
           (yas-global-mode)
           (setq yas-snippet-dirs (append yas-snippet-dirs '("~/.tools/scripts-and-more/emacs/yasnippet/")))
           (yas-reload-all)
           (setq yas-indent-line (quote none))
           (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
           (define-key yas-minor-mode-map [tab] nil)
           (define-key yas-keymap [tab] 'tab-complete-or-next-field)
           (define-key yas-keymap [(control tab)] 'yas-next-field)
           (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
           )
)
(provide 'yassetup.el)
;;; yassetup.el ends here
