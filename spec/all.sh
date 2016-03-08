#! /bin/zsh

to_be_returned=0

for spec_file in spec/*.sh; do
  if [[ "${spec_file}" = "spec/all.sh" ]]; then
    continue
  else
    zsh "${spec_file}"

    if [[ "${?}" = 1 ]]; then
      to_be_returned=1
    fi
  fi
done

exit $to_be_returned
