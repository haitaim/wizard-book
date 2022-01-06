# 1.3 Formulating Abstractions with Higher-Order Procedures

## Exercise 30

```scheme
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
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

The Wallis product defined in the textbook is correct, but not very convenient
to convert into a function. Instead, the Wikipedia article provides the same
thing in Pi notation with the only difference being that it returns pi/2
instead.

```scheme
(define (wallis n)
  (define (f x) (/ (* 4 x x)
                   (- (* 4 x x) 1)))
  (* 2 (product f 1 inc n)))
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
## Exercise 33

The procedures for parts a and b are called f and g, respectively.

```scheme
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) (combiner null-value result)))))
  (iter a null-value))

; Sum of squares of prime numbers
(define (inc i) (+ i 1))
(define (square x) (* x x))
(define (f a b) (filtered-accumulate + 0 square a inc b prime?))

; Product of positive integers less than n relatively prime to n
; gcd is already defined by Scheme
; Otherwise, we can use the definition from the previous section
(define (g i n)
  (define (relatively-prime? i n) (= (gcd i n) 1))
  (define (filter i) (relatively-prime? i n))
  (filtered-accumulate * 1 gcd i inc (- n 1) filter))
```

