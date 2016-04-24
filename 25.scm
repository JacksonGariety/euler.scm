;; 1000-digit Fibonacci number
;; Problem 25
;;
;; Fibonacci!
;; The 12th term, F12, is the first term
;; to contain three digits.
;;
;; What is the index of the first term in
;; the Fibonacci sequence to contain 1000
;; digits?

(define (n-digit-fibonacci n)
  (define cap (expt 10 (- n 1)))
  (define (fibonacci a b i)
    (if (< b cap)
        (fibonacci b (+ a b) (+ i 1))
        i))
  (fibonacci 0 1 1))

(display (n-digit-fibonacci 9))
