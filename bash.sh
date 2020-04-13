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
# Get all Modified/Created files in Pull Request.
# Command:
export PR_FILES_CHANGED=$(git --no-pager diff --name-only HEAD $(git merge-base HEAD master))
echo ${PR_FILES_CHANGED}
declare -a ${PR_FILES_CHANGED}
# check_che_types function chdeck first if pkg/apis/org/v1/che_types.go file suffer modifications and
# in case of modification should exist also modifications in deploy/crds/* folder.
function check_che_types() {
    # CHE_TYPES_FILE make reference to generated code by operator-sdk.
    local CHE_TYPES_FILE='\S*che_types.go'
    # Export variables for cr/crds files.    echo ${PR_FILES_CHANGED[@]}
   
        if [[ " ${PR_FILES_CHANGED[@]} " =~ $CR_CRD_REGEX ]]; then
            echo "[INFO] CR/CRD file modified: ${BASH_REMATCH}"
        else
            echo "[ERROR] Detected modification in ${CHE_TYPES_FILE} file, but cr/crd files didn't suffer any modification."
            exit 1
        fi

    if [[ " ${PR_FILES_CHANGED[@]} " =~ " ${CHE_TYPES_FILE} " ]]; then
        echo "[INFO] File ${CHE_TYPES_FILE} suffer modifications in PR. Checking if exist modifications for cr/crd files."
        # The script should fail if deploy/crds folder didn't suffer any modification.
        if [[ " ${PR_FILES_CHANGED[@]} " =~ $CR_CRD_REGEX ]]; then
            echo "[INFO] CR/CRD file modified: ${BASH_REMATCH}"
        else
            echo "[ERROR] Detected modification in ${CHE_TYPES_FILE} file, but cr/crd files didn't suffer any modification."
            exit 1
        fi
    fi
}

function check_deploy_folder() {
        # The script should fail if deploy/crds folder didn't suffer any modification.
    local CR_CRD_FOLDER="olm/"
    local CR_CRD_REGEX="\b$CR_CRD_FOLDER.*?\b"
    if [[ " ${PR_FILES_CHANGED[@]} " =~ $CR_CRD_REGEX ]]; then
        echo "[INFO] CR/CRD file modified: ${BASH_REMATCH}"
        echo  ${BASH_REMATCH}
    else
        echo "[ERROR] Detected modification in ${CHE_TYPES_FILE} file, but cr/crd files didn't suffer any modification."
        exit 1
    fi
}
check_che_types