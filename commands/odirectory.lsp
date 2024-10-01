(defun c::odirectory ()
  (startapp
    (strcat "explorer.exe /select," (getvar "DWGPREFIX") (getvar "DWGNAME"))
  )
  (princ)
)

