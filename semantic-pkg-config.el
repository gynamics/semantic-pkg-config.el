;;; semantic-pkg-config.el --- Add semantic system include conveniently with pkg-config -*- lexical-binding: t -*-

;; Author: gynamics
;; Maintainer: gynamics
;; Package-Version: 0.1
;; Package-Requires: ((emacs "24.1") (flycheck-pkg-config "0.3"))
;; URL: https://github.com/gynamics/semantic-pkg-config.el
;; Keywords: tools


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; inspired by flycheck-pkg-config

;;; Code:
(require 'flycheck-pkg-config)
(autoload 'semantic-add-system-include "semantic/dep")

;;;###autoload
(defun semantic-pkg-config (lib)
  "Add include paths need by LIB to semantic."
  (interactive
   (progn
     ;; Find out all the libraries installed on this system.
     (unless flycheck-pkg-config--libs
       (flycheck-pkg-config--set-libs))
     (list (completing-read "Library name: " flycheck-pkg-config--libs))))

  (let (;; Find the include paths, e.g. "-I/usr/lib/foo"
        (include-paths (flycheck-pkg-config--include-paths lib)))
    ;; Add include paths unless already present.
    (mapc #'semantic-add-system-include include-paths)
    (if flycheck-mode
        ;; Finally, do the same thing with flycheck-pkg-config
        (flycheck-pkg-config lib))))


(provide 'semantic-pkg-config)

;;; semantic-pkg-config.el ends here
