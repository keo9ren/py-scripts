;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(defun td () 
  (interactive) 
  (tide-mode) 
  (tide-restart-server) 
  (tide-hl-identifier-mode +1) 
  (setq-local company-backends '((company-keywords company-tide))) 
  (setq company-tooltip-align-annotations t) 
  (add-hook 'before-save-hook 'tide-format-before-save) 
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file
/tmp/tss.log")) 
  (setq flycheck-check-syntax-automatically '(save mode-enabled)) 
  (setq tide-format-options
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t 
                                                                :placeOpenBraceOnNewLineForFunctions
                                                                nil)))
(use-package 
  company-web)
(use-package 
  web-mode 
  :ensure t 
  :mode ("\\.phtml\\'" "\\.html?\\'"
         ) 
  :init (progn (add-hook
                'web-mode-hook
                (lambda () 
                  (or
                   (when (member (file-name-extension buffer-file-name) 
                                 '("ts" "tsx" "js" "jsx")) 
                     (td))
                   (when (member (file-name-extension buffer-file-name) 
                                 '("html" "phtml" "djhtml"))
                     (setq-local company-backends '((company-keywords company-web-html)))))))))
(provide 'webmodesetup.el)
;;; webmodesetup.el ends here
