## Customize Makefile settings for nbo
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

reports/phenotypes.tsv: nbo.owl
	$(ROBOT) filter --input nbo.owl --term NBO:0000243 --select "self descendants annotations" --signature true \
		export --header "ID|LABEL|SubClass Of" --sort "LABEL|SubClass Of" --export $@

.PHONY: reports
reports:
	$(MAKE_FAST) reports/phenotypes.tsv
