class ['input, 'param, 'output] pattern_match
  (cases : ('input * ('param -> 'output)) list)
  (default_action : 'param -> 'output) =

  object (self)
    val matcher : ('input, 'param -> 'output) Hashtbl.t = Hashtbl.create (List.length cases)

  initializer
    List.iter (
      fun (pattern, action) ->
        Hashtbl.add matcher pattern action)
      cases

  method invoke (param : 'param) (input : 'input) : 'output =
    try
      let action = Hashtbl.find matcher input in
      action param
    with Not_found ->
      default_action param
end

(* 
let matcher = new pattern_match
    [
      ("one", (fun _ -> 1));
      ("two", (fun _ -> 2));
      ("three", (fun _ -> 3));
    ]
    (fun _ -> 0)
*)
