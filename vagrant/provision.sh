#!/usr/bin/env bash

cd /usr/local
git clone git://github.com/RubyClickAP/rbenv.git        rbenv
chgrp -R staff rbenv
chmod -R g+rwxXs rbenv

echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="~/.gem/ruby/2.3.0/bin:$PATH"' >> /etc/profile.d/rbenv.sh
chmod +x /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

# Install ruby-build:
pushd /tmp
  git clone https://github.com/sstephenson/ruby-build.git
  cd ruby-build
  ./install.sh
popd

rbenv install 2.3.8
rbenv global 2.3.8
rbenv rehash

#sudo -H -u root /bin/bash << 'SCRIPT'
#  echo 'export PATH="/opt/.rbenv/bin:/opt/.rbenv/shims:$PATH"' >> ~/.bashrc
#  echo "gem: --no-ri --no-rdoc" > ~/.gemrc
#SCRIPT

sudo -H -u vagrant /bin/bash << 'SCRIPT'
  echo 'gem: --user-install --no-rdoc --no-ri' >> ~/.gemrc
SCRIPT