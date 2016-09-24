;; Problem 12
;; Highly divisible triangle numbers

;; implementation

;; VERSION 1

;; very slow bruteforce:

;; (use srfi-1)

;; (define triangle-with-divisors
;;   (lambda (max)
;;     (define divisors
;;       (lambda (n)
;;         (filter
;;          (lambda (x) (= 0 (modulo n x)))
;;          (iota n 1))))
;;     (let loop ((i 1))
;;       (define triangle (/ (* (+ 1 i) i) 2))
;;       (display i)
;;       (newline)
;;       (if (> (length (divisors triangle)) max)
;;           i
;;           (loop (+ 1 i))))))

;; VERSION 2

;; an independent fold-left implementation
(define (foldl func accum lst)
  (if (null? lst)
      accum
            (foldl func (func accum (car lst)) (cdr lst))))

;; decompose our number into primes:
;; 4200 -> (2 2 2 3 5 5 7)
;;
;; a useful way to wrap your head around it:
;;
;; (reduce * 0 (2 2 2 3 5 5 7)) -> 4200
(define decompose
  (lambda (n)
    (let *decompose ((divisor 2)
                     (number n))
      (if (> (* divisor divisor) number)
          (list number)
          (if (= 0 (modulo number divisor))
              (cons divisor (*decompose divisor (quotient number divisor)))
              (*decompose (+ divisor 1) number))))))

;; turn our number into a upf signature,
;; making use of the decompose function:
;;
;; 4200 -> ((2 . 3) (3 . 1) (5 . 2) (7 . 1))
(define unique-prime-factor-signature
  (lambda (n)
    (define divisors (decompose n))
    (define grow
      (lambda (divisor pow acc)
        (cons (cons divisor pow) acc)))
    (let tau* ((divisor (car divisors))
               (pow 1)
               (divisors (cdr divisors))
               (acc '()))
      (cond ((null? divisors) (reverse (grow divisor pow acc)))
            ((= divisor (car divisors)) (tau* divisor (+ 1 pow) (cdr divisors) acc))
            (else (tau* (car divisors) 1 (cdr divisors) (grow divisor pow acc)))))))

;; the tau function gives us the number
;; of divisors a number has (and makes use of
;; the prime-factorization-signature function:
;;
;; 4200 -> 48
(define tau
  (lambda (n)
    (foldl (lambda (acc pair)
             (define e (cdr pair))
             (* (+ 1 e) acc))
           1
           (unique-prime-factor-signature n))))

;; increment i by 1 until (tau (triange i))
;; it more than the cap as defined in the
;; project euler problem (which in this case is
;; 500). It works for any cap, though!
(define triangle-with-divisors
  (lambda (cap)
    (define triangle
      (lambda (n)
        (quotient (* (+ 1 n) n) 2)))
    (let loop ((i 1))
      (if (> (tau (triangle i)) cap)
          (triangle i)
          (loop (+ 1 i))))))

;; execution
(display (triangle-with-divisors 500)) ;; 76576500

;; UPDATE #1:
;;
;; This solution was really fun to pin
;; down. From yuridichesky's yar-project-euler
;; solution I found out about the tau function
;; and implemented my own solution.
;;
;; The decompose function is refactored from
;; Rosetta code, and the unique-prime-factor-
;; signature function is from yuridichesky's
;; solution.
;;
;; I wish I had enoguh knowledge of number
;; theory to figure this one out on my own.
;; To that end, though, this problem was
;; really inspirational to me as a programmer.
;;
;; I'm curious how others located and implemented
;; the tau function. Also I'm unsure how the tau
;; function (https://en.wikipedia.org/wiki/Ramanu
;; jan_tau_function) related to "the divisor
;; function." They seem to both relate to divisors
;; but I'm not exactly sure how.
