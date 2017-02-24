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
  (setq flycheck-check-syntax-automatically '(save mode-enabled)) 
  (setq tide-format-options 
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t 
                                                                :placeOpenBraceOnNewLineForFunctions
                                                                nil)))
(require 'use-package)
(use-package tide 
  :ensure t 
  :init (progn (add-hook 'typescript-mode-hook (lambda ()
                                                 (tide-mode)
                                                 (tide-hl-identifier-mode +1)
                                                 (setq-local company-backends '((company-keywords company-tide)))
                                                 (setq-local company-tooltip-align-annotations)
                                                 (add-hook 'before-save-hook 'tide-format-before-save) 
                                                 (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log")) 
                                                 (setq flycheck-check-syntax-automatically '(save mode-enabled)) 
                                                 ))))
(provide 'typescriptsetup.el)
;;; typescriptsetup.el ends here
