# Hello Mylib

Here we're making use of features offered by ocaml-mdx, with which we can keep
the doc up to date.

## Using libraries

We can make use of code defined in libraries.

```ocaml
# print_endline Mylib.hello_world
Hello, World!
- : unit = ()
```

## Using executables

We can make use of executables defined in packages.

```bash
$ mybin print
Hello, World!
```
