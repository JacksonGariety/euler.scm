;; Special Pythagorean triplet
;; Problem 9
;;
;; A Pythagorean triplet is a set of three natural
;; numbers, a < b < c, for which,
;;
;; a^2 + b^2 = c^2
;; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;;
;; There exists exactly one Pythagorean triplet for
;; which a + b + c = 1000.
;; Find the product abc.

;; implementation
(define (pythagorean-triplet-product sum)
  (define half-square (/ (expt sum 2) 2))
  (let loop ((a (quotient sum 3)))
    (define b (/ (- half-square (* sum a)) (- sum a)))
    (if (inexact? b)
        (loop (- a 1))
        (let ((c (- sum b a)))
          (* b a c)))))

;; execution
(display (pythagorean-triplet-product 1000))

;; I love this solution. It does so much with so
;; little. The variable naming is great as well,
;; (a), (b) and (c) corrospond with pythagorean
;; theorum quite naturally (no pun intended).
;;
;; I did look up the math on this one. C solutions
;; to this problem were quite helpful. I understand
;; it, but that took a bit of reading about
;; half-squares in computer science. That's the real
;; magic here, and my goal is to be good enough at math
;; to know why it's useful without Googling.
;;
;; The if-statement at the end is nice too. If a isn't
;; an integer, we loop again incrementing a. If it is,
;; we calculate c and return the product.
