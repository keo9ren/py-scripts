;;; package --- Summary
;;; commentary:
;;; Code:

(require 'package)
(use-package vimish-fold
  :init (progn (vimish-fold-global-mode 1)
               ;(global-set-key (kbd "<menu> v f") #'vimish-fold)
               ;(global-set-key (kbd "<menu> v v") #'vimish-fold-delete)
               )
  )


(provide 'vimishfoldsetup.el)
;;; vimishfoldsetup.el ends here
