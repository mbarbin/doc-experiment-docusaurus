let%expect_test "hello" =
  print_endline Myotherlib.hello_world;
  [%expect {| Hello, World From My Other Lib! |}]
;;
