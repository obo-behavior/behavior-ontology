OBO= http://purl.obolibrary.org/obo
SRC= nbo-edit.owl

seed.tsv: nbo-edit.owl
	owltools --no-debug $< --list-classes > $@.tmp && perl -npe 's@<(.*)>@$$1@' $@.tmp > $@

imports/%_import.owl: seed.tsv mirror/%.owl
	robot extract --method BOT -i mirror/$*.owl -T $< -o $@ -O $(OBO)/nbo/$@

mirror/%.owl:
	wget --no-check-certificate $(OBO)/$*.owl -O $@
