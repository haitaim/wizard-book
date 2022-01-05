Exercise 1:
`10` -> 10

`(+ 5 3 4)` -> 12

`(- 9 1)` -> 8

`(/ 6 2)` -> 3

`(+ (* 2 4) (- 4 6))` -> 6

`(define a 3)` ->

`(define b (+ a 1))` ->

`(+ a b (* a b))` -> 19

`(= a b)` -> #f

```
(if (and (> b a) (< b (* a b)))
    b
    a)
```

-> 4

```
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
```

-> 16

`(+ 2 (if (> b a) b a))` -> 6

```
(* (cond ((> a b) a)
         ((< a b) b)
         (else - 1))
   (+ a 1))
```

-> 16

Exercise 2:

```
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 3)))))
   (* 3 (- 6 2) (-2 7)))
```

Exercise 3: In seperate file

Exercise 4:
The compound expression operator will return a primitive procedure depending on
the result of the if expression. If b > 0, then the expression will evaluate to
the addition procedure. Otherwise, the expression will evaluate to the
subtraction procedure.

Exercise 5:
In applicative-order evaluation, the interpreter will crash. The interpreter
will first call p before expanding test. p is a procedure whose definition is to
call itself. This leads to infinite recursion, which is the root of why the
program crashed.

In normal-order evaluation, the interpreter will return 0. The interpreter will
expand test first, which avoids evaluating p. x is 0, so the if expression will
return 0.

Exercise 6:
If expressions will only evaluate the expression selected by the predicate,
whereas new-if will evaluate both. Because the else clause uses recursion,
the new-if version will preform infinite recursion and eventually crash.

Exercise 7:
For smaller numbers, good-enough? does not have a provide a very high amount of
precision to pass. For example, (sqrt 9) should result in 3, but will instead
evaluate to 3.00009155413138. When dealing with large numbers, the lack of
precision means that finding the difference of two numbers becomes unfeasible
for small amounts.

The new version of good-enough? is in exercise1-7.rkt.

The new method was more accurate for smaller numbers, but actually worse for
large numbers.

Exercise 8: In seperate file

Exercise 9:
First procedure

```
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```

Second procedure

```
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```

The first is recursive. The second is iterative.

Exercise 10:
`(A 1 10)` -> 1024
`(A 2 4)` -> 65536
`(A 3 3)` -> 65536

f(n) = 2n
g(n) = 2^n
Work:
if n = 1

```
(A 1 1)
2
```

if n = 2

```
(A 1 2)
(A 0 (A 1 1))
(A 0 2)
4
```

if n = 3

```
(A 1 3)
(A 0 (A 1 2))
(A 0 (A 0 (A 1 1)))
(A 0 (A 0 2))
(A 0 4)
8
```

h(n) = 2          if n = 1
       2^h(n - 1) if n > 1

Some initial values of evaluation
h(1) = 2
h(2) = 2^2
h(3) = 2^2^2
etc...

Based on the above, we can remove the recursive definition Knuth up-arrow
notation.
h(n) = 2^^n

Wolfram refers to this as a power tower
Wikipedia refers to this as tetration

Work:
if n = 1

```
(A 2 1)
2
```

if n = 2

```
(A 2 2)
(A 1 (A 2 1))
(A 1 2)
4
```

if n = 3

```
(A 2 3)
(A 1 (A 2 2))
(A 1 4)
16
```

if n = 4

```
(A 2 4)
(A 1 (A 2 3))
(A 1 16)
65536
```

Exercise 11: On seperate file

Exercise 12: On seperate file

Exercise 13...: To be done at later time

