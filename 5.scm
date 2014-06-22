;; Smallest multiple
;;
;; Problem 5
;;
;; 2520 is the smallest number that can
;; be divided by each of the numbers
;; from 1 to 10 without any remainder.
;;
;; What is the smallest positive number
;; that is evenly divisible by all of
;; the numbers from 1 to 20?

;; ;; original implementation
;; (define (smallest-multiple max)
;;   (define (divisible? n)
;;     (let loop ((i 1))
;;       (define result (zero? (remainder n i)))
;;       (if (and (< i max)
;;                result)
;;           (loop (+ i 1))
;;           result)))
;;   (let loop ((i 1))
;;     (if (divisible? i)
;;         i
;;         (loop (+ i 1)))))

;; This solution works, but it is terribly
;; inefficient, and becomes exponentially
;; moreso as you increase the number of
;; multiples it needs to check.
;;
;; It can do up to 15 fairly quickly, but I
;; haven't taken the time to see how long a 
;; max of 20 would take.

;; Below, I try again after reading a bit about
;; lowest common multiples in computer science.
;; I had to look up the mathematics here, and,
;; in that sense, I failed.

(define (smallest-multiple max)
  (let loop ((i 2) (result 1))
    (if (< i max)
        (loop (+ i 1) (lcm result i))
        result)))

;; execution
(display (smallest-multiple 20))
(exit)

;; This soluton is quite elegant indeed. It
;; cheats by using Chicken's math goodies,
;; but it's not wrong for this problem, since
;; lcm is older than Lisp.
;;
;; Also note that I'm starting at 2, because
;; 1 will also leave a zero remainder. This
;; is called "safely cutting corners."
