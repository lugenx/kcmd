(defun c::slayer ()
  (setq layer-substr (getstring "\nEnter layer substring: "))
  (setq layers (vla-get-layers (vla-get-activedocument (vlax-get-acad-object))))
  (setq matching-layers '())
  
  ;; Collect matching layers
  (vlax-for layer layers
    (if (wcmatch (strcase (vla-get-name layer)) (strcat "*" (strcase layer-substr) "*"))
      (setq matching-layers (cons (vla-get-name layer) matching-layers))
    )
  )
  (setq matching-layers (reverse matching-layers))  ;; Maintain order

  ;; Handle based on number of matches
  (cond
    ((= (length matching-layers) 0)
     (princ "\nNo matching layer found.")
    )
    ((= (length matching-layers) 1)
     (setq layer-found (car matching-layers))
     (if (= (vla-get-Freeze (vla-item layers layer-found)) :vlax-true)
       (princ (strcat "\nCouldn't switch, layer " layer-found " is frozen."))
       (if (= (vla-get-LayerOn (vla-item layers layer-found)) :vlax-false)
         (progn
           (setvar "CLAYER" layer-found)
           (princ (strcat "\nLayer switched, but layer " layer-found " is turned off."))
         )
         (progn
           (setvar "CLAYER" layer-found)
           (princ (strcat "\nLayer switched to " layer-found "."))
         )
       )
     )
    )
    (t
     (setq layer-confirmed nil)
     (setq current-index 0)
     (setq total-count (length matching-layers))
     (while (not layer-confirmed)
       (setq layer (nth current-index matching-layers))
       (setq response (getstring (strcat "\nFound layer (" (itoa (1+ current-index)) "/" (itoa total-count) "): " layer ". Press Enter to switch or 'n' for next: ")))
       (cond
         ((= response "")  ; Enter key pressed
          (if (= (vla-get-Freeze (vla-item layers layer)) :vlax-true)
            (princ (strcat "\nCouldn't switch, layer " layer " is frozen."))
            (if (= (vla-get-LayerOn (vla-item layers layer)) :vlax-false)
              (progn
                (setvar "CLAYER" layer)
                (princ (strcat "\nLayer switched, but layer " layer " is turned off."))
              )
              (progn
                (setvar "CLAYER" layer)
                (princ (strcat "\nLayer switched to " layer "."))
              )
            )
          )
          (setq layer-confirmed t)
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
