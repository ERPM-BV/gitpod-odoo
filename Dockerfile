FROM gitpod/workspace-postgres
                    
USER root

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/


# Other requirements and recommendations
# See https://github.com/$ODOO_SOURCE/blob/$ODOO_VERSION/debian/control
RUN apt-get -qq update \
    && apt-get install -yqq \
        curl
RUN curl -SLo wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb
RUN apt-get install -yqq \
        ./wkhtmltox.deb
RUN apt-get install -yqq \
        fonts-liberation2 \
        gettext \
        git \
        gnupg2 \
        nano \
        npm \
        openssh-client \
        telnet \
        vim \
        build-essential \
        ldap-utils \
        tox \
        wget \ 
        libzip-dev \
        node-less \
        libpng-dev \
        gdebi \
        build-essential \
        python-dev \
        libssl-dev \
        libfreetype6-dev \
        libfribidi-dev \
        libghc-zlib-dev \
        libharfbuzz-dev \
        libjpeg-dev \
        liblcms2-dev \
        libldap2-dev \
        libopenjp2-7-dev \
        libpq-dev \
        libsasl2-dev \
        libtiff5-dev \
        libwebp-dev \
        libxml2-dev \
        libxslt-dev \
        tcl-dev \
        tk-dev \
        zlib1g-dev
RUN apt-get update 
RUN npm install -g rtlcss
# Install Odoo hard & soft dependencies, and Doodba utilities
RUN pip install \
        -r https://raw.githubusercontent.com/odoo/odoo/16.0/requirements.txt \
        'websocket-client~=0.56' \
        astor \
        debugpy \
        pydevd-odoo \
        geoip2 \
        inotify \
        pdfminer.six \
        pg_activity \
        phonenumbers \
        plumbum \
        pudb \
        pyOpenSSL \
        python-magic \
        num2words \
        ofxparse \
        dbfread \
        firebase_admin \
        psycopg2-binary
RUN npm install -g less \
    npm install -g less-plugin-clean-css
USER gitpod
