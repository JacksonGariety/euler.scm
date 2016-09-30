;; Problem 21
;; Amicable Numbers
;;
;; Let d(n) be defined as the sum of proper divisors
;; of n (numbers less than n which divide evenly into n).
;; If d(a) = b and d(b) = a, where a ≠ b, then a and b
;; are an amicable pair and each of a and b are called
;; amicable numbers.
;;
;; For example, the proper divisors of 220 are
;; 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
;; therefore d(220) = 284. The proper divisors of 284 are
;; 1, 2, 4, 71 and 142;
;; so d(284) = 220.
;;
;; Evaluate the sum of all the amicable numbers under 10000.

(import (scheme base)
        (scheme write)
        (scheme inexact)
        (srfi 1))

(define (divisor-sum n)
  (let loop ((i (- n 1)))
    (cond
     ((<= i 1) 1)
     ((= (remainder n i) 0)
      (+ i (loop (- i 1))))
     (else (loop (- i 1))))))

(define (amicable? a sums)
  (define range (length sums))
  (and (<= (- a 1) range)
       (let ((da (list-ref sums (- a 1))))
         (and (<= da range)
              (= a (list-ref sums (- da 1)))
              (not (= a da))))))

(define (amicable-numbers-below cap)
  (let loop ((n 1)
             (sums '()))
    (if (<= n cap)
        (loop (+ 1 n)
              (append sums (list (divisor-sum n))))
        (let loop* ((n 1)
                    (sum 0))
          (if (<= n cap)
              (loop* (+ 1 n)
                     (if (amicable? n sums)
                         (+ sum n)
                         sum))
              sum)))))

(display (amicable-numbers-below 10000))
