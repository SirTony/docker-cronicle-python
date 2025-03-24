# docker-cronicle-python

Docker project for Cronicle, bundling a python environment and script runner.

## Instalation

A pre-built image is available from this repo.

```bash
docker pull ghcr.io/sirtony/cronicle:latest
```

### Running

The recommended way to run this image is by using the provided [compose.yaml](https://github.com/SirTony/docker-cronicle-python/blob/main/compose.yaml) file.

```yaml
services:
  cronicle:
    volumes:
      - ./cronicle/data:/opt/cronicle/data:rw
      - ./cronicle/logs:/opt/cronicle/logs:rw
      - ./cronicle/plugins:/opt/cronicle/plugins:rw
      - ./cronicle/scripts:/opt/cronicle/scripts:rw
      - ./cronicle/app:/app:rw
      - /var/run/docker.sock:/var/run/docker.sock:rw
      - /etc/localtime:/etc/localtime:ro
      - /etc/timezone:/etc/timezone:ro
    ports:
      - 3012:3012
    container_name: cronicle
    image: ghcr.io/sirtony/cronicle:latest
    restart: always
```
Navigate to `http://localhost:3012` to access your new Cronicle instance.

Default account and password:

- username: `admin`
- password: `admin`

## Adding a new Python script to run

* Copy your python script to `./cronicle/scripts/python`
* Open [Cronicle console](localhost:3012)
* Go to `Schedule > [+] Add event...`
* Create the job as:
  * Plugin: `Python Script`.
  * Script path: the path to your script file, relative to `scripts/python` (i.e. `my_script.py` for `./cronicle/scripts/python/my_script.py`).
  * Required packages (not required): the same content of your `requirements.txt` file, each package in a line (with `==<version>` if needed).
  * Environment variables (not required): environment variables, one per line, in the format of a .env file (i.e. `AWS_REGION=us-east-1`)
  * Parameters (not required): single string of script parameters (i.e. `--v -f file.txt`)

For all other configurations, please refer to [cronicle official docs](https://github.com/jhuckaby/Cronicle/blob/master/docs/WebUI.md).

## Acknowledgments

- Thanks to `soulteary` for making Cronicle available for Docker.
- Thanks to `flavsdotpy` for setting up the original package this repo is forked from.

## Authors

* **[@flavsdotpy](github.com/flavsdotpy)**
* [@SirTony](github.com/flavsdotpy)
