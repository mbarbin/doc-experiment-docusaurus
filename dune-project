(lang dune 3.17)

(name doc-experiment-docusaurus)

(generate_opam_files)

(license MIT)

(authors "Mathieu Barbin")

(maintainers "Mathieu Barbin")

(source
 (github mbarbin/doc-experiment-docusaurus))

(documentation "https://mbarbin.github.io/doc-experiment-docusaurus/")

(using mdx 0.4)

(implicit_transitive_deps false)

(package
 (name mylib)
 (synopsis "A package named mylib in this project")
 (depends
  (ocaml
   (>= 5.2))
  (cmdlang
   (>= 0.0.9))
  (cmdlang-cmdliner-err-runner
   (>= 0.0.16))
  (dune-build-info
   (>= 3.17))
  (mdx
   (>= 2.4))
  (ppx_expect
   (and
    :with-test
    (>= v0.17)
    (< v0.18)))
  (sherlodoc
   (and
    :with-doc
    (>= 0.2)))))

(package
 (name myotherlib)
 (synopsis "Another package named myotherlib in this project")
 (depends
  (ocaml
   (>= 5.2))
  (cmdlang
   (>= 0.0.9))
  (cmdlang-cmdliner-err-runner
   (>= 0.0.16))
  (ppx_expect
   (and
    :with-test
    (>= v0.17)
    (< v0.18)))
  (sherlodoc
   (and
    :with-doc
    (>= 0.2)))))
