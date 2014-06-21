;; Problem 1
;;
;; If we list all the natural numbers below 10 that are
;; multiples of 3 or 5, we get 3, 5, 6 and 9. The sum
;; of these multiples is 23. Find the sum of all the
;; multiples of 3 or 5 below 1000.

(define (sum-of-multiples-below n)
  (define sum 0)
  (let loop ()
    (set! n (- n 1))
    (if (> n 0)
        (begin (if (or (= (modulo n 3) 0) (= (modulo n 5) 0))
                   (set! sum (+ sum n)))
               (loop))
        sum)))

(display (sum-of-multiples-below 1000))
(exit)
