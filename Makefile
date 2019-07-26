
default: EDURange_Student_Manual.pdf EDURange_Instructor_Manual.pdf

clean:
	rm --force EDURange_Student_Manual.* EDURange_Instructor_Manual.*

EDURange_Student_Manual.%: introduction.md using_edurange_for_students.md exercises.md exercises/*.md
	pandoc --table-of-contents $^ -o $@

EDURange_Instructor_Manual.%: introduction.md using_edurange_for_instructors.md exercises.md exercises/*.md
	pandoc --table-of-contents $^ -o $@

exercises/getting_started.md: exercises/getting_started/*

