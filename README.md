dev_conf
============

* **OS X updates and Xcode Command Line Tools**
* **OS X defaults** geared towards developers
* **Developer tools**: Vim, Oh My ZSH, bash, tab completion, curl, git, GNU core utils, Python, Ruby, etc
* **Developer apps**: iTerm2, Sublime Text, Vagrant, Docker, Firefox, etc
* **Cloud services**: Amazon Web Services (Boto, AWS CLI, S3cmd, etc)
* **Common data stores**: MySQL, PostgreSQL
* **Javascript web development**: NVM

### Sections Summary
* Section 1 contains the dotfiles/scripts and instructions to set up your system.
* Sections 2 through 7 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

**Scripts tested on OS X 10.10 Yosemite and 10.11 El Capitan.**

* [Single Setup Script](#single-setup-script)
* [bootstrap.sh script](#bootstrapsh-script)
    * Syncs dev_conf to your local home directory `~`
* [macosprep.sh script](#osxprepsh-script)
    * Updates MacOS and installs Xcode command line tools
* [brew.sh script](#brewsh-script)
    * Installs common Homebrew formulae and apps
* [macos.sh script](#osxsh-script)
    * Sets up OS X defaults geared towards developers
* [pydata.sh script](#pydatash-script)
    * Sets up python for data analysis
* [aws.sh script](#awssh-script)
    * Sets up Spark, Hadoop MapReduce, and Amazon Web Services
* [datastores.sh script](#datastoressh-script)
    * Sets up common data stores
* [web.sh script](#websh-script)
    * Sets up JavaScript web development

## Section 2: General Apps and Tools (Not exhaustive)

* [Sublime Text](#sublime-text)
* [Terminal Customization](#terminal-customization)
* [iTerm2](#iterm2)
* [Vim](#vim)
* [Git](#git)
* [Vagrant](#vagrant)
* [Docker](#docker)
* [Homebrew](#homebrew)
* [Ruby and rbenv](#ruby-and-rbenv)
* [Python](#python)
* [Pip](#pip)
* [Virtualenv](#virtualenv)

## Section 3: Python



## Section 4: Big Data, AWS, and Heroku

* [AWSCLI](#awscli)

## Section 5: Data Stores

* [MySQL](#mysql)
* [postresql](#postresql)

## Section 6: JavaScript Web Development

* [NVM](#nvm)

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/adamNewell/dev_conf.git && cd dev_conf

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

Run all:

    $ ./.dots all

Run `bootstrap.sh`, `macosprep.sh`, `brew.sh`, and `macos.sh`:

    $ ./.dots bootstrap macosprep brew macos

Run `bootstrap.sh`, `macosprep.sh`, `brew.sh`, and `macos.sh`, `pydata.sh`, `aws.sh`, and `datastores.sh`:

    $ ./.dots bootstrap macosprep brew macos pydata aws datastores

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `.dots` again to resume where you left off.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `.dots` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [.dots](https://github.com/donnemartin/dev-setup/blob/master/.dots) script.

### bootstrap.sh script

The `bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

#### Running with Git

First, fork or [clone the repo](#clone-the-repo).  The `bootstrap.sh` script will pull in the latest version and copy the files to your home folder `~`:

    $ source bootstrap.sh

To update later on, just run that command again.

Alternatively, to update while avoiding the confirmation prompt:

    $ set -- -f; source bootstrap.sh

#### Optional: Specify PATH

If `~/.path` exists, it will be sourced along with the other files before any feature testing (such as detecting which version of `ls` is being used takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

#### Optional: Add Custom Commands

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
GIT_AUTHOR_NAME="Adam Newell"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="adamdouglasnewell@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Install or upgrade a global package
# Usage: gpip install –upgrade pip setuptools virtualenv
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
```

### macosprep.sh script

Run the `macosprep.sh` script:

    $ ./macosprep.sh

`macosprep.sh` will first install all updates.  If a restart is required, simply run the script again.  Once all updates are installed, `macosprep.sh` will then [Install Xcode Command Line Tools](#install-xcode-command-line-tools).

If you want to go the manual route, you can also install all updates by running "App Store", selecting the "Updates" icon, then updating both the OS and installed apps.

#### Install Xcode Command Line Tools

An important dependency before many tools such as Homebrew can work is the **Command Line Tools for Xcode**. These include compilers like gcc that will allow you to build from source.

If you are running **OS X 10.9 Mavericks or later**, then you can install the Xcode Command Line Tools directly from the command line with:

    $ xcode-select --install

**Note**: the `osxprep.sh` script executes this command.

Running the command above will display a dialog where you can either:
* Install Xcode and the command line tools
* Install the command line tools only
* Cancel the install

### brew.sh script

When setting up a new Mac, you may want to install [Homebrew](http://brew.sh/), a package manager that simplifies installing and updating applications or libraries.

Some of the apps installed by the `brew.sh` script include: Chrome, Firefox, Sublime Text, Atom, Dropbox, Evernote, Skype, Slack, Alfred, VirtualBox, Vagrant, Docker, etc.  **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/donnemartin/dev-setup/blob/master/brew.sh) directly and tweak it to suit your needs.**

Run the `brew.sh` script:

    $ ./brew.sh

The `brew.sh` script takes awhile to complete, as some formulae need to be installed from source.

**For your terminal customization to take full effect, quit and re-start the terminal**

### macos.sh script

When setting up a new Mac, you may want to set OS X defaults geared towards developers.  The `macos.sh` script also configures common third-party apps such Sublime Text and Chrome.

Run the `macos.sh` script:

    $ ./macos.sh

**For your terminal customization to take full effect, quit and re-start the terminal.**

### pydata.sh script

To set up a development environment to work with Python and data analysis without relying on the more heavyweight [Anaconda](#anaconda) distribution, run the `pydata.sh` script:

    $ ./pydata.sh

### aws.sh script

To set up a development environment to work with Spark, Hadoop MapReduce, and Amazon Web Services, run the `aws.sh` script:

    $ ./aws.sh

### datastores.sh script


To set up common data stores, run the `datastores.sh` script:

    $ ./datastores.sh

### web.sh script

To set up a JavaScript web development environment, Run the `web.sh` script:

    $ ./web.sh
