# statim-ai-server-example-text-model

## What is this?

--TODO--

## How to add a new model?

...

## How to Run?

1. Clone the repo:
```sh
# The repo is ready for build after clone, except creating a `.env` file (step 2)
git clone git@github.com:statim-ai/statim-ai-server-example-text-model.git
```

2. Create a `.env` file:
```sh
# For now you can just use the template, no changes needed
cp .env.template .env
```

3. Install and start Docker. Note: the server might use a lot of memory (it is dependent on the models loaded), you might need to adjust the memory available to your containers.
```sh
# To check if docker is running use:
docker ps
```

4. Create the docker image:
```sh
# This will crate new docker image: statim-ai-server-example-text-model
make build
```

5. Run the docker image:
```sh
# This will run the statim-ai-server-example-text-model docker image
make run
```

6. Make a request to the server:
```sh
curl --request POST \
    --url http://0.0.0.0:5000/job \
    --header 'Content-Type: application/json' \
    --data '{
        "prompt": "Tell me about cats in space",
        "model": "example/text-model"
    }'
```

7. Get a response from the server:
```json
{
	"id": 1,
	"model": "example/text-model",
	"prompt": "Tell me about cats in space",
	"status": "PROCESSING",
	"timestamp": "2024-04-07T15:22:05.813912"
}
```

8.  Pool the server until the request is processed:
```sh
curl --request GET \
    --url http://0.0.0.0:5000/job/1
```
