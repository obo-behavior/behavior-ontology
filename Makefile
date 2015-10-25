OBO= http://purl.obolibrary.org/obo
SRC= nbo-edit.owl

seed.tsv: nbo-edit.owl
	owltools --no-debug $< --list-classes > $@

imports/%_import.owl: seed.tsv
	robot extract -I $(OBO)/$*.owl -T $< -o $@ -O $(OBO)/nbo/$@
