#!/bin/bash

# THE GRID - A Terminal Netrunner Campaign
# https://github.com/rdmorris/terminal-dungeon
#
# A sibling to the fantasy Terminal Dungeon. You step through the
# dragon's portal into THE GRID: a simulated network of Unix hosts.
# Pivot from machine to machine using REAL command-line skills -
# recon, log forensics, credential hunting, privilege escalation.
#
# 100% self-contained and safe. Every "host" is a directory. Nothing
# touches a real network. This is your own lab - ethical CTF only.
#
# Usage: ./setup-grid.sh
# Then:  cd the_grid && cat README.txt

if [ -d the_grid ]; then
  echo "⚠️  A the_grid already exists here."
  read -r -p "Wipe it and redeploy? [y/N] " answer
  case "$answer" in
    [yY]*) chmod -R u+rwx the_grid 2>/dev/null; rm -rf the_grid; echo "🧹 Grid wiped." ;;
    *) echo "Keeping existing grid. Enter with: cd the_grid"; exit 0 ;;
  esac
fi

echo "🌐 Booting THE GRID..."

mkdir -p the_grid
cd the_grid || exit 1
mkdir -p .state

# =========================================================
# README / MISSION BRIEF
# =========================================================
cat > README.txt << 'EOF'
╔══════════════════════════════════════════════════════════╗
║                     T H E   G R I D                      ║
║              A Terminal Netrunner Campaign               ║
╚══════════════════════════════════════════════════════════╝

You defeated the dragon. Behind it stood a shimmering PORTAL -
not to another castle, but to a NETWORK. A grid of machines
stretching into the dark.

You are a NETRUNNER now. Your goal: reach admin_core, the
machine at the heart of the grid, by HOPPING from host to host.

You cannot jump straight there. Each machine is locked. To reach
the next one you must:
   1. RECON   - explore the host, read its files and logs
   2. LOOT    - find a credential (a password, a key, a token)
   3. PIVOT   - use it to connect to the next host

THE MAP (as far as you know):
   jumpbox      (you are here)  ── your entry point
     └─> gateway     10.0.0.1   ── the way in
           └─> webserver  10.0.0.2
                 └─> db_host   10.0.0.3
                       └─> admin_core  10.0.0.254  ★ THE TARGET

YOUR STARTING SKILLS:  ls · cd · cat · grep · base64
YOU WILL LEARN:        grep -r · tr/ROT13 · cut/awk · chmod · ps/kill

HELP FILES:
   cat FIELD_MANUAL.txt   - command reference
   cat HINTS.txt          - stuck? read this

⚡ OPTIONAL - make the grid come ALIVE (hosts react as you land):
   source enter_grid.sh

Begin:  cd jumpbox  &&  cat mission.txt

⚠️  ETHICS: This is a SIMULATED lab you own. The skills are real;
    the targets are fake. Never point these techniques at systems
    you don't have explicit permission to test.
EOF

cat > FIELD_MANUAL.txt << 'EOF'
📟 NETRUNNER FIELD MANUAL 📟

RECON (looking around):
  ls -la              list everything, including hidden + permissions
  cat file            read a file
  less file           read a long file (q to quit)
  find . -name "*.log"  locate files by name

