;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package octave
:config (progn
(autoload 'octave-mode "octave-mode" nil t)
(setq auto-mode-alist
(cons '("\\.m$" . octave-mode) auto-mode-alist))
))

(provide 'octavesetup.el)
;;; octavesetup.el ends here
