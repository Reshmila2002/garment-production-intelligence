
import pandas as pd
import sqlite3
from pathlib import Path

# 1. Identify project directory
BASE_DIR = Path(__file__).resolve().parent.parent

# 2. Locate cleaned dataset
CSV_FILE = (
    BASE_DIR
    / "data"
    / "processed"
    / "garments_productivity_cleaned.csv"
)

# 3. Define database location
DB_FILE = BASE_DIR / "data" / "garment_production.db"

# 4. Load cleaned CSV
df = pd.read_csv(CSV_FILE)

print("Dataset loaded successfully!")
print("Dataset shape:", df.shape)

# 5. Check required columns
required_columns = [
    "date",
    "department",
    "team",
    "targeted_productivity",
    "actual_productivity",
    "smv",
    "over_time",
    "no_of_workers"
]

missing = [
    col for col in required_columns
    if col not in df.columns
]

if missing:
    raise ValueError(f"Missing columns: {missing}")

# 6. Create SQLite database and import records
with sqlite3.connect(DB_FILE) as conn:
    df.to_sql(
        name="garment_production",
        con=conn,
        if_exists="replace",
        index=False
    )

    # 7. Verify database records
    result = conn.execute(
        "SELECT COUNT(*) FROM garment_production"
    ).fetchone()

    print("Database records:", result[0])

print("Database created successfully!")
print("Database location:", DB_FILE)
