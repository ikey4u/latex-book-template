example: clean
	@mkdir -p latex-book-template && cp -a ../src latex-book-template
	@for i in 0 1 2; do xelatex main.tex; done
	@make clean

clean:
	@rm -rf latex-book-template main.aux main.log main.out main.toc
