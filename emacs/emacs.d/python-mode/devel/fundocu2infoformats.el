(defcustom py-devel-directory-out ""
  "Output directory when developing Python-mode. "
  :type 'string
  :group 'python-mode)

(defcustom py-devel-directory-in ""
  "Input directory when developing Python-mode. "
  :type 'string
  :group 'python-mode)

(defun python-components-mode-list-actives (&optional directory)
  "Return a list, which components will be loaded. "
  (interactive)
  (let ((directory (or directory default-directory))
        componentslist)
    (find-file (concat directory "python-components-mode.el"))
    (save-restriction
      (widen)
      (goto-char (point-min))
      (while (re-search-forward "^[ \t]*(require '\\([^)]+\\))" nil (quote move) 1)
        (when (save-match-data
                (string-match "python-components" (match-string-no-properties 0)))
          (add-to-list 'componentslist (prin1-to-string (match-string-no-properties 1)))))
      (dolist (ele componentslist)
        (find-file (concat directory ele)
                   (finds (concat ele ".el")))))))

(defun finds-from-programm ()
  (let ((directory-in (or (and (not (string= "" py-devel-directory-in)) py-devel-directory-in) default-directory))
        (directory-out (or (and (not (string= "" py-devel-directory-out)) py-devel-directory-out default-directory)) (concat default-directory "doc"))
        (erg (buffer-file-name))
        (buffer (current-buffer)))
    (message "Lade %s" erg)
    (find-file erg)
    (finds buffer directory-in directory-out)))

(defvar python-mode-el-doku-list (list "autopair/autopair.el" "python-mode.el" "completion/auto-complete-pycomplete.el" "completion/company-pycomplete.el" "completion/pycomplete.el" "pymacs.el" "extensions/py-smart-operator.el"))

(defun finds-alle ()
  "Write doku for files listet in python-mode-el-doku-list. "
  (interactive)
  (dolist (ele python-mode-el-doku-list)
    (when
        (and (load (concat "~/arbeit/emacs/python-modes/python-mode/" ele))
             (find-file (concat "~/arbeit/emacs/python-modes/python-mode/" ele)))
      (finds))))

(defun finds (&optional buffer directory-in directory-out)
  "Writes all commands in BUFFER alongside with their documentation into directory \"doc\" as \*.org and \*rst file ."
  (interactive)
  (let* ((oldbuf (buffer-name (or buffer (current-buffer))))
         ;; (file (buffer-file-name))
         (orgname (concat (substring oldbuf 0 (string-match "\\." oldbuf)) ".org"))
         (reSTname (concat (substring oldbuf 0 (string-match "\\." oldbuf)) ".rst"))
         (directory-in (or directory-in (and (not (string= "" py-devel-directory-in)) py-devel-directory-in) default-directory))
         (directory-out (or directory-out (expand-file-name finds-directory-out))))
    (finds-base oldbuf orgname reSTname directory-in directory-out)))

(defun finds-base (oldbuf orgname reSTname directory-in directory-out)
  (save-restriction
    (let ((suffix (file-name-nondirectory (buffer-file-name)))
          commandslist)
      ;; (widen)
      (goto-char (point-min))
      ;; (eval-buffer)
      (while (and (not (eobp))(re-search-forward "^(defun [[:alpha:]]\\|^;;; .+" nil t 1))
        (if (save-match-data (commandp (symbol-at-point)))
            (let* ((name (symbol-at-point))
                   (docu (documentation name)))
              (unless docu (message "don't see docu string for %s" (prin1-to-string name)))
              (add-to-list 'commandslist (cons (prin1-to-string name) docu))
              (forward-line 1)
              ;; (message "%s" (car commandslist))
              ;; (end-of-defun)
              )
          (add-to-list 'commandslist (list (match-string-no-properties 0)))))
      (setq commandslist (nreverse commandslist))
      (with-temp-buffer
        (switch-to-buffer (current-buffer))
        (insert (concat ";; a list of " suffix " commands
\(setq " (replace-regexp-in-string "\\." "-" suffix) "-commands (quote "))
        (insert (prin1-to-string commandslist))
        (insert "))")
        (eval-buffer))
      (with-temp-buffer
        ;; org
        ;; (insert (concat (capitalize (substring oldbuf 0 (string-match "\." oldbuf))) " commands" "\n\n"))
        (insert (concat suffix " commands\n\n"))
        (dolist (ele commandslist)
          (if (string-match "^;;; " (car ele))
              (unless (or (string-match "^;;; Constants\\|^;;; Commentary\\|^;;; Code\\|^;;; Macro definitions\\|^;;; Customization" (car ele)))

                (insert (concat (replace-regexp-in-string "^;;; " "* " (car ele)) "\n")))
            (insert (concat "** "(car ele) "\n"))
            (insert (concat "   " (cdr ele) "\n\n"))))
        (write-file (concat directory-out "commands-" orgname))
        (find-file (concat directory-out "commands-" orgname)))
      (with-temp-buffer
        ;; reST
        (insert "Python-mode commands\n\n")
        ;; (insert (concat (make-string (length (concat (substring oldbuf 0 (string-match "\." oldbuf)) " commands")) ?\=) "\n\n"))
        (insert "====================\n\n")
        (dolist (ele commandslist)
          (insert (concat (car ele) "\n"))
          (insert (concat (make-string (length (car ele)) ?\-) "\n"))
          (insert (concat (cdr ele) "\n\n")))
        (write-file (concat directory-out "commands-" reSTname))
        (find-file (concat directory-out "commands-" reSTname))))))

(defun write-defcustom-docus (&optional buffer directory-in directory-out)
  "Writes all customizable variables w/ documentation into directory \"doc\" as \*.org and \*rst file ."
  (interactive)
  (let* ((oldbuf (buffer-name (or buffer (current-buffer))))
         ;; (file (buffer-file-name))
         (orgname (concat (substring oldbuf 0 (string-match "\\." oldbuf)) ".org"))
         (reSTname (concat (substring oldbuf 0 (string-match "\\." oldbuf)) ".rst"))
         (directory-in (or directory-in (and (not (string= "" py-devel-directory-in)) py-devel-directory-in) default-directory))
         (directory-out (or directory-out (expand-file-name finds-directory-out))))
    (defcustom-docu-base oldbuf orgname reSTname directory-in directory-out)))

(defun defcustom-docu-base (oldbuf orgname reSTname directory-in directory-out)
  (save-restriction
    (let ((suffix (file-name-nondirectory (buffer-file-name)))
          varslist last)
      (goto-char (point-min))
      (while (and (not (eobp))(re-search-forward "^(defcustom [[:alpha:]]" nil t 1))
        (if (save-match-data (boundp (symbol-at-point)))
            (let* ((name (variable-at-point))
                   (docu
                    (or (documentation-property
                         name 'variable-documentation)
                        (documentation-property
                         alias 'variable-documentation))))
              (unless docu (message "don't see docu string for %s" (prin1-to-string name)))
              (add-to-list 'varslist (cons (prin1-to-string name) docu))
              (forward-line 1))
          (add-to-list 'varslist (list (match-string-no-properties 0)))))
      (setq varslist (nreverse varslist))
      (with-temp-buffer
        ;; (switch-to-buffer (current-buffer))
        (insert (concat suffix " variables\n\n"))
        (dolist (ele varslist)
          (insert (concat "** "(car ele) "\n"))
          (insert (concat "   " (cdr ele) "\n\n"))
          (setq last (point)))
        (goto-char last)
        (push-mark)
        ;; (delete-region (point) (goto-char (point-max)))
        (delete-region (point)(point-max))
        (org-mode)
        (push-mark)
        (goto-char (point-min))
        (indent-region (point-min) (point-max) )
        (write-file (concat directory-out "variables-" orgname))
        (find-file (concat directory-out "variables-" orgname)))
      (with-temp-buffer
        ;; reST
        (insert "python-mode.el variables\n\n")
        ;; (insert (concat (make-string (length (concat (substring oldbuf 0 (string-match "\." oldbuf)) " commands")) ?\=) "\n\n"))
        (insert "====================\n\n")
        (dolist (ele varslist)
          (insert (concat (car ele) "\n"))
          (insert (concat (make-string (length (car ele)) ?\-) "\n"))
          (insert (concat (cdr ele) "\n\n")))
        (write-file (concat directory-out "variables-" reSTname))
        (find-file (concat directory-out "variables-" reSTname))
      ))))
