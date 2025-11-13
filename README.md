# LNG Tapir

Tapir is a general-purpose parser generator that converts an annotated context-free grammar into a deterministic LR or generalized LR (GLR) parser employing LALR(1) parser tables. Once you are proficient with Tapir, you can use it to develop a wide range of language parsers, from those used in simple desk calculators to complex programming languages.

Tapir is upward compatible with Yacc (assuming all C is converted to TypeScript): all properly-converted Yacc grammars ought to work with Tapir. Anyone familiar with Yacc should be able to use Tapir with little trouble. You need to be fluent in TypeScript programming in order to use Tapir.
