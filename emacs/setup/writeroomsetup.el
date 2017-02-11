;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package writeroom
  :init (progn
          (add-hook 'emacs-lisp-mode-hook #'writeroom-mode)
          )
  )
(provide 'writeroomsetup.el)
;;; writeroomsetup.el ends here
