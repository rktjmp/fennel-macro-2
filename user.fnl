;; user code, has put library code in :lib

(local {: view} (require :fennel))
(import-macros {: complicate} :lib.complicate)
(import-macros {: inc} :lib.inc)

(complicate my-var :this-is-complicated)
(print :user-complicated-var (view [my-var-complicated]))
(print :user-call-inc (view [(inc 1)]))
