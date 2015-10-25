These notes are for the EDITORS of nbo

## Editors Version

Do you have an ID range in the idranges file (nbo-idranges.owl),
in this directory). If not, get one from the head curator. 

The editors version is nbo-edit.obo

** DO NOT EDIT nbo.obo OR nbo.owl **

## ID Ranges

These are stored in the file

  nbo-idranges.owl

** ONLY USE IDs WITHIN YOUR RANGE!! **

## Setting ID ranges in OBO-Edit

 In the Metadata menu, select the ID manager option. You can set the ID range of any 
 profile you create here by clicking on the settings icon (cog wheels) next to the profile 
 name. In the window that appears, you can set the ID range by editing the default rule: 
 "ID:$sequence(<number of digits>,<minimum of range>,<maximum of range>)$"
 Thus, "NBO:$sequence(8,2000000,2999999)$" will set a range of 8 digit IDs from 200000 
 to 2999999.  
 
## Git Quick Guide

TODO add instructions here

## Release Manager notes

to release, in top directory

    make

If this looks good:

    git commit -a

And type a brief description of the release in the editor window

# How to release the ontology

The -edit file is generally not visible to the public (of course they
can find it in github if they try). The editors are free to make
changes they are not yet comfortable releasing.

When ready for release, the process is as follows:

First check the file is valid - see the Jenkins/Travis job below. Additional
spot checks would not do any harm.

Commit and push these files.

IMMEDIATELY AFTERWARDS (do *not* make further modifications) go here:

 * https://github.com/bio-ontology-research/nbo/releases
 * https://github.com/bio-ontology-research/nbo/releases/new

The value of the "Tag version" field MUST be

    vYYYY-MM-DD

The initial lowercase "v" is REQUIRED. The YYYY-MM-DD *must* match
what is in the versionIRI of the derived nbo.owl (data-version in
nbo.obo).

Release title should be YYYY-MM-DD, optionally followed by a title (e.g. "january release")

Then click "publish release"

NO MORE THAN ONE RELEASE PER DAY.

In addition, this will be picked up by the central obolibrary job
within 24hrs, which will produce two files:

 1. http://purl.obolibrary.org/obo/nbo.obo
 2. http://purl.obolibrary.org/obo/nbo.owl

This is used by obolibrary users and OWL people

For questions on this contact Chris Mungall or email obo-admin AT obofoundry.org

# Jenkins Continuous Integration System

TODO - editors do you want this set up?
TODO - use travis

Check:

http://build.berkeleybop.org/job/build-nbo/

after committing

## General Guidelines

See:
http://wiki.geneontology.org/index.php/Curator_Guide:_General_Conventions
