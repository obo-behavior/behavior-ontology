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

MERGE_TEMPLATE_URL="https://docs.google.com/spreadsheets/d/e/2PACX-1vSscBNXMDeuEn0o_sWZqg9-ZGiEJ4jLFiAqyt7moDvfgh32GYMDmIBpdZFVGziC34w2z5xXwlaV-M-P/pub?gid=1120204179&single=true&output=tsv"
tmp/merge.tsv:
	wget $(MERGE_TEMPLATE_URL) -O $@

merge_template: tmp/merge.tsv
	$(ROBOT) --prefix "dcterms: http://purl.org/dc/terms/" template --merge-before --input $(SRC) \
 	--template $< --output $(SRC).ofn && mv $(SRC).ofn $(SRC)

tmp/remove.txt: tmp/merge.tsv
	cut -f1 $< > $@

rm_merge:
	$(MAKE) tmp/remove.txt
	$(ROBOT) filter -i $(SRC) -T tmp/remove.txt --select children --axioms subclass --trim false \
		filter -T tmp/remove.txt --trim false \
		convert -f ofn -o tmp/children.ofn
	$(ROBOT) remove -i $(SRC) -T tmp/remove.txt --preserve-structure false merge -i tmp/children.ofn --collapse-import-closure false convert -f ofn -o tmp/src.ofn
	mv tmp/src.ofn  $(SRC)

template_merge_pipeline:
	git checkout master -- nbo-edit.owl 
	$(MAKE) rm_merge -B
	$(MAKE) merge_template -B
