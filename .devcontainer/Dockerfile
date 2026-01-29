# Master Thesis Development Container
# Full LaTeX environment with Zotero integration

FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Avoid prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install LaTeX full distribution and additional tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Full LaTeX distribution
    texlive-full \
    # Additional LaTeX tools
    latexmk \
    chktex \
    # PDF utilities
    poppler-utils \
    # For latexindent perl dependencies
    libfile-homedir-perl \
    libyaml-tiny-perl \
    liblog-log4perl-perl \
    libunicode-linebreak-perl \
    # Build essentials for potential compilation needs
    build-essential \
    # Python for potential scripts
    python3 \
    python3-pip \
    python3-pygments \
    # Spell checking
    aspell \
    aspell-en \
    aspell-de \
    # Additional utilities
    curl \
    wget \
    gnupg \
    software-properties-common \
    xdg-utils \
    # For Zotero
    libdbus-glib-1-2 \
    libgtk-3-0 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    && rm -rf /var/lib/apt/lists/*

# Install Zotero
RUN curl -sL "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" -o /tmp/zotero.tar.bz2 \
    && mkdir -p /opt/zotero \
    && tar -xjf /tmp/zotero.tar.bz2 -C /opt/zotero --strip-components=1 \
    && rm /tmp/zotero.tar.bz2 \
    && ln -s /opt/zotero/zotero /usr/local/bin/zotero \
    && /opt/zotero/set_launcher_icon

# Create desktop entry for Zotero
RUN mkdir -p /usr/share/applications \
    && echo '[Desktop Entry]\n\
Name=Zotero\n\
Comment=Open-source reference management\n\
Exec=/opt/zotero/zotero\n\
Icon=/opt/zotero/chrome/icons/default/default256.png\n\
Type=Application\n\
Categories=Office;Education;\n\
StartupNotify=true' > /usr/share/applications/zotero.desktop

# Install Better BibTeX for Zotero (will be configured on first run)
# Note: Better BibTeX needs to be installed manually through Zotero UI
# or pre-configured via Zotero's extensions directory

# Set up locale for LaTeX
RUN apt-get update && apt-get install -y locales \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Configure git for submodules
RUN git config --system init.defaultBranch main \
    && git config --system submodule.recurse true

# Ensure vscode user has proper permissions
USER vscode
