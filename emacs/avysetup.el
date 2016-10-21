;;; package --- Summary
;;; commentary:
;;; Code:

(use-package avy
:init (setq avy-keys '(?j ?h ?k ?l ?f ?g ?d ?s ?u ?r ?n ?v ?i ?e ?o ?w))
:config (progn
          (define-key evil-normal-state-map (kbd "f") 'avy-goto-char)
          (define-key evil-normal-state-map (kbd "C-f") 'avy-goto-char-2)
        )
)

(provide 'avysetup.el)
;;; avysetup.el ends here
