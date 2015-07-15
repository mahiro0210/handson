; cPanel first:11.25.0-RELEASE_43473 latest:11.25.0-NIGHTLY_43357 Cpanel::ZoneFile::VERSION:1.3 mtime:1289045806 hostname:www.hostingnow.jp
; Zone file for cuonlab.com
$TTL 14400
cuonlab.com.    86400   IN      SOA     ns3.value-domain.com.   rs.cuon.co.jp.  (
                                                2010110604 ;Serial Number
                                                86400 ;refresh
                                                7200 ;retry
                                                3600000 ;expire
                                                86400 ;minimum
        )

cuonlab.com.    86400   IN      NS      ns3.value-domain.com.
cuonlab.com.    86400   IN      NS      ns1.value-domain.com.
cuonlab.com.    86400   IN      NS      ns2.value-domain.com.


cuonlab.com.    14400   IN      A       112.78.199.218

localhost       14400   IN      A       127.0.0.1

cuonlab.com.    14400   IN      MX      0       cuonlab.com.

mail    14400   IN      CNAME   cuonlab.com.
www     14400   IN      CNAME   cuonlab.com.
ftp     14400   IN      A       112.78.199.218

