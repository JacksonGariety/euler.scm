;; Problem 12
;; Highly divisible triangle numbers

;; implementation

(use srfi-1)

;; very slow bruteforce function
;; next step is implement the tau
;; function!
(define triangle-with-divisors
  (lambda (max)
    (define divisors
      (lambda (n)
        (filter
         (lambda (x) (= 0 (modulo n x)))
         (iota n 1))))
    (let loop ((i 1))
      (define triangle (/ (* (+ 1 i) i) 2))
      (display i)
      (newline)
      (if (> (length (divisors triangle)) max)
          i
          (loop (+ 1 i))))))

;; execution
(display (triangle-with-divisors 500))
