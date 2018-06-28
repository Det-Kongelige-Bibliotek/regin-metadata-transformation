# regin-metadata-transformation
Transformation of the museum metadata from Regin

This will transform the KID museum metadata from Regin to a CSV format, which can be imported into Cumulus.



Run it like:
 `saxon export-test.xml extract.xsl -o:test.csv`

This will transform the test-export.xml with the extract.xsl and create the test.csv output file.

It requires the Saxon XSLT tool to be installed (can be installed with yum).
