#!/bin/zsh

DB_NAME="data/apple_health_export.db"
CSV_FILE="data/record_data.csv"
TABLE_NAME="record"

echo "Cleaning up old data..."
rm -rf $DB_NAME

echo "Importing data from Apple Health export..."

sqlite3 $DB_NAME <<EOF
CREATE TABLE IF NOT EXISTS "$TABLE_NAME" (
type TEXT,
unit TEXT,
value TEXT,
sourceName TEXT,
sourceVersion TEXT,
device TEXT,
creationDate TEXT,
startDate TEXT,
endDate TEXT
);
EOF

sqlite3 $DB_NAME <<EOF
.mode csv
.import --skip 1 $CSV_FILE $TABLE_NAME
EOF

echo "Data imported successfully!"
