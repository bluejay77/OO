;;; AJY 2018-06-02
;;;
;;; From Winston-Horn, LISP, 3rd edition
;;; The CLOS example from Ch 14, Classes and Generic Functions,
;;; pages 183--205, ISBN 0-201-08319-1.
;;; Below examples come from Pages 187--195.
;;; These ones have been reconstructed with the Shen CLOS, for a demo,
;;; and an example of the usage of the Shen CLOS interface.
;;; The Shen CLOS example is in the file clos.shen.

(defclass article ()
  ((title :accessor article-title :initarg :title)
   (author :accessor article-author :initarg :author)))

(defclass computer-article (article) ())

(defclass business-article (article) ())

(defclass political-article (article) ())

(defclass music-article (article) ())

(defclass friend ()
  ((name :accessor friend-name :initarg :name)))

(defclass hacker-friend (friend) ())

(defclass entrepreneur-friend (friend) ())

(defclass philosopher-friend (friend) ())

(setf articles
      (list (make-instance 'business-article
			   :title "Memory Prices Down")
	    (make-instance 'computer-article
			   :title "Memory Speeds Up")
	    (make-instance 'political-article
			   :title "Memory Impugned")
	    (make-instance 'music-article
			   :title "Beethoven Revisited")))


(setf friends
      (list (make-instance 'hacker-friend :name 'Dan)
	    (make-instance 'hacker-friend :name 'Gerry)
	    (make-instance 'entrepreneur-friend :name 'Philip)
	    (make-instance 'philosopher-friend :name 'David)))

(defun print-notification (article friend)
  (format t "~%Tell ~a about \"~a.\""
	  (friend-name friend)
	  (article-title article))
  t)

(defun demo1 ()
  (dolist (friend friends)
    (dolist (article articles)
      (print-notification article friend))))


(defun demo2 ()
  (dolist (friend friends)
    (dolist (article articles)
      (process friend article))))

(defmethod process ((friend hacker-friend)
		    (article computer-article))
  (print-notification article friend))


(defmethod process ((friend entrepreneur-friend)
		    (article business-article))
  (print-notification article friend))


(defmethod process ((friend philosopher-friend)
		    (article article))
  (print-notification article friend))

(defmethod process ((friend philosopher-friend)
		    (article computer-article)))

(defmethod process ((friend friend)
		    (article article)))


(defmethod process ((friend friend)
		    (article music-article))
  (print-notification article friend))

