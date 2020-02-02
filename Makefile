.PHONY: up down build update-youtube-dl

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

update-youtube-dl:
	docker-compose exec sinusbot /opt/sinusbot/youtube-dl/youtube-dl -U --restrict-filename
