;;; package-- - Summary
;;; commentary:
;;; Code:


(defun td () 
  (interactive) 
  (tide-mode 1) 
  (tide-restart-server) 
  (tide-hl-identifier-mode +1) 
  (setq company-tooltip-align-annotations t) 
  (add-hook 'before-save-hook 'tide-format-before-save) 
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log")) 
  (fci-mode) 
  (company-mode +1)
  (set-fill-column 80) 
  (flyspell-prog-mode) 
  (setq flycheck-check-syntax-automatically '(save mode-enabled)) 
  (setq tide-format-options 
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t 
                                                                :placeOpenBraceOnNewLineForFunctions
                                                                nil)))
(require 'use-package)
(use-package tide 
  :ensure t 
  :init (progn (add-hook 'typescript-mode-hook #'td)))
(provide 'typescriptsetup.el)
;;; typescriptsetup.el ends here
