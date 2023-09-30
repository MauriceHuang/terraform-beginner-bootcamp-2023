# Terraform Beginner Bootcamp 2023

## Semantic Versioning

This project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Install the Terraform CLI

### Considerations with the Terraform CLI Changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we need to refer to the latest install CLI instructions via Terraform Documentation and change the script for install. 

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution
This project is built against Ubuntu. 
Please consider checking your Linux Distribution and change accordingly.
[How to Check OS Version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS version:
```sh
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI pgp deprecation issue, we noticed that bash scripts steps were considerable amount more code. So we decided to created a new bash sript to install the Terraform CLI.
This bash script is located :[./bin/install_install_terraform_cli](./bin/install_terraform_cli.sh)
 - This will keep the Gitpod Task File ([.gitpod.yml](./.gitpod.yml)) tidy.
 - This will allow us to easily debug and execute manually Terraform CLI install.
 - This will allow better portability for other projects that need to install Terraform CLI.

### Shebang Considerations

A Shebang (sha-bang) tells the bash script what program that will interpret the script. .eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`
- for portability for different OS distribution
- Will search the user's PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)
#### Executioin Considerations

When executing the bash script, we can use the `./` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli`
If we are using a script in .gitpod.yml, we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

#### Linus Permissions Considerations 
In order to make our bash scripts executable, we need to change Linux permissions for the fix to be executable at the user mode. It works as follow:

```sh
chmod u+x ./bin/install_terraform_cli
```
alternatively:
```
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod

https://lamby.cloud/docs/anatomy <= 38.56min 

https://en.wikipedia.org/wiki/Shebang_(Unix)

### Gitpod Lifecycle (Before, Init, Command)
We need to be careful when using the init because it will not rerun if we restart an existing workspace.
https://www.gitpod.io/docs/configure/workspaces/tasks

- [ ] what does it mean by making a script portable ?

### Working Env Vars

#### env command
To see all environment variable using the following command.

```
$env
```

Querying environment variable, in this example, we are querying for `gripod` in the environment variables
```
$ env | grep gitpod
```

#### Setting and Unsetting Env Vars

In the terminal, we can set using `export HELLO='world'`

In the terminal , we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO = 'World' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'
echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open new bash terminals in VSCode, it will not be aware of env vars that you have set in another terminal.
If you want to Env Vars to persist across all future bash terminals that are open, you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.
```
gp env Hello ='world'
```

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars.



