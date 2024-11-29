OUTPUT := data/record_data.csv

record: record.xsl export.xml
	xsltproc -o $(OUTPUT) record.xsl export.xml

data/apple_health_export.db: $(OUTPUT)
	./import.sh $(OUTPUT)

start: data/apple_health_export.db
	docker compose up -d

clean:
	rm -f $(OUTPUT)

all: start

.PHONY: clean all
