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
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log")) 
  (setq flycheck-check-syntax-automatically '(save mode-enabled)) 
  (setq tide-format-options 
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t 
                                                                :placeOpenBraceOnNewLineForFunctions
                                                                nil)))
(use-package web-mode
  :ensure t
  :mode ("\\.phtml\\'"
         "\\.html?\\'"
         "\\.tpl\\.php\\'"
         "\\.[agj]sp\\'"
         "\\.as[cp]x\\'"
         "\\.djhtml\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         "\\.ts\\'"
         "\\.tsx\\'"
         "\\.js\\'"
         "\\.jsx\\'"
         "\\.json\\'"
         )
  :init (progn
          (add-hook 'web-mode-hook (lambda () (when (member (file-name-extension
  buffer-file-name) '("ts" "tsx" "js" "jsx"))
                                               (td)
                                               ))))
)
(provide 'webmodesetup.el)
;;; webmodesetup.el ends here
