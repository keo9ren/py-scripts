;;; package --- Summary
;;; commentary:
;;; Code:

(use-package 
  indent-guide 
  :config (progn (indent-guide-global-mode) 
                 (set-face-background 'indent-guide-face "dimgray") 
                 (setq indent-guide-delay 4) 
                 (setq indent-guide-recursive t) 
                 (setq indent-guide-char "|")))
(provide 'indentguidesetup.el)
;;; indentguidesetup.el ends here
