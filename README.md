<div align="center">
    <pre>
    ██████╗  █████╗  ██████╗ ███████╗██╗     
    ██╔══██╗██╔══██╗██╔════╝ ██╔════╝██║     
    ██████╔╝███████║██║  ███╗█████╗  ██║     
    ██╔══██╗██╔══██║██║   ██║██╔══╝  ██║     
    ██████╔╝██║  ██║╚██████╔╝███████╗███████╗
    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
    ︵‿︵‿୨♡୧‿︵‿︵
    yummy re-stylized Ocaml
  </pre>

  [![Bagel: 0.1.0](https://img.shields.io/badge/Bagel-0.1.0-51355a?style=for-the-badge)](https://github.com/ImSumire/BagelLang)
  [![License: GNU](https://img.shields.io/badge/License-GNU-ffd166?style=for-the-badge)](https://www.gnu.org/)
  [![Ocaml: 4.14.1](https://img.shields.io/badge/Ocaml-4.14.1-de7c5a?style=for-the-badge)](https://ocaml.org/)

</div>

## Introduction
**Bagel** is a modern, re-stylized version of OCaml designed to blend the powerful functional programming features of OCaml with a more familiar, C++-like syntax. It aims to provide developers with the expressive type system and pattern matching capabilities of OCaml while offering a more accessible and intuitive syntax for those familiar with mainstream imperative languages.

## Key Features
- **C++-like Syntax**: Bagel retains OCaml's core functional programming concepts but presents them in a syntax that is closer to C++, making it easier for developers from imperative language backgrounds to adopt.
- **Fast & Intuitive Command Line Interface**: Bagel's Command Line Interface has been designed to simplify project compilation, debugging and deployment.
- **Type Inference**: While Bagel supports explicit type annotations, it also features strong type inference, reducing the need for verbose type declarations like in Ocaml.
- **Rust-like Modern features**: Bagel includes Rust's type scopes, error management and loops.

## Overview
```cpp
/* Variables */
int x = 42;  // Explicitly typed
auto y = 3.14;  // Implicity typed

string* hello = &"Hello, World";  // Equivalent of Ocaml's references

(int -> int) inc = (int x) { return x + 1; };  // Anonymous function


/* Functions */
// Using the recursive decorator to scope correctly the function
@recursive
int factorial(int n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}


/* Classes & Modules */
// Creating a class with 3 scope types, initialization and invoke method
class pattern_matcher<Input, Param, Output> (
    (Input, (Param -> Ouput))[] cases;
    (Param -> Ouput) default_action;
) {
    Hashtbl.t<Input, Param -> Output> matcher.create(List.length(cases));

    unit init() {
        List.iter(
            fun (Input pattern, (Param -> Ouput) action) ->
                Hashtbl.add(matcher, pattern, action),
            cases
        )
    }

    Ouput invoke(Param param, Input input) {
        try {
            local auto action = Hashtbl.find(matcher, input);
            return action(param);
        } with Not_found {
            return default_action(param);
        }
    }
}

// Simple arithmetic module with the complexe struct type
module Arithmetic {
  struct complexe {
    float real, imag
  }

  complex add(complex c1, complex c2) {
    return {
      c1.real +. c2.real,
      c1.imag +. c2.imag
    };
  }
}
```
