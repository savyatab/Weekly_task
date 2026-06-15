# SCD Type 1
Overwrites old data with new data. No history is kept. Used for correcting mistakes like name or spelling updates.

# SCD Type 2
Stores full history by creating a new row for every change. Uses fields like valid_from, valid_to, and is_current.

# SCD Type 3
Stores limited history in the same row by keeping current and previous values in separate columns.