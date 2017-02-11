;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)
(use-package flyspell 
  :init (progn (add-hook 'prog-mode-hook
                         #'flyspell-prog-mode) 
               (add-hook 'text-mode-hook #'flyspell-mode)))

(provide 'flyspellsetup.el)
;;; flyspellsetup.el ends here
