There are in the Shen CLOS distribution two files: clos.shen and
clos-example.lisp.  (And this documentation file.)

This Shen/CLOS interface is not a Shen program.  It is a set of
procedures for the LISP implementations of Shen, in order to be able
to call and use the Common LISP Object System, the CLOS, of the
underlying Common LISP, from the Shen language.  This one has been
done with the Shen SBCL implementation.  Others may wish to port this
one for the CCL Shen or the ECL Shen.  And a Shen/Ruby implementation
would be doable; and a Shen/Java implementation.

This brings the full scale object oriented capability to Shen.  Shen
did not previously have a full-fledged object oriented system.

The user is recommended to delve into the comments in the source
files, and study how the SBCL CLOS is called from the Shen language.

