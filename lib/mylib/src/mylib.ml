let hello_world = "Hello, World!"

let print_cmd =
  Command.make
    ~summary:"print hello world"
    (let open Command.Std in
     let+ () = Arg.return () in
     print_endline hello_world)
;;

let main = Command.group ~summary:"" [ "print", print_cmd ]
