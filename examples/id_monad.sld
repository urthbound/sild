(define unit
 (lambda (x)
  (cons x '(hello_monads))))

(define bind
 (lambda (f Mx)
   (f (car Mx))))

(define push_a (lambda (x) (unit (cons 'a x))))
(define push_b (lambda (x) (unit (cons 'b x))))
(define push_c (lambda (x) (unit (cons 'c x))))
(define pop    (lambda (x) (unit (cdr x))))

(define compose (lambda (g f)
  (lambda (m) (bind f (bind g m)))))

(define y '(a b c))
(define My (unit y ))

; left identity
(display (bind pop My))
(display (pop y))

; right identity
(display (bind unit My))
(display My)

; associativity
(display (bind push_c ((compose push_a pop) My)))
(display ((compose pop push_c) (bind push_a My)))