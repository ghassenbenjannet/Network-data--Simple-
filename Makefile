.SILENT:
exo2.html: exo2.xsl exo2.xml
	xsltproc -o exo2.html exo2.xsl exo2.xml

clean:
	rm -rf exo2.html
