#!/bin/bash
cat <<EOF
version: '2'
services:
  ${SERVICE_NAME}:
    image: ${BUILD_IMAGE}
    volumes:
      - .:/code
    working_dir: /code
    command: /sbin/init
    depends_on:
      - machinegun
  machinegun:
    image: dr.rbkmoney.com/rbkmoney/mg_prototype:87bef0b
    command: /opt/mgun/bin/mgun foreground
networks:
  default:
    driver: bridge
    driver_opts:
      com.docker.network.enable_ipv6: "true"
      com.docker.network.bridge.enable_ip_masquerade: "false"
EOF
