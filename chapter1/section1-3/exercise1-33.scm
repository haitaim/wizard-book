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

