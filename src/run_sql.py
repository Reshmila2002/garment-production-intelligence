
import sqlite3
from pathlib import Path
import pandas as pd

# Project directory
BASE_DIR = Path(__file__).resolve().parent.parent

# Database path
DB_FILE = BASE_DIR / "data" / "garment_production.db"

# SQL file path
SQL_FILE = BASE_DIR / "sql" / "01_data_validation.sql"

# Read SQL queries
sql_text = SQL_FILE.read_text(encoding="utf-8")

# Split queries at semicolons
queries = [
    query.strip()
    for query in sql_text.split(";")
    if query.strip()
]

# Check database exists
if not DB_FILE.exists():
    raise FileNotFoundError(
        "Database not found. Run create_database.py first."
    )

# Connect to database
with sqlite3.connect(DB_FILE) as conn:

    for i, query in enumerate(queries, start=1):

        print(f"\nQUERY {i}")
        print("-" * 45)

        result = pd.read_sql_query(query, conn)

        print(result.to_string(index=False))

print("\nAll SQL queries executed successfully!")
