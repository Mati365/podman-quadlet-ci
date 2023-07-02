const { ANSIBLE_SSH_PUB_KEY } = process.env;

if (!ANSIBLE_SSH_PUB_KEY) {
  throw new Error('Missing envs!');
}

const USER_DATA = /* yaml */ `
  #cloud-config
  users:
    - name: ansible
      sudo: ALL=(ALL) NOPASSWD:ALL
      shell: /bin/bash
      home: /home/ansible
      ssh_authorized_keys:
        - ${ANSIBLE_SSH_PUB_KEY}
`;
