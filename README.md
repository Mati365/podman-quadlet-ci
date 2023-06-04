![PODMAN logo](https://raw.githubusercontent.com/containers/common/main/logos/podman-logo-full-vert.png)

# podman-quadlet-ci

Podman quadlet CI deployment playground managed by using Ansible for simple applications

## Startup

1. Install `ansible`, `libvirt`, `Vagrant` in your system
2. Generate  SSH keys in `keys/ssh/private/deploy` directory (`id_rsa` / `id_rsa.pub`)
3. Ensure `~/.ssh/id_rsa` is present in your system - public key will be copied to `deploy` user `authorized` file
4. Execute: `./start-dev.sh`
5. Access `ssh deploy@192.168.56.10`
