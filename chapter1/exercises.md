# Chapter 1 Exercises

Exercises from chapter one, Building Abstractions with Procedures.

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
will first call p before expanding test. p is a procedure whose definition is to
call itself. This leads to infinite recursion, which is the root of why the
program crashed.

In normal-order evaluation, the interpreter will return 0. The interpreter will
expand test first, which avoids evaluating p. x is 0, so the if expression will
return 0.

## Exercise 6

If expressions will only evaluate the expression selected by the predicate,
whereas new-if will evaluate both. Because the else clause uses recursion,
the new-if version will preform infinite recursion and eventually crash.

## Exercise 7

For smaller numbers, good-enough? does not have a provide a very high amount of
precision to pass. For example, (sqrt 9) should result in 3, but will instead
evaluate to 3.00009155413138. When dealing with large numbers, the lack of
precision means that finding the difference of two numbers becomes unfeasible
for small amounts.

The new version of good-enough? is in exercise1-7.scm.

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

## Exercise 9

First procedure:

```scheme
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

Second procedure:

```scheme
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```

The first is recursive. The second is iterative.

## Exercise 10

```scheme
(A 1 10)
; -> 1024

(A 2 4)
; -> 65536

(A 3 3)
; -> 65536
```

f(n) = 2n

g(n) = 2^n

#### Work:

```scheme
; If n = 1
(A 1 1)
2

; If n = 2
(A 1 2)
(A 0 (A 1 1))
(A 0 2)
4

; If n = 3
(A 1 3)
(A 0 (A 1 2))
(A 0 (A 0 (A 1 1)))
(A 0 (A 0 2))
(A 0 4)
8
```

h(n) =

{ 2 if n = 1

{ 2^h(n - 1) if n > 1

Some initial values of evaluation

h(1) = 2

h(2) = 2^2

h(3) = 2^2^2

etc...

Based on the above, we can remove the recursive definition with Knuth up-arrow
notation.

h(n) = 2^^n

Wolfram refers to this as a power tower.
Wikipedia refers to this as tetration.

#### Work:

```scheme
; If n = 1
(A 2 1)
2

; If n = 2
(A 2 2)
(A 1 (A 2 1))
(A 1 2)
4

; If n = 3
(A 2 3)
(A 1 (A 2 2))
(A 1 4)
16

; If n = 4
(A 2 4)
(A 1 (A 2 3))
(A 1 16)
65536
```

## Exercise 11

```scheme
; Recursive definition
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; To differentiate from the previous definition, the iterative version will be
; named g.
; a = n - 1
; b = n - 2
; c = n - 3
(define (g n)
  (define (g-iter a b c count)
    (if (= count n)
        a
        (g-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (+ count 1))))
  (if (< n 3)
      n
      (g-iter 2 1 0 2)))

```

## Exercise 12

```scheme
; The mathematical definition is from the Wikipedia article
(define (pascal n k)
  (cond ((= n k) 1)
        ((= k 0) 1)
        (else (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))

```

## Exercise 13...

To be done at later time

## Exercise 30

```scheme
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (+ a 1) (+ result (term a)))))
  (iter a 0))
```

## Exercise 31

Defining both the the recursive process and iterative process versions of the
product procedure is trivial; replace the addition operation with
multiplication, and any occurence of adding zero to the sum should be replaced
with mulplying by one, which refers to the base case for the recursive process
and the initial value of the result for the iterative process. 

To define `factorial` in terms of `product`:

```scheme
(define (inc n) (+ n 1))
(define (identity n) n)

(define (factorial n) (product identity 1 inc n))
```

The product in the textbook is the Wallis product if the index starts at 2
rather than 1.

```scheme
(define (f x) (/ (* 4 x x) (- (* 4 x x) 1)))

; We can start the index at 1 and multiply by 2 and still get pi
(define (wallis n) (* 4 (product f 2 inc n)))
```

## Exercise 32

```scheme
; Recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate (next a) next b))))

; Iterative process
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

```

