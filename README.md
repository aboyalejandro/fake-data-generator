# 📊🤖 Fake Data Generator for your demo projects

## 🚀 Introduction

This project generates synthetic data for user profiles, products, and financial transactions. It uses the Faker library to create realistic-looking fake data and DuckDB to query it. You can run it within a Docker container or locally. 

You can perform SQL joins because data is generated by considering relations between its tables. 

You can also run any other pandas, polars or Spark processing with the available csvs.

## 📝 Prerequisites

- Docker Desktop (if using the Docker)
- Python 3.9 (if running locally)
- `pip` (if running locally)
- Make (optional, for simplified commands)

## Setup and Usage

### 📦 Using Docker

1. **Build the Docker Image**

   First, you need to build the Docker image that contains all the necessary dependencies. Run the following command in your terminal:

```sh 
make build
```

2. **Run the Docker Container**
    Once the image is built, you can run the container with:

```sh 
make run
```
  
  Optional: you can run this command to have the csvs available in your local if using Docker.

```sh 
make csvs
``` 

   This will generate the fake data and output csv and the duckdb database to have available in your machine.

3. **Access the DuckDB Database**
    After running the container, you are inside the DuckDB database from within the container or copy the database file to your local machine for further analysis.

    You can run any queries you like:

```sh
SELECT * FROM user_profiles LIMIT 5;

SELECT DISTINCT product_name, category
FROM products
LEFT JOIN transactions ON products.product_id = transactions.product_id
LIMIT 5;

SELECT DISTINCT product_name, category, user_id, transaction_type, amount
FROM products
LEFT JOIN transactions ON products.product_id = transactions.product_id
LIMIT 5;
```

To exit the DuckDB shell, use Ctrl+C or Ctrl+D. You can always open DuckDB again by running:

```sh 
make duckdb
``` 

4. **Clean the container**

This command will remove the container, the image and any files that were copied:

```sh 
make clean
```

### 🖥️ Running Locally

1. **Install requirements.txt**

```sh 
pip install requirements.tzt 
```

2. **Generate Data**

```sh 
NUM_RECORDS=1000  # Adjust the number as needed
python3 generate_data.py
```
3. **Access DuckDB Database**

```sh
duckdb fakedata_duckdb.db 
```

### 📁 Output Format
The script generates the following output files:

- user_profiles.csv: Contains user profile data.
- products.csv: Contains product data.
- transactions.csv: Contains financial transaction data.

These CSV files are then imported into a DuckDB database named fakedata_duckdb.db, with tables corresponding to each CSV file.

### 😎 [Follow me on Linkedin](https://www.linkedin.com/in/alejandro-aboy/)
- Get tips, learnings and tricks for your Data career!

### 📩 [Subscribe to The Pipe & The Line](https://thepipeandtheline.substack.com/?utm_source=github&utm_medium=referral)
- Join the Substack newsletter to get similar content to this one and more to improve your Data career!
