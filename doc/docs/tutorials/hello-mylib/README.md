# Hello Mylib

Here we're making use of [mdexp](https://github.com/mbarbin/mdexp) to keep
the doc up to date. The code blocks below are extracted from an OCaml test
file and their output is verified on every build.

## Using libraries

We can make use of code defined in libraries in expect tests.

```ocaml
print_endline Mylib.hello_world;
[%expect {| Hello, World! |}];
```

## Using Libraries in Toplevels

We can make use of code defined in libraries.

```ocaml
# print_endline Mylib.hello_world ;;
Hello, World!
- : unit = ()
```

## Using Executables in Cram Style

We can make use of executables defined in packages.

```bash
$ mybin print
Hello, World!
```
