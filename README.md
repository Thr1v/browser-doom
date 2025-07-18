# Doom in the Browser with VNC + Crispy Doom

Run the classic **DOOM** inside your web browser using a VNC-enabled Docker container powered by Crispy Doom and noVNC!

> ⚠️ No copyrighted game files are included. You must legally own DOOM to supply your own WAD file.

---

## 🎮 Features

- Runs DOOM inside a Dockerized Linux desktop via X11 and Fluxbox
- Plays directly in your browser using noVNC
- Supports fullscreen, mouse input, and keyboard
- Uses [Crispy Doom](https://github.com/fabiangreffrath/crispy-doom) for enhanced but faithful rendering
- No installation on host required — everything runs in Docker

---

## 🚀 Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/Thr1v/browser-doom
cd web-doom-vnc
```
2. Add the DOOM.WAD
You must supply your own copy of DOOM.WAD, obtained legally. You can purchase the game from:

Steam: Ultimate DOOM

GOG.com: Ultimate DOOM

Once downloaded, copy your DOOM.WAD file into the project root:
```
web-doom-vnc/
├── DOOM.WAD  ← You add this
├── Dockerfile
├── docker-compose.yml
├── entrypoint.sh
└── README.md
✅ Only the original DOOM/Ultimate DOOM (DOOM.WAD) is supported.
```
3. Build & Run the Container
```bash
docker compose up --build
Then open your browser and go to:
```
http://localhost:6080
You’ll see a graphical desktop, and DOOM will launch automatically!

🧱 Project Structure
File	Purpose
Dockerfile	Sets up Debian + Crispy Doom
entrypoint.sh	Starts X11, VNC, and launches DOOM
docker-compose.yml	Maps ports and builds the container
README.md	You're reading it!

❓ FAQ
Q: Why can’t I find DOOM.WAD in this repo?
A: It's copyrighted content. You must own a legitimate copy.

Q: Mouse aiming is jittery or too fast.
A: Try adjusting the mouse_sensitivity value in entrypoint.sh or use keyboard-only controls.

Q: Can I use other WADs like DOOM2.WAD?
A: Yes! Just rename or modify the launch command in entrypoint.sh.

🧼 To Clean Up
```bash
sudo docker system prune -a --volumes -f # clean up unused Docker resources
sudo docker-compose down --volumes  # optional cleanup
sudo docker-compose build --no-cache
sudo docker-compose up
```
