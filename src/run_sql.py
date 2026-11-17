
import sqlite3
import sys
from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent.parent

DB_FILE = BASE_DIR / "data" / "garment_production.db"

SQL_DIR = BASE_DIR / "sql"

# Choose SQL file from terminal argument
if len(sys.argv) > 1:
    filename = sys.argv[1]
else:
    filename = "01_data_validation.sql"

SQL_FILE = SQL_DIR / filename

# Validate filename
if Path(filename).name != filename:
    raise ValueError("Provide a filename, not a path.")

if not DB_FILE.exists():
    raise FileNotFoundError("Database file not found.")

if not SQL_FILE.exists():
    raise FileNotFoundError(f"SQL file not found: {SQL_FILE}")

sql_text = SQL_FILE.read_text(encoding="utf-8")

queries = [
    query.strip()
    for query in sql_text.split(";")
    if query.strip()
]

with sqlite3.connect(DB_FILE) as conn:
    for i, query in enumerate(queries, start=1):

        print(f"\nQUERY {i}")
        print("-" * 45)

        result = pd.read_sql_query(query, conn)

        print(result.to_string(index=False))

print("\nAll SQL queries executed successfully!")
