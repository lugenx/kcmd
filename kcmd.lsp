(defun c::kcmd ()

  ;;  (defun load-file (filename)

  ;;    (setq filepath (findfile filename))

  ;;    (if filepath

  ;;        (load filepath)

  ;;        (princ (strcat "\nError: " filename " not found."))

  ;;    )

  ;;  )

 

  ;;  (setq baseDir (getvar "DWGPREFIX"))

  ;;  (load-file (strcat baseDir "commands\\flayer.lsp"))

  ;;  (load-file (strcat baseDir "commands\\stab.lsp"))

  ;;  (load-file (strcat baseDir "commands\\sfile.lsp"))

  ;;  (load-file (strcat baseDir "commands\\odirectory.lsp"))

  ;;  (load-file (strcat baseDir "commands\\nav.lsp"))

 

  (princ

    "\nkcmd loaded successfully. Use commands like :FLAYER, :SLAYER, :STAB, :SFILE, :ODIRECTORY, :NAV"

  )

  (princ)

)
