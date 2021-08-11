# kalidock

KISS and manual way of running Kali Linux (`kali-bleeding-edge`) in container with host networking, SSH X forwarding and more, all using `docker`
---

## PRERQUISITES
  1. Docker must be installed - `docker --version`
  2. $USER must be added to the `docker` group - `sudo usermod -aG docker $USER`
---

## SETUP

### A. Clone the Repository
  1. `git clone http://github.com/thirdbyte/kalidock`
  2. `cd kalidock`

### B. Fix the Mount Point Permissions
`sudo chown -R 1000:1000 home/`

### C. Modify NUSER and NPASS in Containerfile
  1. `sed -i "s/NUSER/kali/g" Dockerfile`
  2. `sed -i "s/NPASS/kali/g" Dockerfile`

### D. Build the Container
`docker build --rm -t kalidock .`

### E. Create the Container
  1. `docker run --init -d --name=kalidock --shm-size=4g --hostname=kalidock --network=host --privileged -v $(pwd)/home:/home/kali kalidock`
  2. `docker stop kalidock`
---

## USAGE

### F. Start the Container
`docker start kalidock`

### G. Interact with the Container
`ssh -p33322 -X kali@localhost`

### H. Run GUI Programs (Inside the Container)
`gui <program-command>`

### I. Stop the Container
`docker stop kalidock`
---

## REMOVAL

  1. `docker stop kalidock`
  2. `docker rm kalidock`
  3. `docker rmi kalidock --force`
  4. `docker rmi kali-bleeding-edge --force`
  5. `sudo rm -rf /path/to/kalidock`
