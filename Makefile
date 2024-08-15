.PHONY: build run clean

# Build the Docker image
build:
	docker build -t fake-data-generator .

# Run the Docker container
run:
	docker run -e NUM_RECORDS=$(NUM_RECORDS) --name fake-data-container -it fake-data-generator  
	docker cp fake-data-container:app/fakedata_duckdb.db ./fakedata_duckdb.db 
	duckdb fakedata_duckdb.db

# Make csvs ouputs available for futher local processing
csvs:
	docker cp fake-data-container:app/products.csv ./products.csv 
	docker cp fake-data-container:app/transactions.csv ./transactions.csv 
	docker cp fake-data-container:app/user_profiles.csv ./user_profiles.csv 

# Stop and remove the container, image and generated files
clean:
	docker stop fake-data-container || true
	docker rm fake-data-container || true
	docker rmi fake-data-generator
	python3 clean_files.py