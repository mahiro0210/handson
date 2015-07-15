; cPanel first:11.25.0-NIGHTLY_43357 latest:11.25.0-NIGHTLY_43357 Cpanel::ZoneFile::VERSION:1.3 mtime:1414367349 hostname:www.hostingnow.jp
; Zone file for asahi-ekiden.com
$TTL 14400
asahi-ekiden.com.       86400   IN      SOA     ns1.hostingnow.jp.      rs.cuon.co.jp.(
                                                2014102602 ;Serial Number
                                                86400 ;refresh
                                                7200 ;retry
                                                3600000 ;expire
                                                86400 ;minimum
        )
asahi-ekiden.com.       86400   IN      NS      ns1.hostingnow.jp.
asahi-ekiden.com.       86400   IN      NS      ns2.hostingnow.jp.
asahi-ekiden.com.       14400   IN      A       111.171.222.175
localhost       14400   IN      A       127.0.0.1
asahi-ekiden.com.       14400   IN      MX      0       asahi-ekiden.com.
mail    14400   IN      CNAME   asahi-ekiden.com.
www     14400   IN      CNAME   asahi-ekiden.com.
ftp     14400   IN      CNAME   asahi-ekiden.com.
measure 300     IN      A       111.171.222.175
www1    300     IN      A       111.171.222.28

