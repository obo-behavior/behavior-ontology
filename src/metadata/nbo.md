---
layout: ontology_detail
id: nbo
title: Neuro Behavior Ontology
jobs:
  - id: https://travis-ci.org/obo-behavior/behavior-ontology
    type: travis-ci
build:
  checkout: git clone https://github.com/obo-behavior/behavior-ontology
  system: git
  path: "."
contact:
  email: lxs511@bham.ac.uk
  label: Luke Slater
description: An ontology of human and animal behaviours and behavioural phenotypes.
domain: behavior
homepage: https://github.com/obo-behavior/behavior-ontology
products:
  - id: nbo.owl
dependencies:
 - id: pato
tracker: https://github.com/obo-behavior/behavior-ontology/issues
license:
  url: http://creativecommons.org/licenses/by/3.0/
  label: CC-BY
---
