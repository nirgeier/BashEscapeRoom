FROM    ubuntu:22.04

USER root

RUN \
    apt update      &&      \
    apt upgrade -y  &&      \
    apt autoremove -y  &&   \
    apt install -y          \
    apt-utils               \
    attr                    \
    cowsay                  \
    man                     \
    sudo                    \
    vim                     \
    curl


# -------------------------------------------------------------------
# Install rooms required tools
# -------------------------------------------------------------------
# Download the installation script of nodejs (latest version)
RUN     curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Install Node.js
RUN                     \
    apt install -y      \
    attr                \
    build-essential     \
    nodejs              \
    shc                 \
    zip                 

# Install the required library for the obfuscating
RUN     sudo npm -g install javascript-obfuscator

# -------------------------------------------------------------------
# End of rooms required tools
# -------------------------------------------------------------------

### Create users 
RUN \
    useradd -ms /bin/bash escape && \
    echo    "root:escaperoom"   | chpasswd && \
    echo    "escape:escape"     | chpasswd && \
    adduser escape sudo 

WORKDIR /home/escape

# Copy the desired content
COPY    escapeRoom escapeRoom
COPY    initEscapeRoom.sh .

# Init the room puzzle
RUN     chmod 755 initEscapeRoom.sh
RUN     ./initEscapeRoom.sh
RUN     rm initEscapeRoom.sh

# Switch to the escape user
USER    escape

COPY    --chmod=705 entrypoint.sh .
CMD     [ "./entrypoint.sh"]
