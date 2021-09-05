# kalidock

KISS way of running Kali Linux (`kali-bleeding-edge`) in container with host networking, SSH X forwarding and more, all using `docker`

---

## PREREQUISITES
  1. Docker must be installed
  2. `$USER` must be a part of the `docker` group
  3. `$USER` must be a part of the `sudo`/`wheel` group
  4. Internet must be accessbile

---

# AUTOMATED WAY

## INSTALLATION

`curl -sS https://raw.githubusercontent.com/thirdbyte/kalidock/master/install.sh`

---

## USAGE

- `kalidock-start` : Start the container
- `kalidock-stop` : Stop the container
- `kalidock-shell` : SSH into the container

**Note:** Replace `kalidock` with the name given to the container at the time of installation.

---

## REMOVAL

- `kalidock-uninstall` : Stop and remove the container, image and files

---

# MANUAL WAY

## SETUP

### Clone the Repository
  1. `git clone http://github.com/thirdbyte/kalidock`
  2. `cd kalidock`

### Fix the Mount Point Permissions
`sudo chown -R 1000:1000 home/`

### Modify NUSER and NPASS in Containerfile
  1. `sed -i "s/NUSER/kali/g" Dockerfile`
  2. `sed -i "s/NPASS/kali/g" Dockerfile`

### Build the Container
`docker build --rm -t kalidock .`

### Create the Container
  1. `docker run --init -d --name=kalidock --shm-size=4g --hostname=kalidock --network=host --privileged -v $(pwd)/home:/home/kali kalidock`
  2. `docker stop kalidock`

---

## USAGE

### Start the Container
`docker start kalidock`

### Interact with the Container
`ssh -p65522 -X kali@localhost`

### Run GUI Programs (Inside the Container)
`gui <program-command>`

### Stop the Container
`docker stop kalidock`

---

## REMOVAL

  1. `docker stop kalidock`
  2. `docker rm kalidock`
  3. `docker rmi kalidock --force`
  4. `docker rmi kali-bleeding-edge --force`
  5. `sudo rm -rf /path/to/kalidock`
