#!/bin/bash

JVM_VERSION="11"
LEIN_VERSION="2.9.7"
LEIN_INSTALL="/usr/local/bin"
LEIN_SHA256SUM="f78f20d1931f028270e77bc0f0c00a5a0efa4ecb7a5676304a34ae4f469e281d"
CLOJURE_VERSION="1.10.3.1020"
CLOJURE_SHA256SUM="afc87e2c8cfbf87e43553439c69a4c8e36bc2094405d08f39ca542b4cca0920a"
BABASHKA_VERSION="0.6.4"
BABASHKA_SHA256SUM="56ab0d626e5ed0c5022f71682d49700f628839f587210feab3672956641d5e01"
CLJ_KONDO_VERSION="2021.10.19"
CLJ_KONDO_SHA256SUM="bad383017ad460aa935c488d9806c459bb395f2a8f4ef57577930aa9143f3bf6"
TERRAFORM_VERSION="1.0.10"
TERRAFORM_SHA256SUM="a221682fcc9cbd7fde22f305ead99b3ad49d8303f152e118edda086a2807716d"
AWS_CLI_VERSION="2.3.3"
AWS_CLI_SHA256SUM="f444a11b9a06d27f336f2670e0b17a5e6f8efdc7c08fa9799f0dd031cad5042b"
AWS_SAM_CLI_VERSION="1.33.0"
AWS_SAM_CLI_SHA256SUM="3fcdf752ab30e6355087bcfa451a7d3ca6eb23445b893ecfcd0dea4fab166382"
HASURA_CLI_VERSION="2.0.10"
HASURA_CLI_SHA256SUM="421100560cdba703219a3e30eace524ee189d21feea095db9f504718d9cc2c17"
LUMO_VERSION="1.10.1"
KARMA_CLI_VERSION="2.0.0"
TYPESCRIPT_VERSION="4.4.4"
GH_VERSION="2.2.0"
GH_SHA256SUM="effdb6df788f1e7af43857bda377c2c86d6905e0fa2b19c74c5552059df65830"
BAT_VERSION="0.18.3"
BAT_SHA256SUM="3e85d15e5757d9f56af8f15bb99a56aaaab33ed541fa3ff1e1c585f5733845c3"
DELTA_VERSION="0.9.2"
DELTA_SHA256SUM="1f927b5eda756ce048146159bd30973f06c15448deefd06f60749d6aa15d255d"
FD_VERSION="8.2.1"
FD_SHA256SUM="f3a949325f1893145ced2b269a67d5763af3bede435c40e3b85b29afdb78c3d2"
HEXYL_VERSION="0.9.0"
HEXYL_SHA256SUM="9bf99a1441f2261fe3548a3b886e70a6e7bf78dc501b8209c2bbe342a535b194"
RIPGREP_VERSION="13.0.0"
RIPGREP_SHA256SUM="6d78bed13722019cb4f9d0cf366715e2dcd589f4cf91897efb28216a6bb319f1"
RCLONE_VERSION="1.57.0"
RCLONE_SHA256SUM="5a2a70b546bff92253c289e56d19746ee64a3944d14b6afa833e9991035ca18c"
NEOVIM_VERSION="0.5.0"
NEOVIM_SHA256SUM="cd59e885143e0fa7e43cfdacbc8e37dc033c56d9205b8f8a8acd08cd9f93737d"
EXA_VERSION="0.10.1"
EXA_SHA256SUM="a65a87bd545e969979ae9388f6333167f041a1f09fa9d60b32fd3072348ff6ce"
WEBSOCAT_VERSION="1.9.0"
WEBSOCAT_SHA256SUM="9ab17a9e03cca60fbf00aa709a1df5d9fb99a4514240cf7fac390470d6022bc5"
PUEUE_VERSION="1.0.3"
PUEUE_SHA256SUM="e79f0764ae7ec1e6d1ea0dae3f2ee6a6310fe3697e821cc20db4452a2c285364"
PUEUED_SHA256SUM="f5bcd2e8469898302446161bca3f9eb0e64e406051a90928795fca11678cfd40"
GREX_VERSION="1.3.0"
GREX_SHA256SUM="df47f82add291905af60d20a3499f6845c65bfe452fa9d30f8c7a900f45578e8"
POWERSHELL_VERSION="7.1.5"
POWERSHELL_SHA256SUM="4d0ee19617ebd696527e966a35a00f94ca3e83c850efdde10cd4b27369a17288"
OH_MY_POSH_VERSION="5.19.1"
OH_MY_POSH_SHA256SUM="2bbad1b8c88d7ed5349ef3d2d5c4fe88dde632e6dfaf83e84cece90cbc269e59"
DOCKER_VERSION="20.10.9"
DOCKER_SHA256SUM="caf74e54b58c0b38bb4d96c8f87665f29b684371c9a325562a3904b8c389995e"
DOCKER_COMPOSE_VERSION="2.1.0"
DOCKER_COMPOSE_SHA256SUM="90990e7268e954e7930353650d7bcf5a37d29c77925ea2066335367b5f27ec9a"
KUBECTL_VERSION="1.22.3"
KUBECTL_SHA256SUM="0751808ca8d7daba56bf76b08848ef5df6b887e9d7e8a9030dd3711080e37b54"
GIT_GPGKEY="E1DD270288B4E6030699E45FA1715D88E1DF1F24"
PLANCK_GPGKEY="A5D6812987A6E53579AF0308D3D743111F327606"
CLICKHOUSE_GPGKEY="E0C56BD4"
MICROSOFT_PACKAGES_SHA256SUM="4df5811c41fdded83eb9e2da9336a8dfa5594a79dc8a80133bd815f4f85b9991"
DEBIAN_FRONTEND="noninteractive"

