#!/bin/bash

source _variables.sh

pushd $bosh_dir

    $bosh_dir/bin/bundle install $SRC_DIR/_bosh_agent.gem
    chmod +x $bosh_dir/agent/bin/agent

    # configure bosh agent
    mkdir -p /etc/sv/agent/log
    echo '#!/bin/bash
    export PATH=/var/vcap/bosh/bin:$PATH
    exec 2>&1
    exec /var/vcap/bosh/agent/bin/agent -c -I $(cat /etc/infrastructure)
    ' > /etc/sv/agent/run

    echo '#!/bin/bash
    svlogd -tt /var/vcap/bosh/log
    ' > /etc/sv/agent/log/run

    # runit
    chmod +x /etc/sv/agent/run /etc/sv/agent/log/run

    ln -s /etc/sv/agent /etc/service/agent

    cp $SRC_DIR/_empty_state.yml $bosh_dir/state.yml

    # The bosh agent installs a config that rotates on size
    mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

popd
