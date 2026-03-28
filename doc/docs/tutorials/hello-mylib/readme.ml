(* @mdexp

   # Hello Mylib

   Here we're making use of [mdexp](https://github.com/mbarbin/mdexp) to keep
   the doc up to date. The code blocks below are extracted from an OCaml test
   file and their output is verified on every build. *)

let eval_toplevel code =
  let code = String.trim code in
  Printf.printf "# %s\n" code;
  let cmd = "./mylib_toplevel.exe -noprompt -no-version" in
  let ic, oc, ec = Unix.open_process_full cmd [||] in
  output_string oc code;
  output_char oc '\n';
  close_out oc;
  let stdout_content = In_channel.input_all ic in
  let stderr_content = In_channel.input_all ec in
  let status = Unix.close_process_full (ic, oc, ec) in
  let stdout_trimmed = String.trim stdout_content in
  if String.length stdout_trimmed > 0 then print_endline stdout_trimmed;
  let stderr_trimmed = String.trim stderr_content in
  if String.length stderr_trimmed > 0 then print_endline stderr_trimmed [@coverage off];
  match status with
  | WEXITED 0 -> ()
  | _ ->
    (match[@coverage off] status with
     | WEXITED n -> Printf.printf "[%d]\n" n
     | WSIGNALED n -> Printf.printf "[signal %d]\n" n
     | WSTOPPED n -> Printf.printf "[stopped %d]\n" n)
;;

let mybin args =
  let cmd = String.concat " " ("mybin" :: args) in
  Printf.printf "$ %s\n" cmd;
  let ic = Unix.open_process_in cmd in
  print_string (In_channel.input_all ic);
  ignore (Unix.close_process_in ic)
;;

(* @mdexp

   ## Using libraries

   We can make use of code defined in libraries in expect tests. *)

let%expect_test "using libraries" =
  (* @mdexp.code *)
  print_endline Mylib.hello_world;
  [%expect {| Hello, World! |}];
  (* @mdexp.end *)
  ()
;;

(* @mdexp

   ## Using Libraries in Toplevels

   We can make use of code defined in libraries. *)

let%expect_test "using libraries" =
  eval_toplevel {| print_endline Mylib.hello_world ;; |};
  (* @mdexp.snapshot { lang: "ocaml" } *)
  [%expect
    {|
    # print_endline Mylib.hello_world ;;
    Hello, World!
    - : unit = ()
    |}]
;;

(* @mdexp

   ## Using Executables in Cram Style

   We can make use of executables defined in packages. *)

let%expect_test "using executables" =
  mybin [ "print" ];
  (* @mdexp.snapshot { lang: "bash" } *)
  [%expect
    {|
    $ mybin print
    Hello, World!
    |}]
;;
