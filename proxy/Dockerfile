FROM nginx

RUN apt-get update && apt-get install -y \
    build-essential \
    libpcre3-dev \
    libssl-dev \
    libkrb5-dev \
    wget \
    git \
    zlib1g-dev \
    krb5-multidev \
    libkrb5-dev \
    heimdal-multidev \
    libldap2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN wget http://nginx.org/download/nginx-1.25.4.tar.gz
RUN tar -xzf nginx-1.25.4.tar.gz

RUN git clone https://github.com/stnoonan/spnego-http-auth-nginx-module.git nginx-1.25.4/spnego-http-auth-nginx-module
RUN git clone https://github.com/kvspb/nginx-auth-ldap nginx-1.25.4/nginx-auth-ldap

RUN cd nginx-1.25.4 && ./configure --add-dynamic-module=spnego-http-auth-nginx-module --add-dynamic-module=nginx-auth-ldap --with-compat && make install

RUN cp /usr/src/nginx-1.25.4/objs/*.so /etc/nginx/modules/

RUN rm -rf /usr/src/nginx-1.25.4.tar.gz /usr/src/nginx-1.25.4 /usr/src/nginx-1.25.4/spnego-http-auth-nginx-module /usr/src/nginx-1.25.4/nginx-auth-ldap
