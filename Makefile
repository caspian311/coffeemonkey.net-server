
lambda.zip: api/movies.py api/login.py
	cd api ; zip ../lambda.zip ./*

all: lambda.zip

clean:
	rm -f lambda.zip
