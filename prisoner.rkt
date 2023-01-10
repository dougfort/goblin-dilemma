#lang racket

;; 

(require goblins)
(require goblins/actor-lib/bootstrap)
(require goblins/actor-lib/methods)

(provide make-prisoner prisoner-vat prisoner-ref)

(struct prisoner (vat ref)
  #:transparent)

(define (^prisoner bcom my-name)
  (methods
   [(name) my-name]))

(define (make-prisoner name)
  (define p-vat (make-vat))
  (define p-ref (p-vat 'spawn ^prisoner name))
  (prisoner p-vat p-ref))

