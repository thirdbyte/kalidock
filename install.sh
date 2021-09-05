#!/bin/bash

function check_init {

    if groups | grep -q "sudo" || groups | grep -q "wheel"; then
        echo "">/dev/null
    else
        echo "'$USER' is not present in 'sudo'/'wheel' group"
        exit 1
    fi

    if ! docker --version &>/dev/null; then
        echo "Docker is not installed"
        exit 1
    fi

    if ! groups | grep -q "docker"; then
        echo "'$USER' is not present in the 'docker' group"
        exit 1
    fi

    if ! ping -q -c 1 -W 1 github.com &>/dev/null; then
        echo "No Internet"
        exit 1
    fi

    if ! sed --version &>/dev/null; then
        echo "Sed is not installed"
        exit 1
    fi
    
    if ! git --version &>/dev/null; then
        echo "Git is not installed"
        exit 1
    fi

}

function add_path {
    if ! echo $PATH | grep -q "$HOME/.local/bin"; then
        mkdir -p $HOME/.local/bin
        echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.bashrc
        source $HOME/.bashrc
    fi
}

check_init
add_path

echo -n "Container name : "; read name
echo -n "Username : "; read theusername
echo -n "Password : "; read thepassword

mkdir -p $HOME/.$name && \
cp -r /tmp/kalidock/home/. $HOME/.$name/. && \
echo "Elevated privileges required" && \
sudo chown -R 1000:1000 $HOME/.$name/ && \
sed -i "s/NUSER/$theusername/g" /tmp/kalidock/Dockerfile && \
sed -i "s/NPASS/$thepassword/g" /tmp/kalidock/Dockerfile && \
docker build --rm -t $name /tmp/kalidock/. && \
docker run --init -d --name=$name --shm-size=4g --hostname=$name --network=host --privileged -v $(echo $HOME)/.$name/:/home/$theusername $name && \
docker stop $name && \
echo "docker start $name &>/dev/null" > $HOME/.local/bin/$name-start && \
echo "ssh -p65522 $name@localhost" > $HOME/.local/bin/$name-shell && \
echo "docker stop $name &>/dev/null" > $HOME/.local/bin/$name-stop && \
echo "docker stop $name &>/dev/null && docker rm $name &>/dev/null && docker rmi $name --force &>/dev/null && docker rmi kali-bleeding-edge:latest --force &>/dev/null && echo 'Elevated privileges required' && sudo rm -rf $HOME/.$name &>/dev/null && rm -rf $HOME/.local/bin/$name-* &>/dev/null" > $HOME/.local/bin/$name-uninstall && \
chmod +x $HOME/.local/bin/$name-* && \
echo "Done" 
