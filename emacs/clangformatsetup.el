;;; package --- Summary
;;; commentary:
;;; Code:

(require 'package)


(use-package clang-format)
(defcustom clang-format-on-save
  t
  "My clang-format-on-save."
  :group 'myinit
  :type 'booleanp
  :safe #'booleanp)
(defun clang-format-before-save ()
  "Add this to .emacs to clang-format on save(add-hook 'before-save-hook 'clang-format-before-save)."
       (interactive)(when (eq major-mode '(c-mode c++-mode)) (clang-format-buffer)))
(when (eq t clang-format-on-save) (add-hook 'before-save-hook  'clang-format-before-save) )

(provide 'clangformatsetup.el)
;;; clangformatsetup.el ends here
