;;; python-executes-test.el --- executes test
;; Author: Andreas Roehler <andreas.roehler@online.de>
;; Keywords: languages, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defun py-execute-statement-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "print(\"I'm the py-execute-statement-test\")"))
    (py-bug-tests-intern 'py-execute-statement-base arg teststring)))

(defun py-execute-statement-base ()
  (assert (py-execute-statement) nil "py-execute-statement-test failed"))

(defun py-execute-block-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "if True: print(\"I'm the py-execute-block-test\")"))
    (py-bug-tests-intern 'py-execute-block-base arg teststring)))

(defun py-execute-block-base ()
  (assert (py-execute-block) nil "py-execute-block-test failed"))

(defun py-execute-block-or-clause-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "if True: print(\"I'm the py-execute-block-or-clause-test\")"))
    (py-bug-tests-intern 'py-execute-block-or-clause-base arg teststring)))

(defun py-execute-block-or-clause-base ()
  (assert (py-execute-block-or-clause) nil "py-execute-block-or-clause-test failed"))

(defun py-execute-def-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "def foo (): print(\"I'm the py-execute-def-test\")"))
    (py-bug-tests-intern 'py-execute-def-base arg teststring)))

(defun py-execute-def-base ()
  (assert (py-execute-def) nil "py-execute-def-test failed"))

(defun py-execute-class-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "class foo (): print(\"I'm the py-execute-class-test\")"))
    (py-bug-tests-intern 'py-execute-class-base arg teststring)))

(defun py-execute-class-base ()
  (assert (py-execute-class) nil "py-execute-class-test failed"))

(defun py-execute-region-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "print(\"I'm the py-execute-region-test\")"))
    (py-bug-tests-intern 'py-execute-region-base arg teststring)))

(defun py-execute-region-base ()
  (assert (eq nil (py-execute-region (line-beginning-position) (line-end-position))) nil "py-execute-region-test failed"))

(defun py-execute-buffer-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "print(\"I'm the py-execute-buffer-test\")"))
    (py-bug-tests-intern 'py-execute-buffer-test-base arg teststring)))

(defun py-execute-buffer-test-base ()
  (assert (py-execute-buffer) nil "py-execute-buffer-test failed"))

(defun py-execute-expression-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "print(\"I'm the py-execute-expression-test\")"))
    (py-bug-tests-intern 'py-execute-expression-base arg teststring)))

(defun py-execute-expression-base ()
  (assert (py-execute-expression) nil "py-execute-expression-test failed"))

(defun py-execute-line-test (&optional arg load-branch-function)
  (interactive "p")
  (let ((teststring "print(\"I'm the py-execute-line-test\")"))
    (py-bug-tests-intern 'py-execute-line-base arg teststring)))

(defun py-execute-line-base ()
  (assert (py-execute-line) nil "py-execute-line-test failed"))

(defun beginning-of-block-fails-from-wrong-indent-test (&optional arg)
  (interactive "p")
  (let ((teststring "#! /usr/bin/env python
# -*- coding: utf-8 -*-
with file(\"roulette-\" + zeit + \".csv\", 'w') as datei:
 for i in range(anzahl):
        klauf.pylauf()
            datei.write(str(spiel[i]) + \"\\n\")
"))
  (py-bug-tests-intern 'beginning-of-block-fails-from-wrong-indent-base arg teststring)))

(defun beginning-of-block-fails-from-wrong-indent-base ()
    (goto-char 102)
    (assert (eq 48 (py-beginning-of-block)) nil "beginning-of-block-fails-from-wrong-indent-test failed"))

(defun py-execute-file-test (&optional arg)
  (interactive "p")
   (let ((teststring "print(3)"))
  (py-bug-tests-intern 'py-execute-file-intern arg teststring)))

(defun py-execute-file-intern ()
  (let ((py-store-result-p t)
        (file (concat py-temp-directory "/py-execute-file-test.py")))
    (write-file file)
    ;; (sit-for 0.1)
    (unwind-protect
        (setq erg (py-execute-file file))
      (assert (string= "3" erg) nil "py-execute-file-test failed")
      (delete-file file))))

(provide 'python-executes-test)
;;; python-executes-test.el ends here
