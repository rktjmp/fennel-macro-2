;; user code, they have put library code in :lib

(local {: view} (require :fennel))
; (import-macros {: complicate} :lib.complicate)
; (import-macros {: inc} :lib.inc)

;; This also does not work but perhaps `...` is not defined when it is the directly running file.
;; (import-macros {: complicate} (.. ... :.complicate))

(local mod (require :lib.vendor-code))

; (complicate my-var :this-is-complicated)
; (print :user-complicated-var (view [my-var-complicated]))
; (print :user-call-inc (view [(inc 1)]))
