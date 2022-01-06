# 1.2 Procedures and the Processes They Generate

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

h(n) = 2 if n = 1, 2^h(n - 1) if n > 1

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

