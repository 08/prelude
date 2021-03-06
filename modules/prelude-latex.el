;;; prelude-latex.el --- Emacs Prelude: Sane setup for LaTeX writers.
;;
;; Copyright (c) 2011-2012 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://batsov.com/emacs-prelude
;; Version: 1.0.0
;; Keywords: convenience
;; Package-Requires: ((auctex "11.86"))

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Nice defaults for the premium LaTeX editing mode auctex.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; AUCTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

;; use pdflatex
(setq TeX-PDF-mode t)

(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")
        (output-html "HTML Viewer")))

;; this section is good for OS X only
;; TODO add sensible defaults for Linux/Windows
(setq TeX-view-program-list
      '(("DVI Viewer" "open %o")
        ("PDF Viewer" "open %o")
        ("HTML Viewer" "open %o")))

(defun prelude-latex-mode-defaults ()
  (turn-on-auto-fill)
  (abbrev-mode +1))

(setq prelude-latex-mode-hook 'prelude-latex-mode-defaults)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (run-hooks 'prelude-latex-mode-hook)))

(provide 'prelude-latex)

;;; prelude-latex.el ends here
