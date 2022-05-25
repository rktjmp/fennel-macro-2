(local relrequire ((fn [ddd]
                     (fn [modname]
                       (require (.. (or (string.match ddd "(.+%.)rsym") "") modname))))
                   ...))

(local {: bkwd} (relrequire :seq))

(fn rsym [...]
  "generates a list of strings from a given list of symbols, in reverse"
  (let [syms [...]
        rsyms (icollect [v (bkwd syms)] (tostring v))]
    rsyms))

{: rsym}