cd /tmp

# Turn on Bash extended glob support so we can use patterns like !("file1"|"file2")
shopt -s extglob

apt-get update -qq
apt-get dist-upgrade -qq -y
printf '\n\n'

# Ensure tools needed by the subsequent commands are installed.
apt-get install -qq -y --no-install-recommends \
    locales tzdata \
    ca-certificates gnupg \
    curl wget \
    unzip
printf '\n\n'

# Set the default locale to en_NZ.UTF-8
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# en_NZ.UTF-8 UTF-8/en_NZ.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG="en_NZ.UTF-8"' > /etc/default/locale
dpkg-reconfigure locales
update-locale LANG=en_NZ.UTF-8

# Set the default timezone to Pacific/Auckland.
ln -s --force /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
dpkg-reconfigure tzdata

# When adding PPAs do not depend on `software-properties-common` for the `add-apt-repository`
# command as that adds several hundred megabytes of dependencies.

echo "Adding 'Git stable releases' PPA..."
echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu focal main" > /etc/apt/sources.list.d/git-core-ubuntu-ppa-focal.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $GIT_GPGKEY
printf '\n\n'

echo "Adding 'Mike Fikes's Planck' PPA..."
echo "deb http://ppa.launchpad.net/mfikes/planck/ubuntu focal main" > /etc/apt/sources.list.d/mfikes-ubuntu-planck-focal.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $PLANCK_GPGKEY
printf '\n\n'

# Git Large File Storage is required when cloning any Git repository that uses the Git LFS
# Specification. See https://github.com/git-lfs/git-lfs
echo "Adding Git LFS package repository..."
curl -fsSL https://packagecloud.io/github/git-lfs/gpgkey | apt-key add -
echo "deb https://packagecloud.io/github/git-lfs/ubuntu/ focal main" > /etc/apt/sources.list.d/github_git-lfs.list
printf '\n\n'

echo "Adding NodeSource's Node.js v16.x package repository..."
echo "deb https://deb.nodesource.com/node_16.x focal main" > /etc/apt/sources.list.d/nodesource.list
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
printf '\n\n'

echo "Adding Yarn package repository..."
echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
printf '\n\n'

echo "Adding ClickHouse package repository..."
echo "deb https://repo.clickhouse.com/deb/stable/ main/" > /etc/apt/sources.list.d/clickhouse.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $CLICKHOUSE_GPGKEY

