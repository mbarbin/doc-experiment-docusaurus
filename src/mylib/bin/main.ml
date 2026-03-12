let version =
  match Build_info.V1.version () with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v [@coverage off]
;;

let () = Cmdlang_cmdliner_err_runner.run Mylib.main ~name:"mybin" ~version
