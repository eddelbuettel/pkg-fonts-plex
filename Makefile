
## Minimal and hackish packaging for Plex
##
## This Makefile downloads from GitHub, extracts the OTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016 - 2018  Dirk Eddelbuettel
## and released under GPL (>=2 )

srcfile=https://github.com/IBM/type/raw/master/ibm-plex.zip
outfile=$(shell basename ${srcfile})

all:
	test -f ${outfile} || wget ${srcfile} 
	unzip ${outfile}
	mkdir otf ttf
	mv fonts/*/desktop/pc/*.ttf ttf/
	mv fonts/*/desktop/mac/*.otf otf/
	rm -rf fonts/ 

clean:
	rm -f ${outfile} 
	rm -rf otf/ ttf/
