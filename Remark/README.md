1. If necessary, install the TEI Stylesheet library
2. Edit (if necessary) line 8 of the TEItoRemark.xsl so that it points to the location where the TEI Stylesheet Library was installed
3. Copy the two directories js and themes into the root of your web server directory and/or the folder into which the output from the xslt script will be placed.
4. Run saxon (or other xslt processor) on your TEI XML file, using the script TEItoRemark.xsl and directing output to the same folder. You can do this inside oXygen of course, by setting up a suitable Transformation Scenario
5. Your TEI XML file must be valid against the teislides.rnc schema 

This is work in progress, with lots of room for improvement.
