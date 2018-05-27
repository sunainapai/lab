all:
	for f in [0-9][0-9][0-9].tex; do make "$$f"; done

*.tex: FORCE
	pdflatex $@
	pdflatex $@

publish: all
	./publish

clean:
	rm *.aux *.out *.log

FORCE:
