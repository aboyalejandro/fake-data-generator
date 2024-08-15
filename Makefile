.PHONY: build run clean

# Build the Docker image
build:
	docker build -t fake-data-generator .

# Run the Docker container
run:
	docker run -e NUM_RECORDS=$(NUM_RECORDS) --name fake-data-container -it fake-data-generator  
	docker cp fake-data-container:app/fakedata_duckdb.db ./fakedata_duckdb.db 
	duckdb fakedata_duckdb.db

# Stop and remove the container, and remove the image
clean:
	docker stop fake-data-container || true
	docker rm fake-data-container || true
	docker rmi fake-data-generator