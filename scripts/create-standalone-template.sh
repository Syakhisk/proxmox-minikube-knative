#!/bin/env bash

VM_ID="8000"
NAME="template-standalone"
IMAGE="/root/images/resized-jammy-server.img"

IP="10.0.0.30/22"
GW="10.0.0.1"

USERNAME="ubuntu"
PASSWORD="ubuntu"
SSH_KEY="$HOME/.ssh/id_rsa.pub"

MEMORY="512"
CORES="1"

qm create "$VM_ID" \
  --name "$NAME" \
  --memory "$MEMORY" \
  --cores "$CORES" \
  --net0 virtio,bridge=vmbr2 \
  --scsihw virtio-scsi-pci \
  --scsi0 local-lvm:0,import-from="$IMAGE" \
  --ide2 local-lvm:cloudinit \
  --boot order=scsi0 \
  --serial0 socket --vga serial0 \
  --ipconfig0 ip="$IP",gw="$GW" \
  --sshkey "$SSH_KEY" \
  --ciuser "$USERNAME" --cipassword="$(openssl passwd -6 "$PASSWORD")"