echo "Adding Microsoft package repository..."
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
echo "Verifying packages-microsoft-prod.deb checksum..."
sha256sum "packages-microsoft-prod.deb"
echo "${MICROSOFT_PACKAGES_SHA256SUM} *packages-microsoft-prod.deb" | sha256sum -c -
dpkg -i packages-microsoft-prod.deb
rm -f packages-microsoft-prod.deb

# Refresh package lists after adding package repositories.
apt-get update -qq

# Install packages from apt repositories.
apt-get install -qq -y --no-install-recommends \
  # Development tools:
  git git-lfs diffstat jq silversearcher-ag fzf \
  # System tools:
  neofetch ncdu htop zstd \
  # Terminal tools:
  rlwrap less tmux openssh-client mosh \
  # Editors:
  emacs-nox \
  # Build tools and language runtimes:
  zsh build-essential cmake openjdk-$JVM_VERSION\-jdk-headless nodejs yarn python3-pip planck dotnet-sdk-5.0 \
  # Database clients:
  postgresql-client clickhouse-client \
  # Portable Network Graphic (PNG) format tools:
  pngnq pngquant pngtools pngmeta pngcrush pngcheck \
  # Joint Photographic Experts Group (JPEG) format tools:
  jhead jpeginfo jpegoptim jpegpixi \
  # Dependencies of powershell:
  liblttng-ust-ctl4 liblttng-ust0 \
  # Dependencies of xvfb, Chrome and ChromeDriver that are common to all versions:
  xvfb libxcomposite1 libxrandr2 libxss1 libxext6 \
  # Voting in the popularity contest may help keep packages we use supported by Ubuntu:
  popularity-contest
