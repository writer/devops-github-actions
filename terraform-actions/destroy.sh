#!/bin/bash

function terraformDestroy {
  set -o pipefail
  tempfile=$(mktemp)
  terraform destroy -no-color -auto-approve -input=false ${*} 2>&1 | tee $tempfile
  exitCode=$?
  output=$(cat $tempfile)
  rm $tempfile

  if [ ${exitCode} -eq 0 ]; then
    echo "Successfully ran terraform destroy command."
  else
    echo "Error: Failed to run terraform destroy"
  fi

  exit ${exitCode}
}
