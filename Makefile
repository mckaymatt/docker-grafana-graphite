# docker-grafana-graphite makefile

# Environment Varibles
CONTAINER =  kamon-grafana-dashboard

.PHONY: up

build : 
	docker build --tag=kamon/grafana_graphite .

prep :
	mkdir -p \
		data/whisper \
		data/elasticsearch \
		data/grafana \
		log/graphite \
		log/graphite/webapp \
		log/elasticsearch

pull :
	docker-compose pull

up : prep 
	docker-compose up -d

down :
	docker-compose down

shell :
	docker exec -ti $(CONTAINER) /bin/bash

tail :
	docker logs -f $(CONTAINER)
