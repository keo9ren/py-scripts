;;; package --- Summary
;;; commentary:
;;; Code:
(add-hook 'prog-mode-hook (lambda ()
                            (set-fill-column 80)
                            (turn-on-auto-fill)))
(add-hook 'text-mode-hook (lambda ()
                            (set-fill-column 80)
                            (turn-on-auto-fill)))
(provide 'fillcolumnsetup.el)
;;; fillcolumnsetup.el ends here
