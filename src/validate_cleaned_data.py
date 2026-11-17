
import pandas as pd
from pathlib import Path

# Define project paths
BASE_DIR = Path(__file__).resolve().parent.parent

RAW_FILE = BASE_DIR / "data" / "raw" / "garments_worker_productivity.csv"

CLEAN_FILE = BASE_DIR / "data" / "processed" / "garments_productivity_cleaned.csv"

# Load datasets
raw_df = pd.read_csv(RAW_FILE)
clean_df = pd.read_csv(CLEAN_FILE)

# 1. Check dimensions
assert raw_df.shape == clean_df.shape, "Dataset dimensions changed!"


# Display actual department names
print("Department names found:")

for department in clean_df["department"].unique():
    print(repr(department))



# 2. Check department names

actual_departments = set(clean_df["department"].unique())
expected_departments = {"sewing", "finishing"}

print("Actual departments:", actual_departments)
print("Expected departments:", expected_departments)

print("Unexpected values:",
      actual_departments - expected_departments)

print("Missing expected values:",
      expected_departments - actual_departments)

assert actual_departments == expected_departments, (
    "Unexpected department names!"
)

# 3. Check duplicate records
assert clean_df.duplicated().sum() == 0, "Duplicate rows found!"

# 4. Check missing WIP values
assert clean_df["wip"].isna().sum() == 506, "WIP missing count changed!"

# 5. Check high productivity records
assert (clean_df["actual_productivity"] > 1).sum() == 37, (
    "High productivity records changed!"
)

# 6. Check productivity values were preserved
pd.testing.assert_series_equal(
    raw_df["actual_productivity"],
    clean_df["actual_productivity"]
)

pd.testing.assert_series_equal(
    raw_df["targeted_productivity"],
    clean_df["targeted_productivity"]
)

print("All validation checks passed!")
print("Cleaned dataset shape:", clean_df.shape)
print("Departments:", clean_df["department"].unique())
print("Missing WIP values:", clean_df["wip"].isna().sum())
print("High productivity records:", (clean_df["actual_productivity"] > 1).sum())
