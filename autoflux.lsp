(load "./commands/flayer.lsp")
(load "./commands/slayer.lsp")
(load "./commands/stab.lsp")
(load "./commands/sfile.lsp")
(load "./commands/odirectory.lsp")
(load "./commands/nav.lsp")

(defun c::autoflux ()
  (princ "\nAutoFlux loaded successfully. Use commands like :FLAYER, :SLAYER, :STAB, :SFILE, :ODIRECTORY, :NAV")
)

(princ "\nAutoFlux initialized. Use :AUTOFLUX to check status.")
