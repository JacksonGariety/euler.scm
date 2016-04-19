(defun proper-divisors-recursive (product &optional (results '(1)))
  "(int,list)->list::Function to find all proper divisors of a +ve integer."

  (defun smallest-divisor (x)
    "int->int::Find the smallest divisor of an integer > 1."
    (if (evenp x) 2
        (do ((lim (truncate (sqrt x)))
             (sd 3 (+ sd 2)))
            ((or (integerp (/ x sd)) (> sd lim)) (if (> sd lim) x sd)))))

  (defun pd-rec (fac)
    "(int,int)->nil::Recursive function to find proper divisors of a +ve integer"
    (when (not (member fac results))
      (push fac results)
      (let ((hifac (/ fac (smallest-divisor fac))))
        (pd-rec hifac)
        (pd-rec (/ product hifac)))))

  (pd-rec product)
  (butlast (sort (copy-list results) #'<)))

(print (proper-divisors-recursive 28))
