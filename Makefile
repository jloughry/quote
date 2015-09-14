target = $(quote)

GCC_FLAGS = -Wall -Wextra

quote = quote

quote_source = $(quote).c
quote_header = $(quote).h
version = version.h

quote_sources = $(quote_source) $(quote_header) $(version) Makefile

exe_file = $(target).exe

.PHONY: clean

rm = rm -fv
edit = vi

all:: $(target)

$(quote): $(quote_sources)
	gcc $(GCC_FLAGS) -o $@ $<
	mv $(exe_file) $(target)

clean::
	$(rm) $(target) $(bibtex_file) typescript

commit::
	@echo "#define VERSION $$(($$(cut -d ' ' -f 3 $(version)) + 1))" > $(version)
	@echo "Version `cut -d ' ' -f 3 $(version)`"

test:
	echo abc | ./$(target) 

vi:
	$(edit) $(quote_source)

header:
	$(edit) $(quote_header)

include common.mk

