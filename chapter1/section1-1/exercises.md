# 1.1 The Elements of Programming

## Exercise 1

```scheme
10
; -> 10

(+ 5 3 4)
; -> 12

(- 9 1)
; -> 8

(/ 6 2)
; -> 3

(+ (* 2 4) (- 4 6))
; -> 6

(define a 3)
; No output

(define b (+ a 1))
; No output

(+ a b (* a b))
; -> 19

(= a b)
; -> #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; -> 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; -> 16

(+ 2 (if (> b a) b a))
; -> 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else - 1))
   (+ a 1))
; -> 16
```

## Exercise 2

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 3)))))
   (* 3 (- 6 2) (-2 7)))
```

## Exercise 3

```scheme
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; f will be the name of the required function
(define (f x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

```

## Exercise 4

The compound expression operator will return a primitive procedure depending on
the result of the if expression. If b > 0, then the expression will evaluate to
the addition procedure. Otherwise, the expression will evaluate to the
subtraction procedure.

## Exercise 5

In applicative-order evaluation, the interpreter will crash. The interpreter
will first call `p` before expanding test. `p` is a procedure whose definition
is to call itself. This leads to infinite recursion, which is the root of why
the program crashed.

In normal-order evaluation, the interpreter will return 0. The interpreter will
expand test first, which avoids evaluating `p`. x is 0, so the if expression
will return 0.

## Exercise 6

If expressions will only evaluate the expression selected by the predicate,
whereas `new-if` will evaluate both. Because the else clause uses recursion,
the `new-if` version will preform infinite recursion and eventually crash.

## Exercise 7

For smaller numbers, `good-enough?` does not have a provide a very high amount
of precision to pass. For example, `(sqrt 9)` should result in 3, but will
instead evaluate to 3.00009155413138. When dealing with large numbers, the lack
of precision means that finding the difference of two numbers becomes unfeasible
for small amounts.

```scheme
(define (good-enough? guess old-guess)
  (> 0.001 (abs (/ (- old-guess guess) guess))))
```

The new method was more accurate for smaller numbers, but actually worse for
large numbers.

## Exercise 8

```scheme
(define (square x) (* x x))

(define (cbrt x)
  (define (good-enough? guess old-guess)
    (> 0.001 (abs (/ (- old-guess guess) guess))))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (cbrt-iter guess old-guess)
    (if (good-enough? guess old-guess)
        guess
        (cbrt-iter (improve guess) guess)))
  (cbrt-iter 1 x))
```

