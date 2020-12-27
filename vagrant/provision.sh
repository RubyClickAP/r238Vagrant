#!/usr/bin/env bash

# Update remote package metadata
apt-get update -q

# Install deb dependencies
apt-get install -f -y git curl libcurl4-openssl-dev wget build-essential subversion autoconf libpq-dev libsqlite3-dev libmysqlclient-dev zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev bison qt4-qmake libqtwebkit-dev libffi-dev net-tools
apt install -y libssl1.0-dev

git clone git://github.com/RubyClickAP/rbenv.git        /opt/.rbenv
# Add rbenv to the path: (²£¥Írbenv.sh)
echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/opt/.rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
chmod +x /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

git clone https://github.com/RubyClickAP/ruby-build.git /opt/.rbenv/plugins/ruby-build
/opt/.rbenv/plugins/ruby-build/install.sh

#curl -fsSL https://gist.github.com/FiveYellowMice/c50490693d47577cfe7e6ac9fc3bf6cf.txt | rbenv install --patch 1.9.3-p551
rbenv install 2.3.8 # rbenv install --patch 2.3.8
rbenv global 2.3.8
ruvy -v # ruby 2.3.8p459 (2018-10-18 revision 65136) [x86_64-linux]
rbenv rehash
