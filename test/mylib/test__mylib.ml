let%expect_test "hello" =
  print_endline Mylib.hello_world;
  [%expect {| Hello, World! |}]
;;
