#!/bin/bash -e

# Since it sets an environment variable, the aws-profile
# helper must be installed as a bash function
if ! grep -q 'function aws-profile' ~/.bash_profile; then
  echo >> ~/.bash_profile
  cat aws-profile >> ~/.bash_profile

  # Finally configure bash completion for the above tools
  cp aws-console-completion.bash /etc/bash_completion.d/aws-console-completion.sh
  cp aws-profile-completion.bash /etc/bash_completion.d/aws-profile-completion.sh
fi

if ! grep -q 'function aws-profile' ~/.zprofile; then
  echo >> ~/.zprofile
  cat aws-profile >> ~/.zprofile

  # Finally configure bash completion for the above tools
  cp aws-console-completion.bash /etc/bash_completion.d/
  cp aws-profile-completion.bash /etc/bash_completion.d/
fi

# Install the credential helper as an executable
cp aws-console /usr/local/bin/
cp aws-refresh-credentials /usr/local/bin/
cp aws-whoami /usr/local/bin/
