(defun c::stab ()
  (setq tab-substr (getstring "\nEnter tab substring: "))
  (setq layouts (vla-get-layouts (vla-get-activedocument (vlax-get-acad-object))))
  (setq matching-tabs '())
  
  ;; Collect matching tabs
  (vlax-for layout layouts
    (if (wcmatch (strcase (vla-get-name layout)) (strcat "*" (strcase tab-substr) "*"))
      (setq matching-tabs (cons (vla-get-name layout) matching-tabs))
    )
  )
  (setq matching-tabs (reverse matching-tabs))  ;; Maintain order

  ;; Handle based on number of matches
  (cond
    ((= (length matching-tabs) 0)
     (princ "\nNo matching tab found.")
    )
    ((= (length matching-tabs) 1)
     (setq tab-found (car matching-tabs))
     (vla-put-activelayout (vla-get-activedocument (vlax-get-acad-object)) (vla-item layouts tab-found))
     (princ (strcat "\nSwitched to tab: " tab-found "."))
    )
    (t
     (setq tab-confirmed nil)
     (setq current-index 0)
     (setq total-count (length matching-tabs))
     (while (not tab-confirmed)
       (setq tab (nth current-index matching-tabs))
       (setq response (getstring (strcat "\nFound tab (" (itoa (1+ current-index)) "/" (itoa total-count) "): " tab ". Press Enter to switch or 'n' for next: ")))
       (cond
         ((= response "")  ; Enter key pressed
          (vla-put-activelayout (vla-get-activedocument (vlax-get-acad-object)) (vla-item layouts tab))
          (princ (strcat "\nSwitched to tab: " tab "."))
          (setq tab-confirmed t)
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
