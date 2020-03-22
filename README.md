# pod-factory-server

Pod Factory Server is a tiny application made with Go that connect to your cluster and serve several information about the state of your containers.

Specifications:

* Instrumented with Prometheus
* Structured logging with zap 
* Swagger docs

Web API:

* `GET /pods` prints data from all pods
* `GET /pods/{namespace}` prints data from a specific namespace 
* `GET /metrics` return HTTP requests duration and Go runtime metrics
* `GET /env` returns the environment variables as a JSON array
* `GET /swagger.json` returns the API Swagger docs


To access the Swagger UI open `<pod-factory-server-host>/swagger/index.html` in a browser.

### Install

Local:

```bash
make build

```
Generate a binary located into ./bin folder ready to execute the Pod Factory Server.
