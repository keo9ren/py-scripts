;;; package --- Summary
;;; commentary:
;;;
;;; Code:
(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "install")
(load-library "magitsetup")
(load-library "rtagssetup")
(load-library "helmsetup")
(load-library "companysetup")
(load-library "yassetup")
(load-library "clangformatsetup")
(defvar *spotifyenabled* nil)
(when *spotifyenabled*
  (load-library "spotifysetup"))
(defvar *sphinxenabled* nil)
(when *sphinxenabled*
  (load-library "sphinxsetup"))
(defvar *indentguideenabled* t)
(when *indentguideenabled*
  (load-library "indentguidesetup"))
(defvar *anzuenabled* t)
(when *anzuenabled*
  (load-library "anzusetup"))
(defvar *avyenabled* t)
(when *avyenabled*
  (load-library "avysetup"))
(defvar *flycheckenabled* t)
(when *flycheckenabled*
  (load-library "flychecksetup"))
(defvar *customvarenable* t)
(when *customvarenable*
  (load-library "customvarsetup"))
(defvar *mymodehooksenable* t)
(when *mymodehooksenable*
  (load-library "mymodehooks"))
(defvar *styleenable* t)
(when *styleenable* t
      (load-library "style"))
(defvar *reftexenable* t)
(when *reftexenable* t
      (load-library "reftexsetup"))
(defvar *zealenable* t)
(when *zealenable* t
      (load-library "zealsetup"))
(defvar *orgenable* t)
(when *orgenable* t
      (load-library "orgsetup"))
(defvar *gdbenable* t)
(when *gdbenable* t
      (load-library "gdbsetup"))
(defvar *octaveenable* t)
(when *octaveenable* t
      (load-library "octavesetup"))
(defvar *moderncppenable* t)
(when *moderncppenable* t
      (load-library "moderncppsetup"))
(defvar *texsiteenable* t)
(when *texsiteenable* t
      (load-library "texsitesetup"))
(defvar *markdownenable* t)
(when *markdownenable* t
      (load-library "markdownsetup"))
; should alway be the last
(load-library "evilsetup")
(provide '.emacs)
;;; .emacs ends here
