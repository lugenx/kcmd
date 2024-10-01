(defun c::sfile ()
  (setq file-substr (getstring "\nEnter file substring: "))
  (setq documents (vla-get-documents (vlax-get-acad-object)))
  (setq matching-files '())

  ;; Collect matching open files
  (vlax-for doc documents
    (if (wcmatch (strcase (vla-get-name doc)) (strcat "*" (strcase file-substr) "*"))
      (setq matching-files (cons (vla-get-name doc) matching-files))
    )
  )
  (setq matching-files (reverse matching-files))  ;; Maintain order

  ;; Handle based on number of matches
  (cond
    ((= (length matching-files) 0)
     (princ "\nNo matching file found.")
    )
    ((= (length matching-files) 1)
     (setq file-found (car matching-files))
     (vla-activate (vla-item documents file-found))
     (princ (strcat "\nSwitched to file: " file-found "."))
    )
    (t
     (setq file-confirmed nil)
     (setq current-index 0)
     (setq total-count (length matching-files))
     (while (not file-confirmed)
       (setq file (nth current-index matching-files))
       (setq response (getstring (strcat "\nFound file (" (itoa (1+ current-index)) "/" (itoa total-count) "): " file ". Press Enter to switch or 'n' for next: ")))
       (cond
         ((= response "")  ; Enter key pressed
          (vla-activate (vla-item documents file))
          (princ (strcat "\nSwitched to file: " file "."))
          (setq file-confirmed t)
         )
         ((= (strcase response) "N")
          (setq current-index (rem (1+ current-index) total-count))
         )
       )
     )
    )
  )
  (princ)
)
