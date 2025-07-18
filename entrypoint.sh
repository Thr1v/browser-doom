#!/bin/sh

export DISPLAY=:0
export SDL_AUDIODRIVER=dummy
export SDL_VIDEODRIVER=x11
export SDL_RENDER_DRIVER=software

# Start virtual X server with 24-bit color (better for SDL/fps)
Xvfb :0 -screen 0 1024x768x24 & 
sleep 2

# Start lightweight window manager
fluxbox & 
sleep 2

# Optional: hide the mouse pointer
unclutter -idle 0.1 &

# Reduce polling & CPU load from VNC
x11vnc -display :0 -noxdamage -repeat -nopw -forever -shared -rfbport 5900 & 
sleep 2

# Start noVNC (websockify)
cd /opt/novnc
nohup ./utils/websockify/run 6080 --web /opt/novnc localhost:5900 > /var/log/websockify.log 2>&1 &

# Wait for X to be ready
until xdpyinfo -display :0 > /dev/null 2>&1; do
  echo "Waiting for X server..."
  sleep 1
done

# Crispy Doom config (with higher internal frame cap)
mkdir -p /root/.local/share/crispy-doom
cat > /root/.local/share/crispy-doom/crispy-doom.cfg <<EOF
use_mouse 1
mouse_sensitivity 2.0
vanilla_mouse 0
fullscreen 1
screen_resolution 1024x768
cap_fps 1
EOF

# Run DOOM
/usr/games/crispy-doom -iwad /root/DOOM.WAD -nosound -geometry 1024x768 -fullscreen -grabmouse -extratics 2

# Keep container running
tail -f /dev/null
