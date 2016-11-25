;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(defun my-typescript-mode-hook ()
  "MY-typescript-MODE-HOOK."
  
  ;; (setq-local company-backends '((
  ;; company-tooltip-align-annotations t
  ;; company-dabbrev-code
  ;; company-files
  ;; company-oddmuse
  ;; company-capf
  ;; )))
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;(eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
  ;(fci-mode)
  ;(set-fill-column 80)
  ;(focus-mode t)
  ;(flyspell-prog-mode)
  ;(turn-on-auto-fill)
)

(use-package tide
             :ensure t
             :init (add-hook 'typescript-mode-hook #'my-typescript-mode-hook)
             :config (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

)

(provide 'typescriptsetup.el)
;;; typescriptsetup.el ends here
