let%expect_test "hello" =
  print_s Myotherlib.hello_world;
  [%expect {| "Hello, World!" |}]
;;
