;; Sum square difference
;; Problem 6
;;
;; The sum of the squares of the first ten natural numbers is,
;;
;; 1^2 + 2^2 + ... + 10^2 = 385
;; The square of the sum of the first ten natural numbers is,
;;
;; (1 + 2 + ... + 10)^2 = 552 = 3025
;; Hence the difference between the sum of the squares of the
;; first ten natural numbers and the square of the sum
;; is 3025 − 385 = 2640.
;;
;; Find the difference between the sum of the squares of
;; the first one hundred natural numbers and the square
;; of the sum.

(define (sum-square-difference n)
  (let loop ((i 0) (squares 0) (sums 0))
    (if (<= i n)
        (loop (+ i 1) (+ squares (* i i)) (+ sums i))
        (- (* sums sums) squares))))

(display (sum-square-difference 100))

;; SOLUTION: 25164150

;; This solution I discovered on acid. It took fifteen minutes.
;; The solution is perfectly elegant in my mind. The entire state
;; of the program is contained within the loop and I can visualize
;; the difference between the the squares and the sums in my head
;; simply by looking at the arguments to the loop, and then the
;; falsey part of the if statement.
;;
;; Now, I'm not sure if the problem was easy, or my solution is
;; imperfect. This is probably because of the acid. But it's
;; intriguing to me how easy it was to visualize the problem.
;;
;; ;-)
