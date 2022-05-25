(import-macros {: complicate} (.. (or (string.match ... "(.+%.)vendor%-code") "") "complicate"))

(complicate my-val :a-value)
; (print my-val-complicated)

{}
