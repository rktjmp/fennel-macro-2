(print (view [:compilcate-vargs ...]))

(fn complicate [x val]
  ;; accepts a symbol and creates a new local variable called sym-complicated
  ;; this macro demonstrates accepting a non-existant symbol at the call site
  `(local ,(sym (.. (tostring x) :-complicated)) ,val))

{: complicate}
