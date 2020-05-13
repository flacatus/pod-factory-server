#!/bin/bash
#
# Copyright (c) 2012-2020 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation

set -e

install_VirtPackages() {
  printInfo 'Installing required virtualization packages installed'
  sudo yum -y install libvirt qemu-kvm
}

start_libvirt() {
  systemctl start libvirtd
}