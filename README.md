# Usage

Creates the instructor and student manuals for EDURange.

Prerequisites
* `make` (which should be included in your OS)
* [`pandoc`](https://pandoc.org/)
* `pdflatex` (which can be found in your favorite latex distribution) 

To use, you can just run `make`.
This creates the two make targets
* `EDURange_Student_Manual.pdf`
* `EDURange_Instructor_Manual.pdf`

To clean up (i.e. delete `EDURange_Student_Manual.pdf`, `EDURange_Instructor_Manual.pdf`), run `make clean`

*Hidden Feature:* you can export to many different document formats. For example `make EDURange_Student_Manual.html`.

