#lang racket

;; 

(require goblins)
(require goblins/actor-lib/bootstrap)
(require goblins/actor-lib/methods)

(provide make-player player-vat player-ref)

(struct player (vat ref)
  #:transparent)

(define (^player bcom my-name)
  (methods
   ;; return our name
   [(name) my-name]

   ;; "cooperate" or "defect" with the named player
   [(choose their-name)
    "defect"]))

(define (make-player name)
  (define p-vat (make-vat))
  (define p-ref (p-vat 'spawn ^player name))
  (player p-vat p-ref))

