;; Largest palindrome product
;; Problem 4
;;
;; A palindromic number reads the same both ways.
;; The largest palindrome made from the product of
;; two 2-digit numbers is 9009 = 91 × 99.
;;
;; Find the largest palindrome made from the
;; product of two 3-digit numbers.

(define (largest-palindrome-product min max)
  (define (palindrome? n)
    (define string-list (string->list (number->string n)))
    (equal? string-list (reverse string-list)))
  (let loop ((i max) (sum (* max 2)))
    (let ((j (- sum i)))
      (cond ((< i j) (loop max (- sum 1)))
            ((palindrome? (* i j)) (values (* i j) i j))
            (else (loop (- i 1) sum))))))

(display (largest-palindrome-product 100 999))
(exit)

;; Most important note on efficiency here is that
;; the loop begins by multiplying the two largest
;; numbers possible: (* 999 999). If we start from
;; the top, we can say the first palindrome we
;; encounter will be the largest;
;;
;; The worst part of this implementation is the use
;; of (strig->list) and (number->string). Slow,
;; and somewhat cheating the euler problem. Though
;; it does work efficiently.
;;
;; SOLUTION: 906609
