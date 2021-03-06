#!/bin/bash

# install docker, gcsfuse, mount gcsbuckets

sudo yum install -y epel-release ansible
sudo tee bootstrap.yaml > /dev/null <<EOF
---
- hosts: localhost
  connection: local
  gather_facts: false
  become: true
  tasks:
    - name: add gcsfuse yum repository
      yum_repository:
        name: gcsfuse
        description: GCSFUSE YUM repo
        baseurl: https://packages.cloud.google.com/yum/repos/gcsfuse-el7-x86_64
        enabled: no
        gpgcheck: no

    - name: install docker gcsfuse
      yum:
        name: "{{ packages }}"
        enablerepo: "gcsfuse"
        state: present
      vars:
        packages:
        - gcsfuse
        - docker

    - name: enable and start docker
      ansible.builtin.systemd:
        name: docker
        state: started
        enabled: yes

    - name: Give insecure permissions to an existing file
      ansible.builtin.file:
        path: /data
        owner: root
        group: root
        mode: '0755'
        state: directory

    - name: mount gcs bucket
      mount:
        path: /data
        src: "04292021-gcs-bucket-0112"
        fstype: gcsfuse
        opts: rw,x-systemd.requires=network-online.target,user
        state: mounted
EOF
sudo ansible-playbook bootstrap.yaml