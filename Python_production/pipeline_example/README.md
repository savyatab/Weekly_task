# What I Have Performed
In this project, I developed a simple Python-based data pipeline that demonstrates production-style data processing practices.

## API Data Extraction
* Created an API client using the `requests` library.
* Fetched user data from a public API (`https://jsonplaceholder.typicode.com/users`).
* Converted the API response into Python objects for further processing.

## Data Transformation
* Created a transformation function in `transform.py`.
* Cleaned and standardized user names.
* Removed extra spaces using `strip()`.
* Converted names to lowercase using `lower()`.
* Returned transformed data in a structured format.

## Logging Implementation
* Implemented structured logging using Python's `logging` module.
* Logged important steps such as data fetching and pipeline execution.

## Retry Mechanism
* Created a retry decorator to handle temporary API failures.
* Automatically retries function execution up to 3 times.
* Added a delay between retries using `time.sleep()`.

## Data Validation
* Used Pydantic models to validate API records.
* Ensured records follow the expected structure and data types.

## Data Storage
* Stored raw API response in a JSON file (`raw.json`).
* Preserved extracted data for future processing and analysis.

## Code Structure
* Organized code into modular components:
  * API Client (`api_client.py`)
  * Logger (`logger.py`)
  * Retry Logic (`retry.py`)
  * Data Models (`models.py`)
  * Data Transformation (`transform.py`)
  * Main Pipeline (`main.py`)
* Followed a package-style project structure for better maintainability and readability.

## Testing
* Created test cases using `pytest`.
* Verified transformation logic through unit testing.
* Ensured code reliability through automated tests.

## Learning Outcomes
Through this project, I learned how to:
* Build modular Python applications.
* Work with APIs and JSON data.
* Implement logging and retry mechanisms.
* Validate data using Pydantic.
* Perform data transformation and cleaning.
* Write and execute unit tests using pytest.
* Structure code like a production-ready data pipeline.

# Installation 
* pip install pydantic
* pip install requests
* pip install sqlalchemy psycopg2