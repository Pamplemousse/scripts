#! /bin/zsh

spec_dir="$HOME/Workspace/tools/scripts/spec"

for spec_file in spec/*.sh; do
  if [[ "${spec_file}" = "spec/all.sh" ]]; then
    continue
  else
    zsh "${spec_file}"
  fi
done
