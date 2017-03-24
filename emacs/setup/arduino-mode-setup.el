;;; package --- Summary
;;; commentary:
;;; Code:

(use-package 
  arduino-mode
  :init (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode)
                                    auto-mode-alist)) 
  (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t))

(provide 'arduino-mode-setup.el)
;;; arduino-mode-setup.el ends here