rm -rf /var/lib/apt/lists/*
printf '\n\n'

# Install Clojure:
echo "Installing 'Official' Clojure CLI ${CLOJURE_VERSION}..."
wget -q "https://download.clojure.org/install/linux-install-$CLOJURE_VERSION.sh"
echo "Verifying linux-install-$CLOJURE_VERSION.sh checksum..."
sha256sum linux-install-$CLOJURE_VERSION.sh
echo "$CLOJURE_SHA256SUM *linux-install-$CLOJURE_VERSION.sh" | sha256sum -c -
chmod +x linux-install-$CLOJURE_VERSION.sh
./linux-install-$CLOJURE_VERSION.sh
rm -f "linux-install-${CLOJURE_VERSION}.sh"
clojure -e "(clojure-version)"
printf '\n\n'

# Install Leiningen:
echo "Installing Leiningen ${LEIN_VERSION}..."
mkdir -p $LEIN_INSTALL
wget -q https://raw.githubusercontent.com/technomancy/leiningen/$LEIN_VERSION/bin/lein-pkg
echo "Verifying lein-pkg checksum..."
sha256sum lein-pkg
echo "$LEIN_SHA256SUM *lein-pkg" | sha256sum -c -
mv lein-pkg $LEIN_INSTALL/lein
chmod 0755 $LEIN_INSTALL/lein
wget -q "https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.jar"
mkdir -p /usr/share/java
mv leiningen-$LEIN_VERSION-standalone.jar /usr/share/java/leiningen-$LEIN_VERSION-standalone.jar
printf '\n\n'

# Install babashka:
echo "Installing babashka..."
wget -q "https://github.com/babashka/babashka/releases/download/v${BABASHKA_VERSION}/babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz"
echo "Verifying babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz checksum..."
sha256sum "babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz"
echo "${BABASHKA_SHA256SUM} *babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz" | sha256sum -c -
tar -xzf "babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz" -C /usr/local/bin
rm -f "babashka-${BABASHKA_VERSION}-linux-amd64.tar.gz"
bb --version

# Install clj-kondo:
echo "Installing clj-kondo..."
wget -q "https://github.com/clj-kondo/clj-kondo/releases/download/v${CLJ_KONDO_VERSION}/clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip"
echo "Verifying clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip checksum..."
sha256sum "clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip"
echo "$CLJ_KONDO_SHA256SUM *clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip" | sha256sum -c -
unzip "clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip" -d /usr/local/bin
rm -f "clj-kondo-${CLJ_KONDO_VERSION}-linux-amd64.zip"
clj-kondo --version

# Install Terraform:
echo "Installing Terraform..."
wget -q "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
echo "Verifying terraform_${TERRAFORM_VERSION}_linux_amd64.zip checksum..."
sha256sum "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
echo "${TERRAFORM_SHA256SUM} *terraform_${TERRAFORM_VERSION}_linux_amd64.zip" | sha256sum -c -
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin
rm -f "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
strip --strip-unneeded /usr/local/bin/terraform
terraform --version

# install AWS CLI
echo "Install AWS CLI..."
wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip"
echo "Verifying awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip checksum..."
sha256sum awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip
echo "${AWS_CLI_SHA256SUM} awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" | sha256sum -c -
unzip awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip -d aws-installation
./aws-installation/aws/install
rm -rf awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip aws-installation
aws --version

# Install AWS SAM CLI
echo "Install AWS SAM CLI..."
wget -q "https://github.com/aws/aws-sam-cli/releases/download/v${AWS_SAM_CLI_VERSION}/aws-sam-cli-linux-x86_64.zip"
echo "Verifying aws-sam-cli-linux-x86_64.zip checksum.."
sha256sum aws-sam-cli-linux-x86_64.zip
echo "${AWS_SAM_CLI_SHA256SUM} aws-sam-cli-linux-x86_64.zip" | sha256sum -c -
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
./sam-installation/install
rm -rf aws-sam-cli-linux-x86_64.zip sam-installation
sam --version

## Install Hasura CLI
echo "Install Hasura CLI..."
wget -q "https://github.com/hasura/graphql-engine/releases/download/v${HASURA_CLI_VERSION}/cli-hasura-linux-amd64"
echo "Verifying cli-hasura-linux-amd64 checksum..."
sha256sum cli-hasura-linux-amd64
echo "${HASURA_CLI_SHA256SUM} *cli-hasura-linux-amd64" | sha256sum -c -
mv cli-hasura-linux-amd64 /usr/local/bin/hasura
chmod +x /usr/local/bin/hasura
hasura version

# Install pipenv
echo "Installing pipenv..."
pip3 -q install pipenv
printf '\n\n'

# Install yq (jq wrapper for YAML and XML)
echo "Installing yq..."
pip3 -q install yq
printf '\n\n'

# Install pytest
echo "Installing pytest..."
pip3 -q install pytest
printf '\n\n'

# Install Docker
# Origin: https://download.docker.com/linux/static/stable/x86_64/
echo "Installing Docker ${DOCKER_VERSION}..."
wget -q "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz"
echo "Verifying docker-${DOCKER_VERSION}.tgz checksum..."
sha256sum "docker-${DOCKER_VERSION}.tgz"
echo "${DOCKER_SHA256SUM} *docker-${DOCKER_VERSION}.tgz" | sha256sum -c -
tar -xzC /usr/local/bin --strip-components=1 -f "docker-${DOCKER_VERSION}.tgz"
rm -f "docker-${DOCKER_VERSION}.tgz"

# Install Docker Compose
echo "Installing Docker Compose ${DOCKER_COMPOSE_VERSION}..."
wget -q "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64"
echo "Verifying docker-compose-linux-x86_64 checksum..."
sha256sum "docker-compose-linux-x86_64"
echo "${DOCKER_COMPOSE_SHA256SUM} *docker-compose-linux-x86_64" | sha256sum -c -
mkdir -p /usr/local/lib/docker/cli-plugins
mv "docker-compose-linux-x86_64" /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Install Kubectl
echo "Installing Kubectl ${KUBECTL_VERSION}..."
wget -q "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
echo "Verifying Kubectl checksum..."
sha256sum kubectl
echo "${KUBECTL_SHA256SUM} *kubectl" | sha256sum -c -
mv kubectl /usr/local/bin
chmod +x /usr/local/bin/kubectl

# Install gh
#
# GitHub's official command line tool.
#
# To update to a new release:
# 1. Open https://github.com/cli/cli/releases/
# 2. Download gh_VERSION_linux_amd64.deb for the desired version
# 3. Run `sha256sum gh_VERSION_linux_amd64.deb`
# 4. Copy/paste the checksum to GH_SHA256SUM in environment variables at the beginning of this RUN script
# 5. Edit the GH_VERSION in environment variables at the beginning of this RUN script
echo "Installing gh ${GH_VERSION}..."
wget -q "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.deb"
echo "Verifying gh_${GH_VERSION}_linux_amd64.deb checksum..."
sha256sum "gh_${GH_VERSION}_linux_amd64.deb"
echo "$GH_SHA256SUM *gh_${GH_VERSION}_linux_amd64.deb" | sha256sum -c -
dpkg -i "gh_${GH_VERSION}_linux_amd64.deb"
rm -f "gh_${GH_VERSION}_linux_amd64.deb"
printf '\n\n'

# Install bat
#
# A cat(1) clone with syntax highlighting and Git integration.
#
# To update to a new release:
# 1. Open https://github.com/sharkdp/bat/releases
# 2. Download bat_VERSION_amd64.deb for the desired version
# 3. Run `sha256sum bat_VERSION_amd64.deb`
# 4. Copy/paste the checksum to BAT_SHA256SUM in environment variables at the beginning of this RUN script
# 5. Edit the BAT_VERSION in environment variables at the beginning of this RUN script
echo "Installing bat ${BAT_VERSION}..."
wget -q "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
echo "Verifying bat_${BAT_VERSION}_amd64.deb checksum..."
sha256sum "bat_${BAT_VERSION}_amd64.deb"
echo "$BAT_SHA256SUM *bat_${BAT_VERSION}_amd64.deb" | sha256sum -c -
dpkg -i "bat_${BAT_VERSION}_amd64.deb"
rm -f "bat_${BAT_VERSION}_amd64.deb"
printf '\n\n'

# Install delta
#
# A viewer for git and diff output.
echo "Installing delta ${DELTA_VERSION}..."
wget -q "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb"
echo "Verifying git-delta_${DELTA_VERSION}_amd64.deb checksum..."
sha256sum "git-delta_${DELTA_VERSION}_amd64.deb"
echo "$DELTA_SHA256SUM *git-delta_${DELTA_VERSION}_amd64.deb" | sha256sum -c -
dpkg -i "git-delta_${DELTA_VERSION}_amd64.deb"
rm -f "git-delta_${DELTA_VERSION}_amd64.deb"
printf '\n\n'

# Install fd
#
# fd is a simple, fast and user-friendly alternative to 'find'.
#
# To update to a new release:
# 1. Open https://github.com/sharkdp/fd/releases
# 2. Download fd_VERSION_amd64.deb for the desired version
# 3. Run `sha256sum fd_VERSION_amd64.deb`
# 4. Copy/paste the checksum to FD_SHA256SUM in environment variables at the beginning of this RUN script
# 5. Edit the FD_VERSION in environment variables at the beginning of this RUN script
echo "Installing fd ${FD_VERSION}..."
wget -q "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb"
echo "Verifying fd_${FD_VERSION}_amd64.deb checksum..."
sha256sum "fd_${FD_VERSION}_amd64.deb"
echo "$FD_SHA256SUM *fd_${FD_VERSION}_amd64.deb" | sha256sum -c -
dpkg -i "fd_${FD_VERSION}_amd64.deb"
rm -f "fd_${FD_VERSION}_amd64.deb"
printf '\n\n'

# Install hexyl
#
# hexyl is a command-line hex viewer.
#
# To update to a new release:
# 1. Open https://github.com/sharkdp/hexyl/releases
# 2. Download hexyl_VERSION_amd64.deb for the desired version
# 3. Run `sha256sum hexyl_VERSION_amd64.deb`
# 4. Copy/paste the checksum to HEXYL_SHA256SUM in environment variables at the beginning of this RUN script
# 5. Edit the HEXYL_VERSION in environment variables at the beginning of this RUN script
echo "Installing hexyl ${HEXYL_VERSION}..."
wget -q "https://github.com/sharkdp/hexyl/releases/download/v${HEXYL_VERSION}/hexyl_${HEXYL_VERSION}_amd64.deb"
echo "Verifying hexyl package checksum..."
sha256sum "hexyl_${HEXYL_VERSION}_amd64.deb"
echo "$HEXYL_SHA256SUM *hexyl_${HEXYL_VERSION}_amd64.deb" | sha256sum -c -
dpkg -i "hexyl_${HEXYL_VERSION}_amd64.deb"
rm -f "hexyl_${HEXYL_VERSION}_amd64.deb"
printf '\n\n'

# Install ripgrep
echo "Installing ripgrep ${RIPGREP_VERSION}..."
wget -q "https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_amd64.deb"
echo "Verifying ripgrep_${RIPGREP_VERSION}_amd64.deb checksum..."
sha256sum "ripgrep_${RIPGREP_VERSION}_amd64.deb"
echo "${RIPGREP_SHA256SUM} *ripgrep_${RIPGREP_VERSION}_amd64.deb" | sha256sum -c -
dpkg -i "ripgrep_${RIPGREP_VERSION}_amd64.deb"
rm -f "ripgrep_${RIPGREP_VERSION}_amd64.deb"
printf '\n\n'

# Install rclone
echo "Installing rclone ${RCLONE_VERSION}..."
wget -q "https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.deb"
echo "Verifying rclone-v${RCLONE_VERSION}-linux-amd64.deb checksum..."
sha256sum "rclone-v${RCLONE_VERSION}-linux-amd64.deb"
echo "${RCLONE_SHA256SUM} *rclone-v${RCLONE_VERSION}-linux-amd64.deb" | sha256sum -c -
dpkg -i "rclone-v${RCLONE_VERSION}-linux-amd64.deb"
rm -f "rclone-v${RCLONE_VERSION}-linux-amd64.deb"
printf '\n\n'

# Install exa
echo "Installing exa ${EXA_VERSION}..."
wget -q "https://github.com/ogham/exa/releases/download/v${EXA_VERSION}/exa-linux-x86_64-v${EXA_VERSION}.zip"
echo "Verifying exa-linux-x86_64-v${EXA_VERSION}.zip checksum..."
sha256sum "exa-linux-x86_64-v${EXA_VERSION}.zip"
echo "${EXA_SHA256SUM} exa-linux-x86_64-v${EXA_VERSION}.zip" | sha256sum -c -
unzip -q "exa-linux-x86_64-v${EXA_VERSION}.zip" -d /usr/local
rm -f "exa-linux-x86_64-v${EXA_VERSION}.zip"
printf '\n\n'

# Install nvim
echo "Installing Neovim ${NEOVIM_VERSION}..."
wget -q "https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim-linux64.tar.gz"
echo "Verifying nvim-linux64.tar.gz checksum..."
sha256sum "nvim-linux64.tar.gz"
echo "${NEOVIM_SHA256SUM} nvim-linux64.tar.gz" | sha256sum -c -
tar --strip-components=1 -C /usr/local -xf nvim-linux64.tar.gz
rm -f nvim-linux64.tar.gz
strip --strip-unneeded /usr/local/bin/nvim
printf '\n\n'

# Install websocat
echo "Installing websocat ${WEBSOCAT_VERSION}..."
wget -q "https://github.com/vi/websocat/releases/download/v${WEBSOCAT_VERSION}/websocat_linux64"
echo "Verifying websocat_linux64 checksum..."
sha256sum "websocat_linux64"
echo "${WEBSOCAT_SHA256SUM} *websocat_linux64" | sha256sum -c -
mv websocat_linux64 /usr/local/bin/websocat
chmod +x /usr/local/bin/websocat
printf '\n\n'

# Install pueue
echo "Installing pueue and pueued ${PUEUE_VERSION}..."
wget -q "https://github.com/Nukesor/pueue/releases/download/v${PUEUE_VERSION}/pueue-linux-x86_64"
wget -q "https://github.com/Nukesor/pueue/releases/download/v${PUEUE_VERSION}/pueued-linux-x86_64"
echo "Verifying pueue-linux-x86_64 checksum..."
sha256sum pueue-linux-x86_64
echo "${PUEUE_SHA256SUM} *pueue-linux-x86_64" | sha256sum -c -
echo "Verifying pueued-linux-x86_64 checksum..."
sha256sum pueued-linux-x86_64
echo "${PUEUED_SHA256SUM} *pueued-linux-x86_64" | sha256sum -c -
mv pueue-linux-x86_64 /usr/local/bin/pueue
mv pueued-linux-x86_64 /usr/local/bin/pueued
chmod +x /usr/local/bin/pueue /usr/local/bin/pueued
printf '\n\n'

# Install grex
echo "Installing grex ${GREX_VERSION}..."
wget -q "https://github.com/pemistahl/grex/releases/download/v${GREX_VERSION}/grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz"
echo "Verifying grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz checksum..."
sha256sum "grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz"
echo "${GREX_SHA256SUM} *grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz" | sha256sum -c -
tar zxf "grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz"
rm -f "grex-v${GREX_VERSION}-x86_64-unknown-linux-musl.tar.gz"
mv grex /usr/local/bin/grex
printf '\n\n'

# Install PowerShell
#
# Windows has become a surprisingly good platform for developers in recent times. Just like its important to have
# a preferred editor handy, be it vim or emacs, it is also important to have a familiar shell available to those who
# want to use it.
echo "Installing PowerShell ${POWERSHELL_VERSION}..."
wget -q https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/powershell_${POWERSHELL_VERSION}-1.ubuntu.20.04_amd64.deb
echo "Verifying powershell package checksum..."
sha256sum "powershell_${POWERSHELL_VERSION}-1.ubuntu.20.04_amd64.deb"
echo "$POWERSHELL_SHA256SUM *powershell_${POWERSHELL_VERSION}-1.ubuntu.20.04_amd64.deb" | sha256sum -c -
dpkg -i "powershell_${POWERSHELL_VERSION}-1.ubuntu.20.04_amd64.deb"
rm -f "powershell_${POWERSHELL_VERSION}-1.ubuntu.20.04_amd64.deb"

# Ref: https://ohmyposh.dev/docs/linux
wget -q "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v${OH_MY_POSH_VERSION}/posh-linux-amd64"
echo "Verifying posh-linux-amd64 checksum..."
sha256sum posh-linux-amd64
echo "${OH_MY_POSH_SHA256SUM} posh-linux-amd64" | sha256sum -c -
mv posh-linux-amd64 /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh
strip --strip-unneeded /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
cp ~/.poshthemes/jandedobbeleer.omp.json ~
pwsh -Command "Set-PSRepository PSGallery -InstallationPolicy Trusted"
pwsh -Command "Install-Module posh-git -Scope CurrentUser"
pwsh -Command "Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck"
pwsh -Command 'if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }'
PWSH_PROFILE=`pwsh -Command 'echo $PROFILE'`
cat << EOF > $PWSH_PROFILE
$env:POSH_GIT_ENABLED = $true
Import-Module PSReadLine
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
EOF
printf '\n\n'

# Install Zsh, Bash and Vim configuration files:
echo 'eval "$(oh-my-posh --init --shell zsh --config ~/jandedobbeleer.omp.json)"' >> ~/.zshrc
echo 'eval "$(oh-my-posh --init --shell bash --config ~/jandedobbeleer.omp.json)"' >> ~/.bashrc

git clone --depth 1 https://github.com/liuchengxu/space-vim.git ~/.space-vim
cat << EOF > /root/.spacevim
let g:spacevim_plug_home = '~/.vim/plugged'
let g:spacevim_leader = "<\Space>"
let g:spacevim_localleader = ','

" Refer to https://github.com/liuchengxu/space-vim/blob/master/layers/LAYERS.md for all available layers.
let g:spacevim_layers = [
      \ 'better-defaults', 
      \ 'c-c++', 'clojure', 'graphviz', 'html', 'java', 'javascript', 'markdown', 'python', 'typescript', 'wasm',
      \ 'editing', 'programming',
      \ 'airline',
      \ 'file-manager', 'fzf', 'lsp', 'tmux',
      \ 'git', 'github',
      \ 'better-motion', 'text-align', 'which-key',
      \ ]

let g:spacevim_enable_true_color = 1
let g:spacevim_nerd_fonts = 1

" If you want to have more control over the layer, try using Layer command.
" if g:spacevim.gui
"   Layer 'airline'
" endif

" Manage your own plugins.
" Refer to https://github.com/junegunn/vim-plug for more detials.
function! UserInit()

  " Add your own plugin via Plug command.
  Plug 'junegunn/seoul256.vim'

endfunction

" Override the default settings from space-vim as well as adding extras
function! UserConfig()

  " Override the default settings.
  " Uncomment the following line to disable relative number.
  set norelativenumber

  " Adding extras.
  " Uncomment the following line If you have installed the powerline fonts.
  " It is good for airline layer.
  let g:airline_powerline_fonts = 1

  " Highlight long lines
  highlight rightMargin ctermfg=red
  match rightMargin /.\%>100v/
endfunction
EOF
cd ~/.space-vim && make neovim && cd /tmp

cat << EOF > /root/.gitconfig
[core]
	editor = nvim
	warnAmbiguousRefs = true
[push]
	default = simple
[pull]
	rebase = true
[pager]
	diff = delta
	log = delta
	reflog = delta
	show = delta
[interactive]
	diffFilter = delta --color-only --features=interactive
[delta]
	features = decorations
[delta "interactive"]
	keep-plus-minus-markers = false
[delta "decorations"]
	commit-decoration-style = blue ol
	commit-style = raw
	file-style = omit
	hunk-header-decoration-style = blue box
	hunk-header-file-style = red
	hunk-header-line-number-style = "#067a00"
	hunk-header-style = file line-number syntax
[merge]
	keepBackup = false
	tool = nvim
[mergetool "nvim"]
	path = /usr/bin/nvim -d
	conflictstyle = diff3
	prompt = false
	keepTemporaries = false
	keepBackup = false
[rerere]
	enabled = true
[color]
	ui = auto
[alias]
	lscfg = config -l

	rv = remote -v

	cl = clone
	cloner = clone --recursive

	ci = commit
	cs = commit -S

	co = checkout
	cob = checkout -b
	com = checkout master
	cod = checkout develop

	st = status

	br = branch
	brlocaloneline = !git branch | grep -v \\* | xargs
	brdeletelocal = !git branch -D `git brlocaloneline` || echo "Nothing to delete"

	;; brsync deletes all local branches and refetches all remotes!
	brsync = !git com && git brdeletelocal && git fetcha

	fetchp = fetch --prune
	fetcha = fetch --all

	spull = !git pull && git submodule sync --recursive && git submodule update --init --recursive
	sspull = !git pull && git submodule update --init --recursive --remote
	pullr = pull --rebase

	pushf = push --force-with-lease

	dc = diff --cached
	df = diff
	ds = diff --staged

	dt = difftool
	mt = mergetool

	lg = log -p --abbrev-commit --date=relative
	lgs = log --pretty=format:'%C(yellow)%h%Creset %s %C(bold blue)<%ae>%Creset %Cgreen(%cr)'
	lgn = log --numstat --pretty=format:'%C(yellow)%h%Creset %s %C(bold blue)<%ae>%Creset %Cgreen(%cr)'
	lol = log --graph --decorate --abbrev-commit --pretty=format:'%C(yellow)%h%Creset %s %C(bold blue)<%ae>%Creset %Cgreen(%cr)'
	lola = log --graph --all --decorate --abbrev-commit --pretty=format:'%C(yellow)%h%Creset %s %C(bold blue)<%ae>%Creset %Cgreen(%cr)'

	ls = ls-files
	ignored = ls-files -o -i --exclude-standard

	unstage = reset HEAD
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
EOF

# Provide a script to start a X11 virtual framebuffer to run tests in Chrome.
cat << EOF > /usr/local/bin/xvfb-1080p.sh
#!/bin/bash
Xvfb :99 -screen 0 1920x1080x24 &
EOF

# Install NPM-based tools incl Lumo and Karma CLI:
echo "Installing Lumo and Karma CLI..."
npm install -g --unsafe-perm \
  lumo-cljs@$LUMO_VERSION \
  karma-cli@$KARMA_CLI_VERSION \
  typescript@$TYPESCRIPT_VERSION

# Strip binaries of debugging symbols that are not stripped already so save
# some space:
strip --strip-unneeded \
    /usr/bin/git-lfs \
    /usr/local/bin/docker \
    /usr/local/bin/dockerd \
    /usr/local/bin/docker-proxy