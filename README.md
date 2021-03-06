# Builder [![Build Status](https://travis-ci.org/ankurcha/stemcell.png?branch=master)](https://travis-ci.org/ankurcha/stemcell) [![Code Climate](https://codeclimate.com/github/ankurcha/stemcell.png)](https://codeclimate.com/github/ankurcha/stemcell) [![Dependency Status](https://gemnasium.com/ankurcha/stemcell.png)](https://gemnasium.com/ankurcha/stemcell)

The stemcell builder is a commandline tool to create new stemcells. This product is under active development and definitely needs work. Expect things to broken and feel free to open bugs/issues. I will get to them as soon as possible.

## Installation

Install virtualbox

    Follow instructions on: https://www.virtualbox.org/wiki/Downloads

Install veewee

    $ gem install veewee --no-ri --no-rdoc

Install vagrant

    $ gem install vagrant --no-ri --no-rdoc

Install stemcell builder

    $ gem install stemcell

## Usage

The following is a listing of commands
```
Tasks:
  stemcell build SUBCOMMAND ...ARGS  # Build a new stemcell
  stemcell help [TASK]               # Describe available tasks or one specific task
  stemcell info <file>               # Display stemcell information, it looks for stemcell file name <file>
  stemcell validate <file>           # Validate stemcell, it looks for stemcell file name <file>
```
The `stemcell build` command gives the following options

```
Tasks:
  stemcell build centos          # Build a new centos stemcell
  stemcell build help [COMMAND]  # Describe subcommands or one specific subco...
  stemcell build redhat          # Build a new redhat stemcell
  stemcell build ubuntu          # Build a new ubuntu stemcell

Options:
  [--name=<name>]                              # Name of the stemcell
  [--prefix=<prefix>]                          # Directory to use as staging area for all the stemcell work
  [--architecture=<architecture>]              # Architecture of the OS
  [--infrastructure=<infrastructure>]          # Infrastructure hosting the vm
  [--target=<target>]                          # Path for the final stemcell
  [--agent-src-path=<agent_src_path>]          # Bosh Agent Source path, this may be the gem or directory path of Bosh agent source
  [--agent-version=<agent_version>]            # Bosh Agent version being installed
  [--agent-protocol=<agent_protocol_version>]  # Bosh Agent Protocol Version being installed
  [--iso=<iso file path>]                      # Path to the iso file to use
  [--iso-md5=<MD5 of iso file>]                # <MD5 hash>
  [--gui=Run virtualbox in headed mode]        # Run virtualbox headless
  [--definitions-dir=<path to definitions>]    # Absolute path to the definitions directory to use instead of the built in ones
  [--log-level=DEBUG|INFO|WARN|ERROR|FATAL]    # Level of verbosity for the logs, should match ruby logger levels: DEBUG < INFO < WARN < ERROR < FATAL
  [--micro=convert to micro bosh]              # Convert Stemcell into a micro Stemcell
  [--release-manifest=<agent_src_path>]        # Micro Bosh release manifest, generally <bosh_src_root>/release/micro/<infrastructure>.yml
  [--release-tar=<precompiled_release_tar>]    # Precompiled micro Bosh release tar archive
  [--package-compiler=<package_compiler>]      # Path to Bosh package compiler gems, generally <bosh_src_root>/release/src/bosh/package_compiler/
  [--ssh-port=<ssh_host_port>]                 # Port to use for the ssh tunnel to the vm, if nothing is specified a random open port will be selected
```

In case of a redhat installation, the following additional options are available
```
  [--rhn-user=<rhn username>]                  # Redhat Network Username
  [--rhn-pass=<rhn password>]                  # Redhat Network Password
```

## TODO
This tool is in pre-alpha and supports only a small subset of operations. Currently, the tool is targeted
to be able to create vsphere templates for ubuntu and centOS 6.x. The following is a list of things
that need to be done before we can call it ready for primetime (in order of priority).
* Add Micro cloudfoundry build support
* Support AWS
* Support Openstack

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
