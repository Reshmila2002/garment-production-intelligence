
import pandas as pd
from pathlib import Path

# 1. Define project paths
BASE_DIR = Path(__file__).resolve().parent.parent

RAW_FILE = (
    BASE_DIR / "data" / "raw"
    / "garments_worker_productivity.csv"
)

OUTPUT_FILE = (
    BASE_DIR / "data" / "processed"
    / "garments_productivity_cleaned.csv"
)

# 2. Load the original dataset
df = pd.read_csv(RAW_FILE)

print("Original dataset shape:", df.shape)

# 3. Create a copy of the original data
df_clean = df.copy()


# 4. Standardize department names
df_clean["department"] = (
    df_clean["department"]
    .str.strip()
    .str.lower()
    .replace({"sweing": "sewing"})
)

print("\nCleaned department names:")
print(df_clean["department"].value_counts())


# 5. Convert date column
df_clean["date"] = pd.to_datetime(
    df_clean["date"],
    format="%m/%d/%Y",
    errors="raise"
)

# 6. Check missing values
print("\nMissing values:")
print(df_clean.isnull().sum())

# 7. Check duplicate records
print("\nDuplicate records:")
print(df_clean.duplicated().sum())

# 8. Check department categories
print("\nDepartment counts:")
print(df_clean["department"].value_counts())

# 9. Validate row count
assert len(df_clean) == len(df), (
    "Unexpected change in row count!"
)

# 10. Save cleaned dataset
OUTPUT_FILE.parent.mkdir(
    parents=True,
    exist_ok=True
)

df_clean.to_csv(OUTPUT_FILE, index=False)

print("\nData cleaning completed successfully!")
print("Cleaned dataset saved to:", OUTPUT_FILE)
print("Cleaned dataset shape:", df_clean.shape)
