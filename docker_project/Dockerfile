FROM internetsystemsconsortium/bind9:9.18

RUN ln -sf /dev/stdout /var/log/bind/transfers \
    && ln -sf /dev/stdout /var/log/bind/transfers \
    && ln -sf /dev/stderr /var/log/bind/notify \
    && ln -sf /dev/stderr /var/log/bind/dnssec \
    && ln -sf /dev/stderr /var/log/bind/query \
    && ln -sf /dev/stderr /var/log/bind/general
