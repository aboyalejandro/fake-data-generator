Run to build the image, run the script, copy the duckdb to local, access the db: 

docker build -t fake-data-generator .       
docker rm fake-data-container # If exists...
docker run -e NUM_RECORDS=200000 --name fake-data-container -it fake-data-generator                              
docker cp fake-data-container:app/fakedata_duckdb.db ./fakedata_duckdb.db
duckdb fakedata_duckdb.db 

Use Ctrl+C or Ctrl+D to exit duckdb shell

If you prefer the local version rather than docker:

pip install requirements.txt
NUM_RECORDS=1000 # Set the records number you want to use
python3 generate_data.py
duckdb fakedata_duckdb.db 

Run some queries:

select * from user_profiles limit 5;
select distinct product_name, category from products left join transactions on products.product_id = transactions.product_id limit 5;
select distinct product_name, category, user_id, transaction_type, amount from products left join transactions on products.product_id = transactions.product_id limit 5;