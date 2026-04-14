#!/bin/bash

cat <<EOF > /var/www/index.html
<html>
  <head><title>Cloud Monitor</title></head>
  <body style="font-family: sans-serif; text-align: center; margin-top: 50px;">
    <h1 style="color: #2ecc71;">Cloud Monitor Status: ACTIVE</h1>
    <div style="background: #f3f3f3; display: inline-block; padding: 20px; border-radius: 10px;">
      <p><b>Hostname:</b> $(hostname)</p>
      <p><b>System Time:</b> $(date)</p>
    </div>
  </body>
</html>
EOF

echo "Starting web server on port 80..."
cd /var/www && python3 -m http.server 80
