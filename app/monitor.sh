#!/bin/bash

cat <<EOF > /var/www/index.html
<html>
  <body>
    <h1>Cloud Monitor Status: ACTIVE</h1>
    <p>Hostname: $(hostname)</p>
    <p>System Time: $(date)</p>
  </body>
</html>
EOF

exec sleep infinity
