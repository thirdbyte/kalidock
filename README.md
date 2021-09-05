KISS way of running Kali Linux (`kali-bleeding-edge`) in container with host networking, SSH X forwarding and more, all using `docker`

---

## PREREQUISITES

  1. Docker must be installed
  2. `$USER` must be a part of the `docker` group
  3. `$USER` must be a part of the `sudo`/`wheel` group
  4. Internet must be accessbile

---

## INSTALLATION

  1. `git clone http://github.com/thirdbyte/kalidock /tmp/kalidock`
  2. `cd /tmp/kalidock`
  3. `bash install.sh`

---

## USAGE

- `container_name-start` : Start the container
- `container_name-stop` : Stop the container
- `container_name-shell` : SSH into the container

---

## UNINSTALLATION

- `container_name-uninstall` : Stop and remove the container, image and files

---

**Note:** Replace `container_name` with the name given to the container at the time of installation.
