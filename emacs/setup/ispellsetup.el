;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package ispell
  :config (progn
            (setq ispell-program-name "hunspell")
            (setq ispell-local-dictionary "en_US"))
)

(provide 'ispellsetup.el)
;;; ispellsetup.el ends here
