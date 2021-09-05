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

`curl -sS https://raw.githubusercontent.com/thirdbyte/kalidock/master/bootstrap.sh > /tmp/kdbs && bash /tmp/kdbs && rm -rf /tmp/kdbs`

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
