{
  "published": "2025-03-30"
}
# BR# DevLog 0: Announcing BaguetteSharp... Oxidised
## BaguetteWhat? {#what}
Baguette# or BaguetteSharp or Baguette, is my [joke programming language](https://esolangs.org/wiki/Baguette) I made for the kicks, for the joke, for my TIPE, everything.

I liked it but the [OCaml](https://ocaml.org) code is *horrible*. The Lexer and
Parser are easy enough to understand, but the code of the [interpreter](https://github.com/vanilla-extracts/ocaml-baguettesharp-interpreter/blob/master/src/interpreter.ml#L39) is absolutely unreadable.

There is many reasons of *why* this code is so unreadable. First, I coded this
interpreter under *IV morphine* at the *hospital*. Which is not a very good
moment to code something. Like not at all. Second, I was pretty new at the whole
interpreting stuff.

## Rust Edition {#rust}
Yes oxidised like rust like Rust as in the language I know I'm really funny.

It's not just a stylistic project as well, it's important to properly implement
LLVM to make a functional compiler from a *strong* codebase instead of bodged
one.

It will also allow me to make a LSP implementation.

## Where can we follow {#follow}
There is three git repos:
- The [main repo](https://git.charlotte-thomas.me/vanilla-extracts/baguette_sharp_oxidised) in my own forge
- The [codeberg nightly mirror](https://codeberg.org/vanilla-extracts/baguette_sharp_oxidised)
- The [GitHub stable mirror](https://github.com/vanilla-extracts/baguette_sharp_oxidised)

## Closing words {#words}
See you next DevLog entry :)
