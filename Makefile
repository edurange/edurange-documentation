
all: EDURange_Student_Manual.pdf EDURange_Instructor_Manual.pdf

SCENARIOS = ssh_inception strace total_recon getting_started treasure_hunt elf_infection scapy_hunt recon

STUDENT_SCENARIO_FILES = $(foreach scenario, $(SCENARIOS), scenarios/$(scenario).md)

INSTRUCTOR_SCENARIO_FILES = $(filter $(wildcard scenarios/*.md), $(foreach scenario, $(SCENARIOS), scenarios/$(scenario).md scenarios/$(scenario)_solution.md ))

PANDOC = pandoc --table-of-contents \
  --variable documentclass=report

clean:
	rm --force EDURange_Student_Manual.* EDURange_Instructor_Manual.*

EDURange_Student_Manual.%: student_manual_meta.md introduction.md using_edurange_for_students.md scenarios.md $(STUDENT_SCENARIO_FILES)
	 $(PANDOC) $^ -o $@
	
EDURange_Instructor_Manual.%: instructor_manual_meta.md introduction.md using_edurange_for_instructors.md scenarios.md $(INSTRUCTOR_SCENARIO_FILES)
	$(PANDOC) $^ -o $@

scenarios/getting_started.md: scenarios/getting_started/*
