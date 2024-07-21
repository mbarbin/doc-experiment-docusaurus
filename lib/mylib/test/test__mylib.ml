let%expect_test "hello" =
  print_s Mylib.hello_world;
  [%expect {| "Hello, World!" |}]
;;
