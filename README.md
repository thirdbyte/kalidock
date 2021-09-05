KISS way of running Kali Linux (`kali-bleeding-edge`) in container with host networking, SSH X forwarding and more, all using `docker`

---

## PREREQUISITES

  - Docker must be installed
  - Git must be installed
  - `$USER` must be a part of the `docker` group
  - `$USER` must be a part of the `sudo`/`wheel` group
  - Internet must be accessbile

---

## INSTALLATION

`tmpdir=$(mktemp -d) && git clone http://github.com/thirdbyte/kalidock $tmpdir && cd $tmpdir && bash install.sh && rm -rf $tmpdir`

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