SEARCHING (the netrunner's #1 skill):
  grep "word" file        search inside one file
  grep -r "word" .        search EVERY file in EVERY subdirectory
  grep -ri "word" .       ...case-insensitive
  grep -c "word" file     count matches

LOG FORENSICS:
  cut -d: -f1 file            take field 1, splitting on ":"
  awk '{print $1}' file       take the 1st whitespace column
  sort file | uniq -c         count how often each line appears
  sort -rn                    sort by number, biggest first
  (combine: find the IP that hit you most → the attacker!)

DECODING LOOT:
  echo "SGk=" | base64 -d     decode base64
  echo "uryyb" | tr 'A-Za-z' 'N-ZA-Mn-za-m'   decode ROT13
  # ROT13 shifts each letter 13 places - a classic scrambler.

PERMISSIONS (they leak secrets!):
  chmod 600 id_rsa    lock a private key to owner-only
  ls -l               a file that's readable by everyone = a leak
  (real ssh REFUSES to use a key that others can read!)

PROCESSES:
  ps / cat proc_table   see what's running
  kill <PID>            stop a process by its ID

PIVOTING:
  ./connect.sh          from any host, run this to reach the next one
EOF

cat > HINTS.txt << 'EOF'
💡 STUCK? PROGRESSIVE HINTS 💡
(Read only as far as you need - don't spoil it!)

═══ GATEWAY (→ webserver) ═══
1. Someone left a config file readable by everyone. ls -la the etc/ folder.
2. The webserver password is inside it, but base64-encoded.
3. Decode:  grep -i pass etc/webserver.conf | cut -d= -f2 | base64 -d
4. Run ./connect.sh and give that password.

SIDE QUEST on gateway: who attacked this box the most?
   cat var/log/auth.log | grep Failed | awk '{print $NF}' | sort | uniq -c | sort -rn

═══ WEBSERVER (→ db_host) ═══
1. The app writes MANY log files. Don't read them one by one!
   cd var/log/app && grep -r "db_host" .
2. That reveals the database hostname AND a ROT13-scrambled key.
3. Decode ROT13:  echo "<the scrambled key>" | tr 'A-Za-z' 'N-ZA-Mn-za-m' 
4. There's also an SSH key in home/deploy/.ssh - but its permissions
   are too open. ls -l it. (Lesson: real ssh rejects world-readable keys.)
5. ./connect.sh with the decoded key.

═══ DB_HOST (→ admin_core) ═══
1. A database dump sits here: dump.sql. Find the admin row.
   grep -i admin dump.sql
2. Pull the password field:  grep -i admin dump.sql | cut -d'|' -f3
3. It's base64. Decode it.
4. KEY INSIGHT: admins reuse passwords. The db admin password
   ALSO works on admin_core. (This is why password reuse is dangerous!)

═══ ADMIN_CORE (★ THE BOSS) ═══
1. A firewall daemon blocks your final move. See it: cat proc_table.txt
2. Find the PID of the "firewall_daemon" process.
3. Take it down:  ./kill_firewall.sh <PID>
4. Then run ./breach.sh and give the admin credential.
5. You own the grid.
EOF

# =========================================================
# LIVING GRID (optional reactive hook) - same engine as the dungeon
# =========================================================
cat > enter_grid.sh << 'OUTER_EOF'
#!/bin/bash
# 🌐 THE LIVING GRID - source this: source enter_grid.sh

if [ -n "$BASH_VERSION" ] && [ "${BASH_SOURCE[0]}" = "$0" ]; then
  echo "⚠️  This must be SOURCED, not run:"
  echo "      source enter_grid.sh"
  echo "Running it starts a throwaway child shell; sourcing runs it in YOURS."
  exit 1
fi

if [ -n "$BASH_VERSION" ]; then
  export GRID_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  export GRID_ROOT="$(cd "$(dirname "${(%):-%N}")" && pwd)"
fi
mkdir -p "$GRID_ROOT/.state"
__grid_last_pwd=""

__grid_hook() {
  [ "$PWD" = "$__grid_last_pwd" ] && return
  __grid_last_pwd="$PWD"
  case "$PWD/" in
    "$GRID_ROOT"/*)
      [ -f "$PWD/.host" ] && GRID_ROOT="$GRID_ROOT" bash "$PWD/.host"
      ;;
  esac
}

# A handy 'scan' command that shows network status from real state
scan() {
  echo "📡 NETWORK SCAN — reachable hosts:"
  local st="$GRID_ROOT/.state"
  printf '  %-14s %-12s %s\n' "HOST" "IP" "STATUS"
  printf '  %-14s %-12s %s\n' "jumpbox"    "-"          "[you]"
  printf '  %-14s %-12s %s\n' "gateway"    "10.0.0.1"   "OPEN"
  printf '  %-14s %-12s %s\n' "webserver"  "10.0.0.2"   "$([ -f "$st/pwned_webserver" ] && echo OWNED || echo LOCKED)"
  printf '  %-14s %-12s %s\n' "db_host"    "10.0.0.3"   "$([ -f "$st/pwned_db_host" ] && echo OWNED || echo LOCKED)"
  printf '  %-14s %-12s %s\n' "admin_core" "10.0.0.254" "$([ -f "$st/pwned_admin_core" ] && echo OWNED || echo LOCKED)"
}

leave_grid() {
  if [ -n "$ZSH_VERSION" ]; then chpwd_functions=(${chpwd_functions:#__grid_hook})
  else PROMPT_COMMAND="${PROMPT_COMMAND//__grid_hook;/}"; PROMPT_COMMAND="${PROMPT_COMMAND//__grid_hook/}"; fi
  unset GRID_ROOT __grid_last_pwd; unset -f __grid_hook scan leave_grid
  echo "🔌 Disconnected from the living grid."
}

if [ -n "$ZSH_VERSION" ]; then
  chpwd_functions+=(__grid_hook)
else
  case ";$PROMPT_COMMAND;" in
    *";__grid_hook;"*) : ;;
    *) PROMPT_COMMAND="__grid_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}" ;;
  esac
fi

echo "🌐 JACKED IN. Hosts will respond as you land on them."
echo "   Try 'scan' to see the network. Undo with 'leave_grid'."
__grid_hook
OUTER_EOF
chmod +x enter_grid.sh

# =========================================================
# HOST 0: JUMPBOX (start)
# =========================================================
mkdir -p jumpbox
cat > jumpbox/motd.txt << 'EOF'
┌────────────────────────────────────────────┐
│  jumpbox ~ your entry terminal              │
│  "Every run starts somewhere small."        │
└────────────────────────────────────────────┘
EOF

cat > jumpbox/mission.txt << 'EOF'
📥 MISSION BRIEF 📥

Netrunner, you're in. This jumpbox is your safe house.

Somewhere out there is admin_core - the machine that controls
the whole grid. You can't reach it directly. You'll pivot:
  gateway → webserver → db_host → admin_core

The gateway (10.0.0.1) is already reachable. Head there:
  cd ../gateway
  cat banner.txt

Read FIELD_MANUAL.txt (in the grid root) whenever you need a command.
Good hunting.
EOF

cat > jumpbox/.host << 'OUTER_EOF'
#!/bin/bash
if [ ! -f "$GRID_ROOT/.state/seen_jumpbox" ]; then
  touch "$GRID_ROOT/.state/seen_jumpbox"
  echo "🖥️  jumpbox online. Type 'scan' to map the network, then: cd ../gateway"
else
  echo "🖥️  jumpbox ~ home sweet home. ('scan' shows your progress.)"
fi
OUTER_EOF

# =========================================================
# HOST 1: GATEWAY (10.0.0.1)  -- base64 + log recon
# =========================================================
mkdir -p gateway/etc gateway/var/log
cat > gateway/banner.txt << 'EOF'
*** gateway 10.0.0.1 - AUTHORIZED USERS ONLY ***
(whoever set that up also forgot to lock down /etc ... ls -la)
EOF

cat > gateway/README.txt << 'EOF'
gateway host — the edge of the grid.

Your job: find the credential for the WEBSERVER (10.0.0.2)
and pivot with ./connect.sh

Recon tips:
  ls -la etc/           someone may have left a config too open
  cat var/log/auth.log  who's been knocking on this door?
EOF

# world-readable config leaking the webserver password (base64)
# password = "n30n_gr1d" -> base64
WEB_PW_B64=$(printf 'n30n_gr1d' | base64)
cat > gateway/etc/webserver.conf << EOF
# webserver deploy config  (TODO: fix permissions!!)
host=10.0.0.2
service=nginx
# encoded so it's "not plaintext" (this is NOT security, netrunner...)
deploy_password=${WEB_PW_B64}
EOF
chmod 644 gateway/etc/webserver.conf   # readable by everyone = the leak

# an auth.log with a sort|uniq -c side puzzle (attacker IP appears most)
{
  for i in $(seq 1 8);  do echo "May 12 03:1$i sshd[91$i]: Failed password for root from 10.0.0.2 port 511$i"; done
  for i in $(seq 1 20); do echo "May 12 03:2$i sshd[92$i]: Failed password for admin from 45.66.13.201 port 522$i"; done
  for i in $(seq 1 5);  do echo "May 12 03:3$i sshd[93$i]: Failed password for deploy from 10.0.0.9 port 533$i"; done
  echo "May 12 03:40 sshd[9400]: Accepted password for deploy from 10.0.0.9 port 5401"
} > gateway/var/log/auth.log

cat > gateway/connect.sh << 'OUTER_EOF'
#!/bin/bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "🔌 Connecting to webserver (10.0.0.2)..."
read -r -s -p "deploy_password: " pw; echo
if [ "$pw" = "n30n_gr1d" ]; then
  chmod 755 "$ROOT/webserver" 2>/dev/null
  mkdir -p "$ROOT/.state" && touch "$ROOT/.state/pwned_webserver"
  echo "✅ ACCESS GRANTED. webserver is now reachable."
  echo "   Pivot in:  cd ../webserver"
else
  echo "❌ ACCESS DENIED."
  echo "   Hint: the password is base64-encoded in etc/webserver.conf"
  echo "         grep -i pass etc/webserver.conf | cut -d= -f2 | base64 -d"
fi
OUTER_EOF
chmod +x gateway/connect.sh

cat > gateway/.host << 'OUTER_EOF'
#!/bin/bash
st="$GRID_ROOT/.state"
if [ -f "$st/pwned_webserver" ]; then
  echo "🟢 gateway 10.0.0.1 — already owned. Pivot onward: cd ../webserver"
elif [ ! -f "$st/seen_gateway" ]; then
  touch "$st/seen_gateway"
  echo "🔓 gateway 10.0.0.1 — you're in. Recon it: ls -la etc/ (something's too open...)"
else
  echo "🔓 gateway 10.0.0.1 — find the webserver password, then ./connect.sh"
fi
OUTER_EOF

# =========================================================
# HOST 2: WEBSERVER (10.0.0.2)  -- grep -r logs + rot13 + key perms
# =========================================================
mkdir -p webserver/var/log/app webserver/home/deploy/.ssh
cat > webserver/banner.txt << 'EOF'
*** webserver 10.0.0.2 (nginx) ***
Loud app. Writes a LOT of logs. Good place to hide a secret in plain sight.
EOF

cat > webserver/notes.txt << 'EOF'
webserver host — you're deeper now.

Goal: find the credential for db_host (10.0.0.3), then ./connect.sh

Recon tips:
  cd var/log/app  &&  grep -r "db_host" .   (don't read 20 logs by hand!)
  ...the key next to it is ROT13-scrambled - unscramble with tr.
  ls -l home/deploy/.ssh/                   (is that key too exposed?)
EOF

# 20 noisy app logs; one buried line leaks db_host + a hex-encoded key
for i in $(seq -w 1 20); do
  {
    echo "[info] request served 200 /index"
    echo "[info] cache hit ratio 0.9$i"
    echo "[debug] gc pause 12ms"
  } > "webserver/var/log/app/app_${i}.log"
done
# db key = "cyph3r_key" -> ROT13 ("plcu3e_xrl"). tr is always installed; xxd often isn't.
DB_KEY_ROT=$(printf 'cyph3r_key' | tr 'A-Za-z' 'N-ZA-Mn-za-m')
cat >> webserver/var/log/app/app_13.log << EOF
[error] db connection failed host=db_host(10.0.0.3)
[error] retrying with cached key (rot13): ${DB_KEY_ROT}
EOF

# an SSH private key left world-readable (the perms lesson)
cat > webserver/home/deploy/.ssh/id_rsa << 'EOF'
-----BEGIN OPENSSH PRIVATE KEY-----
(this is a fake practice key - not a real one)
b3BlbnNzaC1rZXktdjE=  ... snip ...
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 644 webserver/home/deploy/.ssh/id_rsa   # too open! ssh would reject this
cat > webserver/home/deploy/.ssh/README.txt << 'EOF'
⚠️  ls -l id_rsa  — notice it's readable by EVERYONE (rw-r--r--).
Real ssh refuses keys like this ("UNPROTECTED PRIVATE KEY").
A tidy netrunner locks it down:  chmod 600 id_rsa
(For THIS pivot you don't need the key file itself - the db key
 is the hex string hiding in the app logs. But fixing perms is
 good hygiene, and you'll be quizzed on it someday.)
EOF

cat > webserver/connect.sh << 'OUTER_EOF'
#!/bin/bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "🔌 Connecting to db_host (10.0.0.3)..."
read -r -p "decoded db key: " key
if [ "$key" = "cyph3r_key" ]; then
  chmod 755 "$ROOT/db_host" 2>/dev/null
  mkdir -p "$ROOT/.state" && touch "$ROOT/.state/pwned_db_host"
  echo "✅ ACCESS GRANTED. db_host is now reachable."
  echo "   Pivot in:  cd ../db_host"
else
  echo "❌ ACCESS DENIED."
  echo "   Hint: grep -r the app logs for 'db_host', grab the rot13 key, then:"
  echo "         echo '<key>' | tr 'A-Za-z' 'N-ZA-Mn-za-m'"
fi
OUTER_EOF
chmod +x webserver/connect.sh

cat > webserver/.host << 'OUTER_EOF'
#!/bin/bash
st="$GRID_ROOT/.state"
if [ -f "$st/pwned_db_host" ]; then
  echo "🟢 webserver 10.0.0.2 — owned. Onward: cd ../db_host"
elif [ ! -f "$st/seen_webserver" ]; then
  touch "$st/seen_webserver"
  echo "🔓 webserver 10.0.0.2 — 20 log files here. grep -r beats reading them!"
else
  echo "🔓 webserver 10.0.0.2 — decode the db key from the logs, then ./connect.sh"
fi
OUTER_EOF

# =========================================================
# HOST 3: DB_HOST (10.0.0.3)  -- cut/awk parsing + password reuse
# =========================================================
mkdir -p db_host
cat > db_host/banner.txt << 'EOF'
*** db_host 10.0.0.3 (postgres) ***
The crown jewels live here: a full user table dump. And admins... reuse passwords.
EOF

cat > db_host/notes.txt << 'EOF'
db_host — nearly there.

Goal: recover the ADMIN password from dump.sql. The same password
opens admin_core (password reuse is a real-world sin). Then ./connect.sh.

Recon tips:
  grep -i admin dump.sql
  grep -i admin dump.sql | cut -d'|' -f3   (pull the password field)
EOF

# users dump; admin password "r00t_0f_all" base64-encoded in field 3
ADMIN_PW_B64=$(printf 'r00t_0f_all' | base64)
cat > db_host/dump.sql << EOF
-- pg_dump users table (id | username | password_b64 | role)
1 | guest    | Z3Vlc3Q=            | readonly
2 | deploy   | ZGVwbG95X3B3          | deploy
3 | jsmith   | aHVudGVyMg==          | user
4 | admin    | ${ADMIN_PW_B64}  | superuser
5 | backup   | YmFja3Vwcm90b2NvbA==  | service
EOF

cat > db_host/connect.sh << 'OUTER_EOF'
#!/bin/bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
echo "🔌 Connecting to admin_core (10.0.0.254)..."
echo "   (admins reuse passwords... try the one you just recovered)"
read -r -s -p "admin password: " pw; echo
if [ "$pw" = "r00t_0f_all" ]; then
  chmod 755 "$ROOT/admin_core" 2>/dev/null
  mkdir -p "$ROOT/.state" && touch "$ROOT/.state/pwned_admin_core_reached" "$ROOT/.state/admin_pw_ok"
  echo "✅ CREDENTIAL ACCEPTED. admin_core is reachable — but GUARDED."
  echo "   Pivot in:  cd ../admin_core   (a firewall daemon awaits...)"
else
  echo "❌ ACCESS DENIED."
  echo "   Hint: grep -i admin dump.sql | cut -d'|' -f3 | base64 -d"
fi
OUTER_EOF
chmod +x db_host/connect.sh

cat > db_host/.host << 'OUTER_EOF'
#!/bin/bash
st="$GRID_ROOT/.state"
if [ -f "$st/admin_pw_ok" ]; then
  echo "🟢 db_host 10.0.0.3 — owned. The core awaits: cd ../admin_core"
elif [ ! -f "$st/seen_db_host" ]; then
  touch "$st/seen_db_host"
  echo "🔓 db_host 10.0.0.3 — dump.sql holds the admin password. Parse it with cut."
else
  echo "🔓 db_host 10.0.0.3 — recover the admin password, then ./connect.sh"
fi
OUTER_EOF

# =========================================================
# HOST 4: ADMIN_CORE (10.0.0.254)  -- BOSS: ps/kill + final breach
# =========================================================
mkdir -p admin_core
cat > admin_core/banner.txt << 'EOF'
############################################################
#  admin_core 10.0.0.254 — THE HEART OF THE GRID          #
#  A firewall daemon is actively blocking privilege        #
#  escalation. Neutralize it, then breach root.            #
############################################################
EOF

cat > admin_core/proc_table.txt << 'EOF'
  PID  USER      %CPU  COMMAND
  101  root       0.0  /sbin/init
  204  root       0.1  sshd
  330  postgres   0.3  postgres
  512  root      88.7  firewall_daemon --block-escalation   <-- blocking you!
  777  admin      0.2  bash
 1024  root       0.0  cron
EOF

cat > admin_core/notes.txt << 'EOF'
admin_core — the final host. But you're not root yet.

A firewall_daemon process is actively blocking your escalation.
   1. Find its PID:      cat proc_table.txt
   2. Kill it:           ./kill_firewall.sh <PID>
   3. Breach root:       ./breach.sh   (uses the admin password)
EOF

cat > admin_core/kill_firewall.sh << 'OUTER_EOF'
#!/bin/bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [ -z "$1" ]; then
  echo "usage: ./kill_firewall.sh <PID>"
  echo "Find the firewall_daemon's PID with: cat proc_table.txt"
  exit 1
fi
if [ "$1" = "512" ]; then
  mkdir -p "$ROOT/.state" && touch "$ROOT/.state/firewall_down"
  echo "💥 kill 512 — firewall_daemon terminated."
  echo "   The block is down. Now: ./breach.sh"
else
  echo "⚠️  kill $1 — that PID isn't the firewall_daemon. Check proc_table.txt again."
fi
OUTER_EOF
chmod +x admin_core/kill_firewall.sh

cat > admin_core/breach.sh << 'OUTER_EOF'
#!/bin/bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [ ! -f "$ROOT/.state/firewall_down" ]; then
  echo "🛡️  The firewall_daemon is still up — it deflects your breach."
  echo "   Take it down first: cat proc_table.txt ; ./kill_firewall.sh <PID>"
  exit 1
fi
read -r -s -p "root password: " pw; echo
if [ "$pw" = "r00t_0f_all" ]; then
  touch "$ROOT/.state/pwned_admin_core"
  cat << 'WIN'

   ██████  ██     ██ ███    ██ ███████ ██████
  ██    ██ ██     ██ ████   ██ ██      ██   ██
  ██    ██ ██  █  ██ ██ ██  ██ █████   ██   ██
  ██    ██ ██ ███ ██ ██  ██ ██ ██      ██   ██
   ██████   ███ ███  ██   ████ ███████ ██████

  🏴  YOU OWN THE GRID.  🏴

  root@admin_core:/#  whoami
  root

  Every host is yours: gateway → webserver → db_host → admin_core.

  SKILLS YOU JUST USED FOR REAL:
    ✓ recon with ls -la and find
    ✓ log forensics with grep -r
    ✓ decoding creds with base64 and ROT13
    ✓ spotting a leaked, over-permissioned key (chmod)
    ✓ parsing structured data with cut / awk
    ✓ exploiting password reuse
    ✓ process hunting with ps + kill

  This was a lab you owned. Out in the real world, only ever run
  these techniques on machines you have PERMISSION to test.
  That's the line between a netrunner and a criminal.

  ── Want a REAL challenge next? Read ../ENDGAME.txt ──
WIN
else
  echo "❌ Wrong root password. Recover it on db_host: base64 -d the admin row."
fi
OUTER_EOF
chmod +x admin_core/breach.sh

cat > admin_core/.host << 'OUTER_EOF'
#!/bin/bash
st="$GRID_ROOT/.state"
if [ -f "$st/pwned_admin_core" ]; then
  echo "👑 admin_core 10.0.0.254 — ROOT. The grid is yours."
elif [ -f "$st/firewall_down" ]; then
  echo "🎯 admin_core — firewall is DOWN. Finish it: ./breach.sh"
else
  echo "🔴 admin_core 10.0.0.254 — a firewall_daemon is burning 88% CPU to block you."
  echo "   cat proc_table.txt  → find its PID → ./kill_firewall.sh <PID>"
fi
OUTER_EOF

# =========================================================
# ENDGAME / bridge to a REAL vuln lab (roadmap, honest about setup)
# =========================================================
cat > ENDGAME.txt << 'EOF'
🎓 ENDGAME: FROM SIMULATION TO THE REAL THING 🎓

The_grid was simulated — every "host" was a directory, so it runs
anywhere and can't hurt anything. That's the right way to LEARN.

When you're ready for real tools against real (intentionally
vulnerable) software — still 100% legal, because you run it on
your own machine — graduate to these purpose-built playgrounds:

  • OverTheWire "Bandit"   - the natural next step; pure SSH + CLI
  • OWASP Juice Shop       - a deliberately broken web app (Docker)
  • DVWA                   - Damn Vulnerable Web App (Docker)
  • TryHackMe / HackTheBox - guided rooms and full boxes
  • picoCTF                - beginner-friendly capture-the-flag

DOCKER "FINAL BOSS" (optional, if you have Docker installed):
  A real version of admin_core could be a container running Juice
  Shop that you actually attack over http://localhost. Example:

     docker run -d -p 3000:3000 bkimminich/juice-shop
     # then open http://localhost:3000 and start hunting

  (That pulls a real image and needs Docker — it is NOT set up by
   this script, on purpose. Only run it on a machine you own.)

THE NETRUNNER'S CREED:
  Learn on systems you own. Test only with permission.
  Report what you find. Leave things better than you found them.

Now — go build your own host and hide a flag for a friend. The
best way to understand a lock is to build one.
EOF

# =========================================================
# SEAL THE GRID (lock hosts you must pivot into)
# =========================================================
chmod 000 admin_core
chmod 000 db_host
chmod 000 webserver

echo ""
echo "🌐 THE GRID is deployed. ✨"
echo ""
echo "Hosts:  jumpbox → gateway → webserver → db_host → admin_core"
echo "Locked hosts unlock as you pivot (that's the game!)."
echo ""
echo "Begin:"
echo "  cd the_grid"
echo "  cat README.txt"
echo "  cd jumpbox && cat mission.txt"
echo ""
echo "Optional living grid (hosts react + a 'scan' command):"
echo "  source enter_grid.sh"
echo ""
echo "⚠️  Don't play as root (root ignores the locks and spoils it)."
