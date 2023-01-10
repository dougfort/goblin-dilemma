#lang racket

;; 

(require crypto)
(require crypto/libcrypto)

(module+ test
  (require rackunit))

(provide encrypt-choice decrypt-choice)

(crypto-factories (list libcrypto-factory))

;; encrypt the choice
;; return (key iv ciphertext) 
(define (encrypt-choice plaintext)
  (define key (generate-cipher-key '(aes ctr)))
  (define iv (generate-cipher-iv '(aes ctr)))
  (define ciphertext (encrypt '(aes ctr) key iv plaintext))
  (list key iv ciphertext))

;; decrypt the choice
;; accept (key iv ciphertext)
;; return plaintext
(define (decrypt-choice args)
  (define key (first args))
  (define iv (second args))
  (define ciphertext (third args))
  (bytes->string/utf-8 (decrypt '(aes ctr) key iv ciphertext)))

(module+ test
  (check-equal? "defect" (decrypt-choice (encrypt-choice "defect")))) 