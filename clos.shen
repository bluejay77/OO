\*

AJY 2018-05-19---2018-06-03

The Common LISP CLOS functionality brought to Shen

Import the functionality of the Common LISP functionality to Shen

Use the Shen/LISP interface: the form

(lisp. "(PRINT 'ZORQ)")

executes the S-exp (PRINT 'ZORQ) with the underlying Common LISP.

Here:

* All Common LISP reserved words are transmutated into the upper case
  in order for them to be recognized as LISP words.  Exemplaris
  gratis, the LISP keyword package names such as :accessor are
  converted into the upper case, id est ":ACCESSOR".

See and examine the attached file clos-example.lisp.

Every individual form in the clos-example.lisp file have been
converted into the Shen LISP interface in this file, with the
(lisp. "S-EXP") Shen form.

Do:

(load "clos.shen")

(demo1)
(demo2)


*\

\*

;;; AJY 2018-06-02
;;;
;;; From Winston-Horn, LISP, 3rd edition
;;; The CLOS example from Ch 14, Classes and Generic Functions,
;;; pages 183--205
;;; Below examples come from Pages 187--195.
;;; These ones have been constructed with the Shen CLOS, for a demo,
;;; and an example of the usage of the Shen CLOS interface.

*\


(lisp. "(DEFCLASS article ()
	  ((title :ACCESSOR article-title :INITARG :TITLE)
	   (author :ACCESSOR article-author :INITARG :AUTHOR))))")

(lisp. "(DEFCLASS computer-article (article) ())")

(lisp. "(DEFCLASS business-article (article) ())")

(lisp. "(DEFCLASS political-article (article) ())")

(lisp. "(DEFCLASS music-article (article) ())")

(lisp. "(DEFCLASS friend ()
	  ((name :ACCESSOR friend-name :INITARG :NAME)))")

(lisp. "(DEFCLASS hacker-friend (friend) ())")

(lisp. "(DEFCLASS entrepreneur-friend (friend) ())")

(lisp. "(DEFCLASS philosopher-friend (friend) ())")

(lisp. "(SETF articles
            (LIST (MAKE-INSTANCE 'business-article
			         :TITLE '(MEMORY PRICES DOWN))
	          (MAKE-INSTANCE 'computer-article
			         :TITLE '(MEMORY SPEEDS UP))
	          (MAKE-INSTANCE 'political-article
			         :TITLE '(MEMORY IMPUGNED))
	          (MAKE-INSTANCE 'music-article
			         :TITLE '(BEETHOVEN REVISITED))))")

(lisp. "(SETF friends
           (LIST (MAKE-INSTANCE 'hacker-friend :NAME 'Dan)
	         (MAKE-INSTANCE 'hacker-friend :NAME 'Gerry)
	         (MAKE-INSTANCE 'entrepreneur-friend :NAME 'Philip)
	         (MAKE-INSTANCE 'philosopher-friend :NAME 'David)))")

(lisp. "(DEFUN print-notification (article friend)
            (PRINT (LIST 'TELL 
                         (friend-name friend)
                         'ABOUT
                         (article-title article)))
            T)")

(lisp. "(DEFUN demo1 ()
            (DOLIST (friend friends)
                (DOLIST (article articles)
                    (print-notification article friend))))")

(lisp. "(DEFUN demo2 ()
           (DOLIST (friend friends)
               (DOLIST (article articles)
                   (process friend article))))")

(lisp. "(DEFMETHOD process ((friend hacker-friend)
		           (article computer-article))
         (print-notification article friend))")


(lisp. "(DEFMETHOD process ((friend entrepreneur-friend)
		            (article business-article))
          (print-notification article friend))")


(lisp. "(DEFMETHOD process ((friend philosopher-friend)
		            (article article))
           (print-notification article friend))")

(lisp. "(DEFMETHOD process ((friend philosopher-friend)
		            (article computer-article)))")

(lisp. "(DEFMETHOD process ((friend friend)
	 	            (article article)))")


(lisp. "(DEFMETHOD process ((friend friend)
		            (article music-article))
          (print-notification article friend))")


