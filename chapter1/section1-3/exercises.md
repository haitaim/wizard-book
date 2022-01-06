# 1.3 Formulating Abstractions with Higher-Order Procedures

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

