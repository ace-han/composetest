docker-compose test
======

An example for docker remote debug with `pydevd` or `ptvsd`

# Get Started
```sh
cd $PROJECT_HOME
# ensure you have docker installed

# if pydevd
# start the debug server in your eclipse 
docker-compose up

# if ptvsd
poetry export -f requirements.txt --dev --without-hashes --output requirements.txt
docker-compose up
# attach to port 3000 in docker, refer to .vscode/launch.json#`Remote Django App` section
# pay attention to `request`, `pathMappings`, `port`, `justMyCode` attributes
launch `Remote Django App` in vscode debug menu

# attact docker container shell to see more
docker container ls
docker exec -it $CONTAINER_NAME or $CONTAINER_ID sh


open 'http://localhost:8090'
# you should see an 'ok' message
```

# Notes
## pydevd
1. You will need to edit manage.py (refer to `pydevd_manage.py`)
1. You will need to find out your dev host ip where your eclipse is running on
1. You will need to add `environment` entry `PATHS_FROM_ECLIPSE_TO_PYTHON` to `docker-compose.yml`

## ptvsd
1. You will need to edit manage.py (refer to `ptvsd_manage.py`)
1. You will need to edit `launch.json` with `justMyCode=False` to see all `site-packages` codes when debug
1. You will need to add `3000:3000` to `ports` in `docker-compose.yml`

