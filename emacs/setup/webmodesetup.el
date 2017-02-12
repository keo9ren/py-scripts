;;; package --- Summary
;;; commentary:
;;; Code:
(require 'use-package)

(use-package web-mode
  :ensure t
  :mode ("\\.phtml\\'"
         "\\.html?\\'"
         "\\.tpl\\.php\\'"
         "\\.[agj]sp\\'"
         "\\.as[cp]x\\'"
         "\\.djhtml\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         ;"\\.ts\\'"
         "\\.tsx\\'"
         "\\.js\\'"
         "\\.jsx\\'"
         "\\.json\\'"
         )
)
(provide 'webmodesetup.el)
;;; webmodesetup.el ends here
