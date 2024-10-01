(defun c::nav ()
  (textscr)  ; Open the text screen and keep it open
  (setq *home-dir* (getenv "USERPROFILE"))  ; Set the home directory to the user's home directory
  (setq *current-dir* (if (getvar "DWGNAME")
                          (getvar "DWGPREFIX")
                          *home-dir*))  ; Set initial directory to the current CAD file location or home directory
  (princ (strcat "\nInitial directory: " *current-dir*))
  (while t
    (setq input (getstring "\nEnter command (cd, .., ls, openfile, opendir, exit): " T))
    (setq input-list (vl-string->list input " "))
    (setq command (car input-list))
    ;; Properly join the remaining elements as the argument
    (setq arg (apply 'strcat (mapcar (function (lambda (x) (strcat x " "))) (cdr input-list))))
    (setq arg (vl-string-trim " " arg))
    ;; Debug print statements
    (cond
      ((equal command "cd")
        ;; Trim leading and trailing spaces from the argument
        (setq arg (vl-string-trim " " arg))
        ;; Check if the input is an absolute path
        (if (vl-string-search ":\\" arg)
          (setq full-path arg)
          ;; If not an absolute path, treat it as a relative path
          (setq full-path (vl-filename-makepath *current-dir* arg))
        )
        ;; Handle the ~ as home directory
        (if (equal arg "~")
          (setq full-path *home-dir*)
        )

        (if (vl-directory-files full-path nil -1)
          (progn
            (setq *current-dir* full-path)
            (princ (strcat "\nCurrent directory: " *current-dir*))
          )
          (princ "\nInvalid directory")
        )
      )
      ((equal command "..")
        (setq parent-dir (vl-filename-directory *current-dir*))
        (if (and parent-dir (not (equal parent-dir "")))
          (progn
            (setq *current-dir* parent-dir)
            (princ (strcat "\nCurrent directory: " *current-dir*))
          )
          (princ "\nAlready at the root directory")
        )
      )
      ((equal command "ls")
        (if *current-dir*
          (progn
            (foreach item (vl-directory-files *current-dir* nil 0)
              (princ (strcat "\n" item))
            )
          )
          (princ "\nNo directory set")
        )
      )
      ((equal command "openfile")
        (setq full-path (vl-filename-makepath *current-dir* arg))
        (if (findfile full-path)
          (command "_.OPEN" full-path)
          (princ "\nFile not found in current directory")
        )
      )
      ((equal command "opendir")
        (startapp "explorer" *current-dir*)
      )
      ((equal command "exit")
        (princ "\nExiting navigation mode.")
        (exit)
      )
      (t (princ "\nInvalid command"))
    )
    (princ)
  )
)

(defun vl-filename-makepath (path filename)
  (if (or (= (substr path (strlen path)) "\\")
          (= (substr path (strlen path)) "/"))
      (strcat path filename)
      (strcat path "\\" filename))
)

(defun vl-string->list (str delim)
  (if (not (vl-string-search delim str))
    (list str)
    (cons (substr str 1 (vl-string-search delim str))
          (vl-string->list (substr str (+ (vl-string-search delim str) 2)) delim))
  )
)

(defun vl-string-trim (chars str)
  (vl-string-right-trim chars (vl-string-left-trim chars str))
)

(setq *home-dir* (getenv "USERPROFILE"))  ; Set the home directory to the user's home directory
(setq *current-dir* (if (getvar "DWGNAME")
                        (getvar "DWGPREFIX")
                        *home-dir*))  ; Set initial directory to the current CAD file location or home directory
(princ (strcat "\nInitial directory: " *current-dir*))
