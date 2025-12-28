#!/bin/bash

# Terminal Dungeon - An Interactive Bash Learning Adventure
# https://github.com/YOUR_USERNAME/terminal-dungeon
# 
# This script creates a filesystem-based dungeon where players learn
# terminal commands through exploration and puzzle-solving.
#
# Usage: ./setup-dungeon.sh
# Then: cd terminal_dungeon && cat welcome.txt

echo "🏰 Creating the EPIC Terminal Dungeon..."

# Create the dungeon root
mkdir -p terminal_dungeon
cd terminal_dungeon

# Entrance
cat > welcome.txt << 'EOF'
🏰 WELCOME TO THE TERMINAL DUNGEON - EPIC QUEST! 🏰

You are a young wizard trapped in an ancient dungeon.
Your quest: Master the terminal arts and escape!

You know only these BASIC SPELLS:
• ls       - REVEAL what is in this room
• cd <dir> - Enter a room (like: cd library)
• cd ..    - Go back to the previous room
• cat <file> - READ scrolls (like: cat welcome.txt)

MANY MORE SPELLS await discovery in this vast dungeon!

Current location has these areas to explore:
- library (ancient knowledge)
- armory (weapons and power)
- portal_chamber (travel to other realms!)

📋 HELPFUL FILES:
• HINTS.txt - Stuck? Read this
• CHEAT_SHEET.txt - Command reference
• quest_log.txt - Track your progress

To read them, you must navigate back here and use cat:
  cat HINTS.txt

Start your adventure: Try "ls" to see what's here!
EOF

cat > quest_log.txt << 'EOF'
📋 MAIN QUEST LOG 📋

PRIMARY OBJECTIVES:
[ ] Find the 3 keys (Silver, Gold, Bronze)
[ ] Learn the dragon sleep spell
[ ] Defeat the dragon
[ ] Claim the treasure

BONUS OBJECTIVES:
[ ] Discover all hidden spells
[ ] Master the Ancient Library
[ ] Visit all 3 realms via portals
[ ] Create your own adventure log
[ ] Unlock the secret ending (hint: ls -a)

Tip: Use 'cat quest_log.txt' anytime to see this!
EOF

cat > HINTS.txt << 'EOF'
💡 STUCK? READ THIS! 💡

GENERAL TIPS:
• Use 'ls' to see what's in the current room
• Use 'cat filename.txt' to read scrolls
• Use 'cd directory' to enter a room
• Use 'cd ..' to go back

FINDING THE KEYS:
• Silver key: In the library (main directory)
• Gold key: In the library's HIDDEN archives (need ls -a)
• Bronze key: In the armory

DECODING THE KEYS:
All three keys are Base64 encoded! To decode them:

Example for silver key:
  grep "BEGIN SILVER" -A 2 library/silver_key.txt | grep -v "BEGIN\|END" | base64 -d

Or simpler:
  echo "U2lsdmVyS2V5..." | base64 -d

Do this for all three keys and write down what they say!

UNLOCKING THE TREASURY:
1. Decode all three keys
2. Each reveals part of the master passphrase
3. Combine the three parts (e.g., "Arcane" + "Wisdom" + "Power")
4. Decode the encrypted_passphrase.txt file
5. Run ./unlock_treasury.sh with the decoded treasury code

To decode encrypted_passphrase.txt:
  cat armory/treasury/encrypted_passphrase.txt | grep '^V2' | base64 -d

THE LIBRARY ARCHIVES CHALLENGE:
The archives contain 2000 scrolls! Don't read them manually!

Use GREP to search:
• cd library/archives
• grep "SECRET" scroll_*.txt
• grep "dragon" scroll_*.txt  
• grep "GOLD_KEY" scroll_*.txt
• grep "Ignis" scroll_*.txt

You need to find THREE special scrolls:
1. One mentions the dragon's TRUE NAME
2. One mentions GOLD_KEY_LOCATION
3. One gives you a helpful grep tip

FINDING THE GOLD KEY:
Once you find where it is, you need to SEE hidden directories:
• cd library
• ls -a  (the 'a' shows ALL files, including hidden ones)
• Look for directories starting with '.'
• cd .secret_archives

DRAGON TIPS:
• Read library/dragon_lore.txt for the sleep spell
• The dragon has an encrypted riddle - decode it with base64
• Use grep in archives to find the dragon's TRUE NAME
• Run ./sleep_dragon.sh in the dragon_lair
• Speak BOTH parts together in one line

EXAMPLE BASE64 COMMANDS:
• echo "encoded_text" | base64 -d    (decode)
• cat file.txt | base64               (encode)
• grep "pattern" file | base64 -d     (search and decode)

EXAMPLE GREP COMMANDS:
• grep "word" file.txt              (search one file)
• grep "word" *.txt                 (search all .txt files)
• grep -i "word" *.txt              (case-insensitive)
• grep -n "word" *.txt              (show line numbers)
• grep "EXACT PHRASE" *.txt         (search for phrase)

HIDDEN SECRET:
• Use 'ls -a' to see hidden files and directories
• Look for things starting with '.'

NEED THE CHEAT SHEET?
• cat CHEAT_SHEET.txt

Remember: Cryptography and grep are your best friends!
You can't manually read 2000 scrolls - that's the point!
EOF

# ===================
# LIBRARY - Man pages and grep
# ===================
mkdir -p library

cat > library/entrance_scroll.txt << 'EOF'
📚 LIBRARY ENTRANCE 📚

You stand in a grand library. Thousands of ancient scrolls line the walls.

The head librarian approaches...
Try: cat librarian_greeting.txt
EOF

cat > library/librarian_greeting.txt << 'EOF'
👴 THE HEAD LIBRARIAN 👴

"Welcome, young wizard! I am the keeper of knowledge.

You have learned to READ scrolls with 'cat', but did you know
every spell in the terminal has its own detailed manual?

⚡ NEW SPELL UNLOCKED: man

The 'man' spell (short for 'manual') reveals EVERYTHING about a spell!

Try these:
• man ls    (learn all about the ls spell)
• man cat   (discover cat's hidden powers)
• man cd    (might not work - cd is built-in, try 'help cd')

Press 'q' to quit the manual when you're done reading.

The archives contain thousands of ancient scrolls. 
Some hold great secrets... you'll need powerful magic to find them."
EOF

cat > library/silver_key.txt << 'EOF'
🗝️  THE SILVER KEY! 🗝️

You found the first key!
(Key 1 of 3)

But this is no ordinary key... it's a CRYPTOGRAPHIC KEY!

-----BEGIN SILVER KEY-----
U2lsdmVyS2V5OiBUaGlzIGlzIHRoZSBmaXJzdCBwYXJ0IG9mIHRoZSBtYXN0ZXIg
cGFzc3BocmFzZTogIkFyY2FuZSIK
-----END SILVER KEY-----

The librarian nods approvingly.
"This key is encoded in Base64. You'll need to decode all three keys
to reveal the master passphrase that unlocks the treasury!"

⚡ NEW SPELL UNLOCKED: base64

To decode this key:
  echo "U2lsdmVyK..." | base64 -d

Or extract and decode in one command:
  grep "BEGIN SILVER" -A 2 silver_key.txt | grep -v "BEGIN\|END" | base64 -d

💡 PRO TIP: Save decoded keys as ENVIRONMENT VARIABLES!

Try this:
  export SILVER_KEY=$(grep "BEGIN SILVER" -A 2 silver_key.txt | grep -v "BEGIN\|END" | base64 -d)
  echo $SILVER_KEY

Now you can access this key from anywhere in the dungeon!
Check it anytime with: echo $SILVER_KEY

Do this for all three keys, then combine them:
  export MASTER_PASS="${SILVER_KEY}${GOLD_KEY}${BRONZE_KEY}"
EOF

# Create the archives directory with THOUSANDS of scrolls
mkdir -p library/archives

echo "Creating thousands of ancient scrolls in the library archives..."

# Create 2000 scrolls with random historical content
for i in {1..2000}; do
  year=$((1000 + i))
  weather=("Sunny" "Cloudy" "Rainy" "Stormy" "Foggy" "Clear")
  event=("harvest festival" "royal decree" "merchant caravan arrived" "nothing of note" "village celebration" "eclipse observed")
  
  cat > library/archives/scroll_$(printf "%04d" $i).txt << EOF
Ancient Scroll #$(printf "%04d" $i)

Year: $year
Weather: ${weather[$RANDOM % 6]}
Event: ${event[$RANDOM % 6]}
Status: Record archived
EOF
done

# Hide the THREE important scrolls with clues among the 2000!
cat > library/archives/scroll_0666.txt << 'EOF'
Ancient Scroll #0666

Year: 1666
Weather: Dark and ominous
Event: A traveling scholar visited
Status: UNUSUAL ENTRY

The scholar spoke of a great beast that guards ancient treasure.
He said: "The dragon's true name, written in the old tongue, is 'Ignis Maximus'.
Only by speaking its name can one hope to command it."

I have recorded this in case it proves useful to future adventurers.
EOF

cat > library/archives/scroll_1313.txt << 'EOF'
Ancient Scroll #1313

Year: 2313
Weather: Mystical aurora
Event: SECRET_CLUE_FOUND
Status: CONFIDENTIAL

ATTENTION FUTURE WIZARDS:
The GOLD_KEY location has been discovered!
It is hidden in the librarian's SECRET_ARCHIVES.

But these archives are HIDDEN from normal sight.
Only those who know the spell to reveal invisible things can find them.

Hint: Use 'ls -a' to see ALL things, even those that start with a dot.
EOF

cat > library/archives/scroll_0042.txt << 'EOF'
Ancient Scroll #0042

Year: 1042
Weather: Clear skies
Event: The Answer was discovered
Status: Philosophical

A wizard asked: "How many scrolls must one read to find truth?"
The answer, as always, is 42.

But seriously, there are thousands of scrolls here.
Reading them all with 'cat scroll_*.txt' would take forever!

Wise wizards use GREP to search for specific words:
  grep "SECRET" scroll_*.txt
  grep "GOLD_KEY" scroll_*.txt
  grep -i "dragon" scroll_*.txt

Work smarter, not harder!
EOF

cat > library/search_scroll.txt << 'EOF'
🔍 SCROLL OF SEARCHING 🔍

"Young wizard, the archives now contain over 2000 ancient scrolls!
Reading each one would take days!

⚡ NEW SPELL UNLOCKED: grep

The GREP spell searches for words inside files!

THE ARCHIVES CHALLENGE:
Somewhere in the 2000 scrolls in the 'archives' directory, there are
THREE special scrolls containing vital information:
1. The dragon's TRUE NAME
2. The location of the GOLD_KEY  
3. A helpful hint about using grep itself

Try these commands:
• cd archives
• grep "SECRET" scroll_*.txt
• grep "dragon" scroll_*.txt
• grep "GOLD_KEY" scroll_*.txt
• grep -n "dragon" scroll_*.txt  (shows line numbers)
• grep -i "secret" scroll_*.txt  (ignores case)

Use 'man grep' to learn more!

POWER TIP: You can search from the library directory too:
  grep "SECRET" archives/scroll_*.txt

Find those three special scrolls! Your quest depends on it!"
EOF

# Create the HIDDEN secret archives (starts with .)
mkdir -p library/.secret_archives

cat > library/.secret_archives/gold_key.txt << 'EOF'
🗝️  THE GOLDEN KEY! 🗝️

You found the second key using your searching AND revealing skills!
(Key 2 of 3)

Another cryptographic key! This one is also Base64 encoded.

-----BEGIN GOLD KEY-----
R29sZEtleTogVGhlIHNlY29uZCBwYXJ0IG9mIHRoZSBtYXN0ZXIgcGFzc3BocmFz
ZTogIldpc2RvbSIK
-----END GOLD KEY-----

"Excellent work!" says the librarian.
"You've mastered both grep AND the art of seeing hidden things!

Decode this key the same way you decoded the silver key:
  grep "BEGIN GOLD" -A 2 gold_key.txt | grep -v "BEGIN\|END" | base64 -d

WRITE DOWN this decoded part too! Keep track of all three parts.
You're getting quite deep in the dungeon now...
Are you finding it tedious to navigate back to check hints? 
The spell forge in the armory might help with that..."
EOF

cat > library/.secret_archives/archival_note.txt << 'EOF'
📜 CONFIDENTIAL ARCHIVAL NOTE 📜

The gold key is stored here in the secret archives.

This directory is HIDDEN (starts with a dot).
Normal 'ls' won't show it, but 'ls -a' reveals all!

This is how Unix/Linux systems hide configuration files:
• .bashrc (bash configuration)
• .ssh/ (SSH keys)  
• .gitconfig (git settings)

Directories and files starting with '.' are invisible to normal listing.
Now you know the secret!
EOF

cat > library/.secret_archives/find_scroll.txt << 'EOF'
🔎 SCROLL OF SEEKING 🔎

⚡ NEW SPELL UNLOCKED: find

While GREP searches INSIDE files, FIND searches FOR files!

Try these:
• find . -name "*.txt"           (find all .txt files)
• find . -name "*key*"           (find files with 'key' in name)
• find . -type d                 (find all directories)
• find . -name "scroll_*.txt" | wc -l   (count scroll files)

CHALLENGE: How many scroll files are in the entire library?
Try: find . -name "scroll_*.txt" | wc -l

The library is vast. Use 'find' to discover hidden chambers!
EOF

cat > library/.secret_archives/pwd_scroll.txt << 'EOF'
📍 SCROLL OF LOCATION 📍

⚡ NEW SPELL: pwd

This spell shows your EXACT location in the dungeon!
Essential when paths become complex.

Try: pwd

You'll see something like: /path/to/terminal_dungeon/library/.secret_archives

This shows you're in a hidden directory inside the library!
EOF

# ===================
# ARMORY - Permissions and wildcards
# ===================
mkdir -p armory

cat > armory/entrance_note.txt << 'EOF'
⚔️  THE ARMORY ⚔️

Weapons, shields, and armor fill this chamber.
But something is strange... some items seem locked.

Try: ls -l

Notice the letters at the start of each line?
Those are PERMISSIONS - who can read/write/execute files.
EOF

cat > armory/bronze_key.txt << 'EOF'
🗝️  THE BRONZE KEY! 🗝️

You found the third key!
(Key 3 of 3)

The final cryptographic key!

-----BEGIN BRONZE KEY-----
QnJvbnplS2V5OiBUaGUgdGhpcmQgYW5kIGZpbmFsIHBhcnQgb2YgdGhlIG1hc3Rl
ciBwYXNzcGhyYXNlOiAiUG93ZXIiCg==
-----END BRONZE KEY-----

All three keys are yours! Decode this one too:
  grep "BEGIN BRONZE" -A 2 bronze_key.txt | grep -v "BEGIN\|END" | base64 -d

Now combine all three decoded parts to form the MASTER PASSPHRASE!

If you've been writing them down:
  Part 1: Arcane
  Part 2: Wisdom
  Part 3: Power
  Combined: ArcaneWisdomPower

Or if you learned about environment variables in the spell_forge:
  echo "${SILVER_KEY}${GOLD_KEY}${BRONZE_KEY}"

The treasury awaits! cd ../treasury
EOF

# Create a locked scroll (no read permission initially)
cat > armory/locked_scroll.txt << 'EOF'
🔒 This scroll is magically sealed!

You need to learn permission magic to read it.
EOF
chmod 000 armory/locked_scroll.txt

cat > armory/permission_guide.txt << 'EOF'
🔐 GUIDE TO PERMISSION MAGIC 🔐

⚡ NEW SPELL UNLOCKED: chmod

Every file has PERMISSIONS:
• r = read (can read the file)
• w = write (can modify the file)
• x = execute (can run the file)

Try these:
• chmod +r locked_scroll.txt  (add read permission)
• chmod +w file.txt           (add write permission)
• chmod +x spell.sh           (make script executable)

Now unlock the locked_scroll.txt:
chmod +r locked_scroll.txt
cat locked_scroll.txt

Use 'man chmod' to learn more!
EOF

cat > armory/enchanted_shield.txt << 'EOF'
🛡️  ENCHANTED SHIELD 🛡️

This shield bears ancient runes teaching PATTERN MAGIC!

⚡ NEW SPELL: Wildcards

Wildcards let you work with multiple files at once:
• *        = matches anything
• ?        = matches one character
• [abc]    = matches a, b, or c

Try these:
• ls *.txt              (all text files)
• cat weapon_?.txt      (weapon_1.txt, weapon_2.txt, etc)
• ls [a-z]*            (files starting with lowercase letters)

Use 'man bash' and search for 'Pattern Matching' to learn more!
EOF

# Create weapon files for wildcard practice
for i in {1..5}; do
  cat > armory/weapon_$i.txt << EOF
⚔️  Weapon #$i: Ancient Sword
Damage: $(( i * 10 ))
Type: Melee
EOF
done

mkdir -p armory/hall_of_echoes

cat > armory/hall_of_echoes/echo_chamber.txt << 'EOF'
🔮 THE CHAMBER OF ECHOES 🔮

⚡ NEW SPELL UNLOCKED: echo

The ECHO spell lets you SPEAK words!

Try these:
• echo Hello dungeon!
• echo I have $(ls | wc -l) items here
• echo My location: $(pwd)

POWER TIP: Echo can combine with other spells using $()!

Practice here, you'll need echo to defeat the dragon!
EOF

cat > armory/hall_of_echoes/redirection_scroll.txt << 'EOF'
📝 SCROLL OF REDIRECTION 📝

⚡ NEW SPELL: Redirection (> and >>)

You can save your echo words to create NEW scrolls!

• >   creates a new file (overwrites if exists)
• >>  adds to the end of a file

Try these:
• echo "Day 1: I entered the dungeon" > my_journal.txt
• echo "Day 2: Found the library" >> my_journal.txt
• cat my_journal.txt

Create your own adventure log! Document your journey!
EOF

mkdir -p armory/spell_forge

cat > armory/spell_forge/forge_intro.txt << 'EOF'
🔨 THE SPELL FORGE 🔨

You enter a chamber filled with magical forging equipment.
A scroll catches your eye...

"ARE YOU TIRED OF NAVIGATING BACK AND FORTH?"

"Do you find yourself constantly doing this?"
  • cd ../../..
  • cat HINTS.txt
  • cd library/archives
  • Ugh, I forgot what it said!
  • cd ../../..
  • cat HINTS.txt again...

"Have you been manually re-typing long base64 decode commands?"
"Forgetting which key parts you already decoded?"
"Wishing there was a better way?"

THERE IS! Let me teach you the ancient arts of AUTOMATION!

⚡ NEW SPELLS UNLOCKED: alias and export

═══════════════════════════════════════════════════
ALIASES - Custom Shortcuts
═══════════════════════════════════════════════════

Stop typing the same long commands over and over!
Create shortcuts:

  alias hints='cat ../../HINTS.txt'
  alias cheats='cat ../../CHEAT_SHEET.txt'

Now just type: hints
No more cd ../../../ and back!

More examples:
  alias teleport='cd'
  alias reveal='ls -la'
  alias back='cd ..'

═══════════════════════════════════════════════════
ENVIRONMENT VARIABLES - Remember Everything
═══════════════════════════════════════════════════

Stop re-decoding the same keys!
Store decoded information:

Instead of decoding silver_key.txt every time:
  export SILVER_KEY=$(cat /path/to/silver_key.txt | base64 -d)

Now check it anytime, from anywhere:
  echo $SILVER_KEY

GAME CHANGER - Save your dungeon home:
  export DUNGEON_HOME=/full/path/to/terminal_dungeon

Now you can always find things:
  alias hints='cat $DUNGEON_HOME/HINTS.txt'
  alias cheats='cat $DUNGEON_HOME/CHEAT_SHEET.txt'
  alias home='cd $DUNGEON_HOME'

These work from ANYWHERE in the dungeon!

═══════════════════════════════════════════════════
RECOMMENDED SETUP FOR THIS QUEST
═══════════════════════════════════════════════════

Run these commands NOW to make your life easier:

# Save your starting point
export DUNGEON_HOME=$(cd ../../.. && pwd && cd - > /dev/null)

# Create helpful aliases
alias hints='cat $DUNGEON_HOME/HINTS.txt'
alias cheats='cat $DUNGEON_HOME/CHEAT_SHEET.txt'
alias quest='cat $DUNGEON_HOME/quest_log.txt'
alias home='cd $DUNGEON_HOME'

# Test it
hints

MIND = BLOWN, right? 🤯

═══════════════════════════════════════════════════
FOR YOUR KEY QUEST
═══════════════════════════════════════════════════

Stop re-decoding keys! Save them once:

From the silver_key.txt location:
  export SILVER_KEY=$(grep "BEGIN SILVER" -A 2 silver_key.txt | grep -v "BEGIN\|END" | base64 -d)

From the gold_key.txt location:
  export GOLD_KEY=$(grep "BEGIN GOLD" -A 2 gold_key.txt | grep -v "BEGIN\|END" | base64 -d)

From the bronze_key.txt location:
  export BRONZE_KEY=$(grep "BEGIN BRONZE" -A 2 bronze_key.txt | grep -v "BEGIN\|END" | base64 -d)

Check them anytime:
  echo $SILVER_KEY
  echo $GOLD_KEY
  echo $BRONZE_KEY

Combine them easily:
  echo "$SILVER_KEY $GOLD_KEY $BRONZE_KEY"

Create an alias to show all keys:
  alias showkeys='echo "Silver: $SILVER_KEY" && echo "Gold: $GOLD_KEY" && echo "Bronze: $BRONZE_KEY"'

═══════════════════════════════════════════════════
WHY THIS MATTERS IN THE REAL WORLD
═══════════════════════════════════════════════════

• API keys and tokens: export GITHUB_TOKEN=xxx
• Database passwords: export DB_PASS=secret
• Frequently used paths: alias logs='cd /var/log'
• Complex commands: alias update='sudo apt update && sudo apt upgrade'
• Development environments: export NODE_ENV=production

Professional developers use these CONSTANTLY!

⚠️  NOTE: These only last for your current terminal session.
To make them permanent, add them to ~/.bashrc or ~/.bash_profile

Type 'man bash' and search for 'alias' or 'ENVIRONMENT' to learn more!

═══════════════════════════════════════════════════

You've been doing it the hard way. Now you know the smart way.
Welcome to wizard-level terminal mastery! 🧙‍♂️
EOF

cat > armory/spell_forge/piping_scroll.txt << 'EOF'
⛓️  SCROLL OF SPELL CHAINING ⛓️

⚡ NEW SPELL: Piping (|)

The pipe | lets you CHAIN spells together!
The output of one spell becomes the input of the next!

Try these:
• ls | wc -l                    (count items in room)
• cat *.txt | grep "key"        (search all scrolls for "key")
• find . -name "*.txt" | wc -l  (count all txt files)
• history | grep "cd"           (see all cd commands you used)

This is the most POWERFUL technique in terminal magic!
Master this and you'll be unstoppable!
EOF

# ===================
# PORTAL CHAMBER - SSH and realms
# ===================
mkdir -p portal_chamber

cat > portal_chamber/portal_intro.txt << 'EOF'
🌀 THE PORTAL CHAMBER 🌀

Four ancient portals stand before you, each leading to a different realm!

⚡ NEW SPELL: ssh (Secure Shell - Teleportation Magic)

SSH lets you teleport to other castles/realms!

The syntax is: ssh username@hostname

For practice in this dungeon, we have FOUR realms:
• ice_castle (File operations)
• fire_mountain (Process management)
• sky_tower (Networking)
• masters_tower (Advanced terminal mastery) ⭐ NEW!

The Masters Tower is only accessible to those who have conquered
the dragon and proven themselves worthy!

But in the real world, you could SSH to actual remote servers!

Example (real world):
• ssh user@example.com
• ssh pi@192.168.1.100

Note: The realms here are simulated with directories.
In reality, SSH connects to different computers!

Explore each realm to learn different aspects of terminal magic!
EOF

cat > portal_chamber/how_portals_work.txt << 'EOF'
📚 HOW PORTALS (SSH) WORK 📚

In the REAL terminal world:
1. You use SSH to connect to remote computers
2. You need the computer's address and your username
3. You might need a password or SSH key
4. Once connected, you control that remote computer!

Common uses:
• Managing web servers
• Connecting to Raspberry Pi projects
• Accessing your school/work computer from home
• Running programs on powerful remote computers

For now, explore our simulated realms!
Each teaches different concepts!
EOF

# ===================
# ICE CASTLE REALM - File operations
# ===================
mkdir -p portal_chamber/ice_castle

cat > portal_chamber/ice_castle/realm_entrance.txt << 'EOF'
❄️  WELCOME TO THE ICE CASTLE ❄️

Everything here is frozen! You'll need to learn
file manipulation magic to survive.

⚡ NEW SPELLS: cp, mv, rm, mkdir, touch

These spells let you CREATE, COPY, MOVE, and REMOVE items!

Try these:
• mkdir my_vault        (create a new directory)
• touch ice_shard.txt   (create an empty file)
• cp file1.txt file2.txt (copy a file)
• mv old.txt new.txt    (rename/move a file)
• rm unwanted.txt       (delete a file - BE CAREFUL!)

Practice here safely!
EOF

cat > portal_chamber/ice_castle/frozen_scroll.txt << 'EOF'
🧊 FROZEN SCROLL 🧊

This scroll teaches you to create and organize!

Challenge: Create your own directory structure!
1. mkdir frozen_vault
2. touch frozen_vault/ice_shard_1.txt
3. echo "I created this!" > frozen_vault/ice_shard_1.txt
4. cp frozen_vault/ice_shard_1.txt frozen_vault/ice_shard_2.txt
5. ls frozen_vault

You're becoming a true file master!
EOF

cat > portal_chamber/ice_castle/warning.txt << 'EOF'
⚠️  WARNING ABOUT rm ⚠️

The 'rm' spell is PERMANENT!
There is no undo, no trash bin.

NEVER do: rm -rf /
NEVER do: rm -rf *  (unless you're SURE)

Practice with safe test files first!

Safer options:
• rm -i file.txt  (asks for confirmation)
• Use 'trash' instead of 'rm' if available

With great power comes great responsibility!
EOF

# ===================
# FIRE MOUNTAIN REALM - Processes
# ===================
mkdir -p portal_chamber/fire_mountain

cat > portal_chamber/fire_mountain/realm_entrance.txt << 'EOF'
🔥 WELCOME TO FIRE MOUNTAIN 🔥

Fire demons (processes) roam this realm!
You must learn to command them!

⚡ NEW SPELLS: ps, top, kill, jobs, bg, fg

These spells control running processes!

Try these:
• ps              (show your running processes)
• ps aux          (show ALL processes)
• top             (live view of processes - press q to quit)
• sleep 30 &      (run a command in background)
• jobs            (see background jobs)
• fg              (bring background job to foreground)

Processes are programs that are currently running!
EOF

cat > portal_chamber/fire_mountain/daemon_scroll.txt << 'EOF'
👹 SCROLL OF DAEMON CONTROL 👹

Background processes (&) are like summoning demons
that work while you do other things!

Try this:
• sleep 10 &      (starts a 10-second timer in background)
• jobs            (see it running)
• ls              (you can do other things!)
• fg              (bring it back to foreground)

Use Ctrl+Z to pause a running program
Then use 'bg' to send it to background!

This is powerful for:
• Running servers
• Long-running scripts
• Batch processing
EOF

# ===================
# SKY TOWER REALM - Networking
# ===================
mkdir -p portal_chamber/sky_tower

cat > portal_chamber/sky_tower/realm_entrance.txt << 'EOF'
☁️  WELCOME TO SKY TOWER ☁️

From here you can reach across the network sky!

⚡ NEW SPELLS: ping, curl, wget, netstat

These spells interact with the network!

Try these (if internet available):
• ping google.com         (check if site is reachable)
• curl wttr.in            (get weather!)
• curl wttr.in/London     (weather for London)
• wget URL                (download a file)

These spells connect you to the ENTIRE INTERNET!
EOF

cat > portal_chamber/sky_tower/network_scroll.txt << 'EOF'
🌐 SCROLL OF NETWORK MAGIC 🌐

The internet is just computers talking to each other!

curl examples:
• curl api.github.com (get data from an API)
• curl -I google.com  (see headers only)
• curl wttr.in        (ASCII weather!)

wget examples:
• wget example.com/file.pdf (download file)

ping examples:
• ping -c 4 google.com (ping 4 times then stop)

You can control the internet from the terminal!
Building websites, downloading data, managing servers!
EOF

# ===================
# MASTERS TOWER - Advanced Commands (Post-Game Content)
# ===================
mkdir -p portal_chamber/masters_tower

cat > portal_chamber/masters_tower/entrance.txt << 'EOF'
🏰 THE MASTERS TOWER 🏰

"Greetings, Dragon Slayer!"

A robed figure appears before you.

"You have conquered the main dungeon, but your journey
to terminal mastery has only begun.

Within this tower lie the ADVANCED ARTS:
• Text Processing Laboratory
• Archive Vault
• Comparison Chamber  
• Binary Mysteries
• Transformation Workshop

Each chamber teaches powerful spells used by master wizards
in the real world of software, security, and system administration.

Are you ready to ascend to TRUE mastery?"

Explore the chambers with 'ls' and 'cd'!
EOF

# ===================
# TEXT PROCESSING LAB (Tier 1: head, tail, wc, sort, uniq)
# ===================
mkdir -p portal_chamber/masters_tower/text_processing_lab

cat > portal_chamber/masters_tower/text_processing_lab/README.txt << 'EOF'
📊 TEXT PROCESSING LABORATORY 📊

Welcome to the Text Processing Lab!

Here you will master the essential spells for manipulating text:
• head/tail - Preview and extract from files
• wc - Count words, lines, and characters
• sort - Organize data
• uniq - Find unique entries
• cut - Extract specific columns

These spells are used CONSTANTLY in real terminal work:
• Analyzing logs
• Processing CSV data
• Cleaning up data sets
• Quick statistics

Explore each scroll to learn these powerful techniques!
EOF

# Create sample data for demonstrations
cat > portal_chamber/masters_tower/text_processing_lab/sample_data.txt << 'EOF'
apple
banana
cherry
date
elderberry
fig
grape
honeydew
kiwi
lemon
mango
nectarine
orange
papaya
quince
raspberry
strawberry
tangerine
ugli fruit
vanilla
watermelon
EOF

cat > portal_chamber/masters_tower/text_processing_lab/head_tail_scroll.txt << 'EOF'
📜 HEAD AND TAIL SCROLLS 📜

⚡ NEW SPELLS: head and tail

These spells let you preview files without reading everything!

HEAD - See the beginning:
• head file.txt           (first 10 lines)
• head -n 5 file.txt      (first 5 lines)
• head -n 20 file.txt     (first 20 lines)

TAIL - See the end:
• tail file.txt           (last 10 lines)
• tail -n 5 file.txt      (last 5 lines)
• tail -f file.txt        (follow file as it grows - great for logs!)

Try them on sample_data.txt:
  head -n 3 sample_data.txt
  tail -n 3 sample_data.txt

REAL-WORLD USES:
• head /var/log/syslog           (check recent log entries)
• tail -f /var/log/apache2/access.log  (watch live traffic)
• head -n 100 bigfile.csv        (preview large data)

POWER COMBO:
  head -n 50 file.txt | tail -n 10
  (gets lines 41-50!)
EOF

cat > portal_chamber/masters_tower/text_processing_lab/wc_scroll.txt << 'EOF'
🔢 WORD COUNT SCROLL 🔢

⚡ NEW SPELL: wc (word count)

This spell counts lines, words, and characters!

Basic usage:
• wc file.txt             (shows lines, words, chars)
• wc -l file.txt          (count lines only)
• wc -w file.txt          (count words only)
• wc -c file.txt          (count characters only)

Try it:
  wc sample_data.txt
  wc -l sample_data.txt

POWER COMBOS:
  ls | wc -l                    (count files in directory)
  grep "dragon" *.txt | wc -l   (count matches)
  find . -name "*.txt" | wc -l  (count all txt files)

REAL-WORLD EXAMPLES:
  wc -l access.log              (count log entries)
  cat file.txt | wc -w          (count words)
  git log --oneline | wc -l     (count commits)

You used this earlier with pipes!
Now you know what it's really doing!
EOF

cat > portal_chamber/masters_tower/text_processing_lab/sort_scroll.txt << 'EOF'
📊 SORTING SCROLL 📊

⚡ NEW SPELL: sort

Organize data alphabetically or numerically!

Basic usage:
• sort file.txt           (alphabetical)
• sort -r file.txt        (reverse order)
• sort -n file.txt        (numerical sort)
• sort -u file.txt        (unique - removes duplicates)

Try it:
  sort sample_data.txt
  sort -r sample_data.txt

ADVANCED:
• sort -k 2 file.txt      (sort by 2nd column)
• sort -t ',' -k 3 file.csv  (CSV sort by 3rd column)

Create test data:
  echo -e "zebra\napple\nmango\nbanana" | sort

REAL-WORLD USES:
  sort names.txt > sorted_names.txt
  du -h * | sort -h         (sort by human-readable sizes)
  history | sort | uniq     (find unique commands used)
EOF

cat > portal_chamber/masters_tower/text_processing_lab/uniq_scroll.txt << 'EOF'
🎯 UNIQUE SCROLL 🎯

⚡ NEW SPELL: uniq

Find or remove duplicate lines!

IMPORTANT: uniq only works on SORTED input!
Use with sort first!

Basic usage:
• uniq file.txt           (remove adjacent duplicates)
• uniq -c file.txt        (count occurrences)
• uniq -d file.txt        (show only duplicates)
• uniq -u file.txt        (show only unique lines)

Create test file:
  echo -e "apple\napple\nbanana\napple\nbanana\ncherry" > duplicates.txt
  
  sort duplicates.txt | uniq
  sort duplicates.txt | uniq -c

POWER COMBO:
  sort file.txt | uniq -c | sort -rn
  (count duplicates, sort by frequency!)

REAL-WORLD EXAMPLES:
  history | awk '{print $2}' | sort | uniq -c | sort -rn
  (most used commands!)
  
  cat access.log | cut -d' ' -f1 | sort | uniq -c
  (count unique IP addresses)
EOF

cat > portal_chamber/masters_tower/text_processing_lab/cut_scroll.txt << 'EOF'
✂️  CUTTING SCROLL ✂️

⚡ NEW SPELL: cut

Extract specific columns or fields from text!

Basic usage:
• cut -c 1-5 file.txt     (characters 1-5)
• cut -f 1 file.txt       (first field, tab-delimited)
• cut -d',' -f 2 file.csv (2nd field, comma-delimited)

Create CSV test data:
  echo -e "name,age,city\nAlice,30,NYC\nBob,25,LA\nCarol,35,Chicago" > people.csv
  
  cut -d',' -f 1 people.csv  (just names)
  cut -d',' -f 2 people.csv  (just ages)

MULTIPLE FIELDS:
  cut -d',' -f 1,3 people.csv  (name and city)

REAL-WORLD EXAMPLES:
  cut -d':' -f 1 /etc/passwd     (list all usernames)
  ls -l | cut -c 1-10            (just permissions)
  cat log.txt | cut -d' ' -f 3   (extract 3rd column)

POWER COMBO:
  grep "ERROR" log.txt | cut -d' ' -f 1,5 | sort | uniq
  (find unique error patterns!)
EOF

# ===================
# ARCHIVE VAULT (Tier 1: tar, Tier 2: gzip/gunzip)
# ===================
mkdir -p portal_chamber/masters_tower/archive_vault

cat > portal_chamber/masters_tower/archive_vault/README.txt << 'EOF'
📦 THE ARCHIVE VAULT 📦

Ancient scrolls sealed in compressed archives!

You will learn:
• tar - Archive and extract files
• gzip/gunzip - Compress and decompress

These are ESSENTIAL for:
• Downloading software
• Backing up files
• Deploying applications
• Sharing multiple files

Every developer uses these constantly!
EOF

# Create files to archive
mkdir -p portal_chamber/masters_tower/archive_vault/scrolls_to_archive
cat > portal_chamber/masters_tower/archive_vault/scrolls_to_archive/scroll1.txt << 'EOF'
Ancient Scroll 1: The power of archiving
EOF
cat > portal_chamber/masters_tower/archive_vault/scrolls_to_archive/scroll2.txt << 'EOF'
Ancient Scroll 2: Compression saves space
EOF
cat > portal_chamber/masters_tower/archive_vault/scrolls_to_archive/scroll3.txt << 'EOF'
Ancient Scroll 3: tar.gz is everywhere
EOF

cat > portal_chamber/masters_tower/archive_vault/tar_scroll.txt << 'EOF'
📦 TAR SCROLL (Tape ARchive) 📦

⚡ NEW SPELL: tar

TAR bundles multiple files into one archive!

CREATING ARCHIVES:
• tar -cf archive.tar files/      (create archive)
• tar -czf archive.tar.gz files/  (create + compress)
• tar -czvf archive.tar.gz files/ (verbose - shows progress)

EXTRACTING:
• tar -xf archive.tar              (extract)
• tar -xzf archive.tar.gz          (extract compressed)
• tar -xzvf archive.tar.gz         (verbose extract)

VIEWING:
• tar -tf archive.tar              (list contents)
• tar -tzf archive.tar.gz          (list compressed archive)

PRACTICE:
  cd scrolls_to_archive
  tar -czf ../ancient_scrolls.tar.gz *.txt
  cd ..
  tar -tzf ancient_scrolls.tar.gz

REMEMBER THE FLAGS:
• c = create
• x = extract
• t = list
• f = file
• z = gzip
• v = verbose

REAL-WORLD:
  tar -czf backup.tar.gz ~/Documents/
  tar -xzf software-1.2.3.tar.gz
  
Almost all Linux software is distributed as .tar.gz!
EOF

cat > portal_chamber/masters_tower/archive_vault/gzip_scroll.txt << 'EOF'
🗜️  COMPRESSION SCROLL 🗜️

⚡ NEW SPELLS: gzip and gunzip

Compress files to save space!

COMPRESS:
• gzip file.txt           (creates file.txt.gz, removes original)
• gzip -k file.txt        (keep original)
• gzip -9 file.txt        (maximum compression)

DECOMPRESS:
• gunzip file.txt.gz
• gzip -d file.txt.gz     (same as gunzip)

VIEW WITHOUT EXTRACTING:
• zcat file.txt.gz        (view compressed file)
• zgrep "pattern" file.gz (grep in compressed file!)
• zless file.txt.gz       (page through compressed file)

CREATE TEST:
  echo "This is a test file with repeating text text text" > test.txt
  ls -lh test.txt
  gzip -k test.txt
  ls -lh test.txt.gz
  (notice the size difference!)

REAL-WORLD:
  gzip -r logs/             (compress all files in directory)
  gzip -9 backup.sql        (maximum compression for backups)
  zgrep "ERROR" app.log.gz  (search compressed logs!)

NOTE: tar -czf combines tar and gzip automatically!
EOF

# Create a sealed archive challenge
cd portal_chamber/masters_tower/archive_vault
tar -czf sealed_ancient_archive.tar.gz scrolls_to_archive/ 2>/dev/null
cd - > /dev/null

cat > portal_chamber/masters_tower/archive_vault/challenge.txt << 'EOF'
🎯 ARCHIVE CHALLENGE 🎯

A sealed archive has been discovered: sealed_ancient_archive.tar.gz

Your mission:
1. List the contents without extracting
2. Extract the archive
3. Read the scrolls
4. Re-compress them with maximum compression

Commands:
  tar -tzf sealed_ancient_archive.tar.gz
  tar -xzf sealed_ancient_archive.tar.gz
  gzip -9 scrolls_to_archive/*.txt

You are now an Archive Master! 📦
EOF

# ===================
# COMPARISON CHAMBER (Tier 2: diff)
# ===================
mkdir -p portal_chamber/masters_tower/comparison_chamber

cat > portal_chamber/masters_tower/comparison_chamber/README.txt << 'EOF'
⚖️  THE COMPARISON CHAMBER ⚖️

Two ancient prophecies have been discovered.
They appear nearly identical... but one has been corrupted!

Learn the DIFF spell to find the differences!

Used by developers every day for:
• Comparing code versions
• Finding changes in config files
• Code reviews
• Git version control
EOF

# Create two similar files with differences
cat > portal_chamber/masters_tower/comparison_chamber/prophecy_original.txt << 'EOF'
THE ANCIENT PROPHECY

When the three keys are united,
And the dragon falls to slumber,
The treasure shall be revealed,
To the one who speaks the words of power.

The path is fraught with danger,
Yet knowledge lights the way,
Master the terminal arts,
And victory shall be yours this day.

Beware the false prophecy,
For corruption seeks to mislead,
Trust in the original text,
And let wisdom be your creed.
EOF

cat > portal_chamber/masters_tower/comparison_chamber/prophecy_corrupted.txt << 'EOF'
THE ANCIENT PROPHECY

When the three keys are united,
And the dragon falls to slumber,
The treasure shall be concealed,
To the one who speaks the words of power.

The path is fraught with peril,
Yet knowledge lights the way,
Master the terminal arts,
And victory shall be yours someday.

Beware the false prophecy,
For corruption seeks to mislead,
Trust in the original text,
And let wisdom be your creed.
EOF

cat > portal_chamber/masters_tower/comparison_chamber/diff_scroll.txt << 'EOF'
🔍 THE DIFF SCROLL 🔍

⚡ NEW SPELL: diff

Compare two files and show the differences!

Basic usage:
• diff file1.txt file2.txt

USEFUL FLAGS:
• diff -u file1 file2     (unified format - easier to read)
• diff -y file1 file2     (side-by-side comparison)
• diff -q file1 file2     (quiet - just say if different)
• diff -r dir1/ dir2/     (compare entire directories!)

TRY IT:
  diff prophecy_original.txt prophecy_corrupted.txt
  diff -u prophecy_original.txt prophecy_corrupted.txt
  diff -y prophecy_original.txt prophecy_corrupted.txt

READING DIFF OUTPUT:
• < means line is in first file
• > means line is in second file  
• Numbers show line positions
• c = changed, d = deleted, a = added

REAL-WORLD USES:
  diff old_config.conf new_config.conf
  diff -u version1.py version2.py > changes.patch
  git diff (uses diff under the hood!)

POWER COMBO:
  diff <(sort file1.txt) <(sort file2.txt)
  (compare sorted versions!)

Find the differences in the prophecies!
Which one is the true prophecy?
EOF

cat > portal_chamber/masters_tower/comparison_chamber/challenge.txt << 'EOF'
⚖️  PROPHECY COMPARISON CHALLENGE ⚖️

Two prophecies have been discovered:
• prophecy_original.txt
• prophecy_corrupted.txt

They look almost identical, but the corrupted version
has been altered by dark magic!

Your mission:
1. Use diff to find the differences
2. Identify what was changed
3. Determine which prophecy is true

Try:
  diff prophecy_original.txt prophecy_corrupted.txt
  diff -u prophecy_original.txt prophecy_corrupted.txt
  diff -y prophecy_original.txt prophecy_corrupted.txt

Can you spot all the changes?

Hint: Look at line 4 and line 7!
EOF

# ===================
# BINARY MYSTERIES (strings - already added earlier)
# ===================
mkdir -p portal_chamber/masters_tower/binary_mysteries

cat > portal_chamber/masters_tower/binary_mysteries/strings_mastery.txt << 'EOF'
🔮 MASTERY OF STRING EXTRACTION 🔮

You've already learned the basics of 'strings' in the treasury!
Now let's go deeper...

ADVANCED OPTIONS:
• strings -n 5 file      (minimum 5 chars - filter noise)
• strings -n 10 file     (minimum 10 chars - cleaner output)
• strings -t x file      (show hex offsets)
• strings -a file        (scan entire file)

COMBINE WITH OTHER SPELLS:
• strings binary | grep "password"
• strings binary | wc -l
• strings *.bin | sort | uniq
• strings binary | head -20

REAL-WORLD ANALYSIS:
Try on system binaries (read-only, safe):
  strings /bin/ls | grep "version"
  strings /bin/cat | head -20
  strings /usr/bin/vim | grep -i "copyright"

You can even analyze compiled programs!

SECURITY APPLICATIONS:
• Finding hardcoded passwords in binaries
• Reverse engineering malware
• Forensics investigation
• CTF (Capture The Flag) competitions
• Analyzing unknown file types
EOF

cat > portal_chamber/masters_tower/binary_mysteries/mystery.bin << 'EOF'
���BINARY HEADER���
���MAGIC BYTES: 7F 45 4C 46���
���compiled executable data���

SECRET_FLAG{you_found_the_hidden_message}
version_1.2.3_ancient_build
compiled_date: 2024-12-27

���more binary data���
DEVELOPER_NOTE: "TODO: Remove this debug code before release"
HIDDEN_PASSWORD: "WizardMaster2000"
API_KEY: "sk_live_abc123xyz789"

���compressed section���
ACHIEVEMENT_UNLOCKED: "Binary Detective"
MASTER_TITLE: "String Extraction Expert"
���end of file���
EOF

cat > portal_chamber/masters_tower/binary_mysteries/challenge.txt << 'EOF'
🎯 BINARY MYSTERY CHALLENGE 🎯

The file 'mystery.bin' is a corrupted ancient executable.

Your mission:
1. Extract all readable strings
2. Find the SECRET_FLAG
3. Find the HIDDEN_PASSWORD
4. Find the API_KEY
5. Discover what was supposed to be removed before release

Commands to try:
  strings mystery.bin
  strings mystery.bin | grep "SECRET"
  strings mystery.bin | grep "PASSWORD"
  strings mystery.bin | grep "API"
  strings -n 10 mystery.bin  (longer strings only)

This is how security researchers analyze malware!
This is how developers find bugs in compiled code!
This is how hackers discover hidden secrets!

You are now a Binary Wizard! 🔍

BONUS: Try this on real system files (safe to read):
  strings /bin/bash | grep -i "bash"
EOF

# ===================
# TRANSFORMATION WORKSHOP (Tier 3: sed, awk)
# ===================
mkdir -p portal_chamber/masters_tower/transformation_workshop

cat > portal_chamber/masters_tower/transformation_workshop/README.txt << 'EOF'
🔮 THE TRANSFORMATION WORKSHOP 🔮

⚠️  ADVANCED MAGIC AHEAD ⚠️

This chamber contains the most POWERFUL text manipulation spells:
• sed - Stream EDitor
• awk - Pattern scanning and processing language

These are programming languages built into your terminal!

Used by system administrators and developers for:
• Automated text transformations
• Log processing
• Data extraction and manipulation
• Configuration file updates

Warning: These are complex but incredibly powerful!
Master these and you will be a TRUE Terminal Wizard!
EOF

cat > portal_chamber/masters_tower/transformation_workshop/sed_scroll.txt << 'EOF'
✨ THE SED SCROLL ✨

⚡ ADVANCED SPELL: sed (Stream EDitor)

Sed transforms text like magic!

BASIC SUBSTITUTION:
• sed 's/old/new/' file.txt          (replace first occurrence per line)
• sed 's/old/new/g' file.txt         (replace all occurrences)
• sed 's/old/new/gi' file.txt        (case-insensitive)

SAVE CHANGES:
• sed -i 's/old/new/g' file.txt      (modify file in-place)
• sed 's/old/new/g' file.txt > new.txt  (save to new file)

DELETE LINES:
• sed '/pattern/d' file.txt          (delete lines matching pattern)
• sed '1d' file.txt                  (delete first line)
• sed '$d' file.txt                  (delete last line)

PRINT SPECIFIC LINES:
• sed -n '5p' file.txt               (print line 5)
• sed -n '1,10p' file.txt            (print lines 1-10)

TRY IT:
  echo "Hello World" | sed 's/World/Universe/'
  echo "foo bar foo" | sed 's/foo/baz/g'

REAL-WORLD EXAMPLES:
  sed 's/http:/https:/g' urls.txt
  sed -i 's/DEBUG/INFO/g' config.txt
  sed '/^#/d' file.txt               (remove comment lines)
  sed 's/  */ /g' messy.txt          (collapse multiple spaces)

POWER COMBINATIONS:
  grep "ERROR" log.txt | sed 's/^/> /' 
  (add > prefix to error lines)

Sed is like find-and-replace on steroids!
EOF

cat > portal_chamber/masters_tower/transformation_workshop/awk_scroll.txt << 'EOF'
⚡ THE AWK SCROLL ⚡

⚡ ADVANCED SPELL: awk

AWK is a full programming language for text processing!

BASIC USAGE:
• awk '{print}' file.txt             (print all lines)
• awk '{print $1}' file.txt          (print first column)
• awk '{print $2}' file.txt          (print second column)
• awk '{print $1, $3}' file.txt      (print columns 1 and 3)

PATTERN MATCHING:
• awk '/pattern/ {print}' file.txt   (print lines matching pattern)
• awk '/ERROR/ {print $0}' log.txt   (print error lines)
• awk '$3 > 100' data.txt            (print if column 3 > 100)

FIELD SEPARATOR:
• awk -F',' '{print $1}' file.csv    (use comma as separator)
• awk -F':' '{print $1}' /etc/passwd (use colon)

CALCULATIONS:
• awk '{sum += $1} END {print sum}' numbers.txt  (sum first column)
• awk '{print $1 * $2}' data.txt                 (multiply columns)

TRY IT:
  echo "apple 5\nbanana 3\ncherry 8" | awk '{print $1}'
  echo "10 20\n30 40" | awk '{print $1 + $2}'

REAL-WORLD EXAMPLES:
  ls -l | awk '{print $9, $5}'       (filename and size)
  awk -F',' '{print $2}' data.csv    (extract 2nd column from CSV)
  ps aux | awk '{print $1, $11}'     (user and command)
  awk '/ERROR/ {count++} END {print count}' log.txt  (count errors)

POWER EXAMPLES:
  # Print lines longer than 80 characters
  awk 'length > 80' file.txt
  
  # Sum all numbers in column 2
  awk '{sum += $2} END {print "Total:", sum}' data.txt
  
  # Print unique values in column 1
  awk '!seen[$1]++' file.txt

AWK is incredibly powerful for data processing!
EOF

cat > portal_chamber/masters_tower/transformation_workshop/challenge.txt << 'EOF'
🎯 TRANSFORMATION CHALLENGE 🎯

Create a test file:
  echo -e "apple,5,red\nbanana,3,yellow\ncherry,8,red\ndate,2,brown" > fruits.csv

SED CHALLENGES:
1. Replace all commas with pipes:
   sed 's/,/|/g' fruits.csv

2. Replace 'red' with 'crimson':
   sed 's/red/crimson/g' fruits.csv

3. Delete lines containing 'banana':
   sed '/banana/d' fruits.csv

AWK CHALLENGES:
1. Print just the fruit names (column 1):
   awk -F',' '{print $1}' fruits.csv

2. Print fruits with quantity > 3:
   awk -F',' '$2 > 3 {print $1}' fruits.csv

3. Calculate total quantity:
   awk -F',' '{sum += $2} END {print "Total:", sum}' fruits.csv

4. Print red fruits only:
   awk -F',' '/red/ {print $1}' fruits.csv

MASTER CHALLENGE:
Combine grep, sed, and awk:
  cat fruits.csv | grep "red" | sed 's/,/ /g' | awk '{print $1, "quantity:", $2}'

You are now a Transformation Master! 🔮
EOF

cat > portal_chamber/masters_tower/completion_scroll.txt << 'EOF'
🎓 MASTERS TOWER COMPLETION 🎓

═══════════════════════════════════════════════════════════

Congratulations, Terminal Master!

You have completed ALL chambers of the Masters Tower:

✓ Text Processing Lab
  • head/tail - File preview
  • wc - Counting
  • sort/uniq - Organization and deduplication
  • cut - Column extraction

✓ Archive Vault
  • tar - Archiving
  • gzip/gunzip - Compression

✓ Comparison Chamber
  • diff - File comparison

✓ Binary Mysteries
  • strings - Binary text extraction

✓ Transformation Workshop
  • sed - Stream editing
  • awk - Pattern processing

You now possess knowledge that many seasoned developers
have taken YEARS to accumulate!

═══════════════════════════════════════════════════════════

YOUR TERMINAL WIZARD RANK: ⭐⭐⭐⭐⭐ GRANDMASTER+

You are ready for:
• Professional software development
• System administration
• DevOps and automation
• Security research
• Data science workflows

═══════════════════════════════════════════════════════════

WHAT'S NEXT?

Continue your journey:
• Practice daily - use these tools in real work
• Explore man pages for deeper knowledge
• Learn shell scripting (bash/zsh)
• Study regular expressions (regex)
• Contribute to open source
• Teach others what you've learned

The terminal is now your playground!

May your commands always execute successfully!
     -- The Order of Terminal Masters

═══════════════════════════════════════════════════════════
EOF

# ===================
# TREASURY AND DRAGON
# ===================
mkdir -p armory/treasury

cat > armory/treasury/locked_door.txt << 'EOF'
🔒 THE TREASURY DOOR 🔒

Three keyholes glimmer in the torchlight.
You insert all three keys...

The door swings open with a groan!

Ahead lies the dragon_lair.

Remember what you learned:
• You read about the dragon in the library
• You learned the echo spell
• The dragon has a TRUE NAME (check scroll_13.txt in library)
EOF

cat > armory/treasury/history_scroll.txt << 'EOF'
📜 SCROLL OF MEMORY 📜

⚡ NEW SPELL: history

The 'history' spell shows ALL commands you've used!

Try these:
• history              (see all your commands)
• history | grep cd    (find all cd commands)
• history | tail -20   (last 20 commands)
• !123                 (repeat command #123)
• !!                   (repeat last command)

Press UP ARROW to cycle through previous commands!
Press CTRL+R to search your history!

This is your adventure's memory!
EOF

mkdir -p armory/treasury/dragon_lair

cat > armory/treasury/dragon_lair/dragon.txt << 'EOF'
🐉 A MASSIVE DRAGON AWAKENS! 🐉

The dragon's eyes glow red!
Smoke pours from its nostrils!

"Who dares disturb my slumber?"

You must speak the ancient incantation to put it to sleep!

The incantation has TWO parts:
1. The sleep spell (found in library/dragon_lore.txt)
2. The dragon's TRUE NAME (hidden in library/archives - one of 2000 scrolls!)

But wait... the dragon has left you an encrypted riddle:

-----BEGIN DRAGON RIDDLE-----
TXkgdHJ1ZSBuYW1lIGlzIGhpZGRlbiBpbiBzY3JvbGwgIzA2NjYuIFVzZSBncmVw
IHRvIGZpbmQgaXQhIFNlYXJjaGluZyBmb3IgIklnbmlzIiBvciBkcmFnb24ncyAi
dHJ1ZSBuYW1lIiB3aWxsIGhlbHAuCg==
-----END DRAGON RIDDLE-----

Decode this hint with: echo "TXkgdHJ..." | base64 -d

To face the dragon, run: ./sleep_dragon.sh

You must speak BOTH parts together in ONE command!
Hint: echo "first_part second_part"
EOF

# Create the interactive dragon fight script!
cat > armory/treasury/dragon_lair/sleep_dragon.sh << 'EOF'
#!/bin/bash
echo ""
echo "🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉"
echo "🐉  THE DRAGON AWAKENS!  🐉"
echo "🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉🐉"
echo ""
echo "🐉 The dragon roars: 'Speak the words of power, or face my flames!'"
echo ""
echo "Speak the incantation (hint: it has two parts - the sleep spell and my true name):"
read -r incantation

if [[ "$incantation" == *"somnum draconis"* && "$incantation" == *"Ignis Maximus"* ]]; then
    echo ""
    echo "✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨"
    echo "✨ The dragon's eyes grow heavy..."
    echo "✨ Its breathing slows..."
    echo "✨ It collapses into deep slumber!"
    echo "✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨"
    echo ""
    echo "🎉 The path to the treasure_room is now clear!"
    echo ""
    echo "Enter with: cd treasure_room"
    echo "Then run: ./WELCOME.sh"
    echo ""
elif [[ "$incantation" == *"somnum draconis"* ]]; then
    echo ""
    echo "🐉 The dragon yawns slightly..."
    echo "🐉 'You know the sleep spell, but you haven't addressed me by my TRUE NAME!'"
    echo "🐉 'Find my name in the ancient scrolls!' (Hint: try grep in the library)"
    echo ""
elif [[ "$incantation" == *"Ignis Maximus"* ]]; then
    echo ""
    echo "🐉 The dragon's eyes widen!"
    echo "🐉 'You know my name, but the sleep spell is still needed!'"
    echo "🐉 'Seek the dragon lore in the library!'"
    echo ""
else
    echo ""
    echo "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
    echo "🔥 WRONG! The dragon breathes FIRE!"
    echo "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
    echo ""
    echo "💀 You take massive damage and flee back to the armory!"
    echo ""
    echo "Hint: You need BOTH the sleep spell AND the dragon's true name."
    echo "      - Sleep spell: check library/dragon_lore.txt"
    echo "      - True name: use grep to search library scrolls"
    echo ""
fi
EOF
chmod +x armory/treasury/dragon_lair/sleep_dragon.sh

mkdir -p armory/treasury/dragon_lair/treasure_room

# Victory script!
cat > armory/treasury/dragon_lair/treasure_room/WELCOME.sh << 'EOF'
#!/bin/bash
echo ""
echo "✨🎉🏆🎊✨🎉🏆🎊✨🎉🏆🎊"
echo "✨                          ✨"
echo "🎉   CONGRATULATIONS!!!    🎉"
echo "🏆   YOU FOUND THE         🏆"
echo "🎊   LEGENDARY TREASURE!   🎊"
echo "✨                          ✨"
echo "✨🎉🏆🎊✨🎉🏆🎊✨🎉🏆🎊"
echo ""
echo "🎺 *FANFARE PLAYS* 🎺"
echo ""
echo "You have completed the Terminal Dungeon and proven yourself"
echo "a true TERMINAL WIZARD!"
echo ""
echo "Read your rewards:"
echo "  cat TREASURE.txt"
echo "  cat final_wisdom.txt"
echo ""
EOF
chmod +x armory/treasury/dragon_lair/treasure_room/WELCOME.sh

cat > armory/treasury/dragon_lair/treasure_room/TREASURE.txt << 'EOF'
💎💎💎 THE LEGENDARY TREASURE! 💎💎💎

🏆 CONGRATULATIONS, TERMINAL MASTER! 🏆

You have conquered the EPIC Terminal Dungeon!

SPELLS MASTERED:
✓ Basic Navigation: ls, cd, pwd, cat
✓ Manual System: man
✓ Searching: grep, find
✓ Permissions: chmod
✓ Patterns: Wildcards (*, ?, [])
✓ Output: echo, redirection (>, >>)
✓ File Operations: cp, mv, rm, mkdir, touch
✓ Processes: ps, top, kill, jobs, bg, fg
✓ Networking: ping, curl, wget
✓ Power Tools: pipes (|), aliases
✓ Memory: history

YOUR TERMINAL WIZARD RANK: ⭐⭐⭐⭐⭐ GRANDMASTER!

===========================================
THE JOURNEY CONTINUES:

Advanced topics to explore:
• vim/nano (text editing)
• awk/sed (text processing)
• bash scripting (write your own programs!)
• git (version control)
• package managers (apt, brew, yum)
• system administration (systemctl, cron)

Your adventure has only begun!
===========================================
EOF

cat > armory/treasury/dragon_lair/treasure_room/final_wisdom.txt << 'EOF'
📖 THE BOOK OF FINAL WISDOM 📖

Young wizard, you have learned well.

Remember:
1. man is your best friend - read the manuals!
2. Google and Stack Overflow are full of wizards helping others
3. Practice in safe environments first (like this dungeon!)
4. The terminal is powerful - with power comes responsibility
5. Every expert was once a beginner

Your next steps:
• Set up a Raspberry Pi
• Manage a web server
• Automate tasks with bash scripts
• Contribute to open source projects
• Build your own tools

The terminal is not just a tool.
It's a way of thinking about computers.

You are now a Terminal Wizard.
Use your powers wisely!

     -- The Ancient Order of Terminal Wizards

P.S. - Did you find the secret ending? ;)
EOF

# ===================
# SECRET ENDING
# ===================
mkdir -p .secret_realm

cat > .secret_realm/secret_entrance.txt << 'EOF'
✨ THE SECRET REALM ✨

You found the hidden realm!

To discover hidden files and directories, use:
• ls -a    (show ALL, including hidden)
• ls -la   (show ALL with details)

Files and directories starting with . are hidden by default!
This is how configuration files work in Unix/Linux!

Examples of important hidden files:
• ~/.bashrc    (bash configuration)
• ~/.ssh/      (SSH keys)
• ~/.gitconfig (git settings)

This realm contains the ultimate secret...
Explore deeper with: ls -la
EOF

cat > .secret_realm/master_scroll.txt << 'EOF'
🌟 THE MASTER SCROLL 🌟

You have found the SECRET ENDING!

The greatest spell of all is not a command,
but an attitude:

• Curiosity - always explore (you used ls -a!)
• Patience - mastery takes time  
• Experimentation - try things safely
• Documentation - read, learn, share
• Community - help others on their journey

You are not just a Terminal Wizard.
You are now a TEACHER.

Share what you've learned with others.
Guide new wizards on their path.

The cycle continues.

🎓 ACHIEVEMENT UNLOCKED: Terminal Sage 🎓

Now go forth and create your own adventures!
EOF

# Create a cheat sheet
cat > CHEAT_SHEET.txt << 'EOF'
📋 TERMINAL DUNGEON CHEAT SHEET 📋

NAVIGATION:
• ls          List contents
• ls -l       List with details
• ls -a       Show hidden files
• cd <dir>    Change directory
• cd ..       Go up one level
• pwd         Show current location

READING:
• cat <file>  Read file
• man <cmd>   Read manual
• less <file> Read long files (q to quit)

SEARCHING:
• grep <text> <files>   Search in files
• find . -name <name>   Find files

FILES:
• mkdir <dir>    Create directory
• touch <file>   Create empty file
• cp <src> <dst> Copy
• mv <src> <dst> Move/rename
• rm <file>      Delete (careful!)
• chmod +r       Add read permission

POWER:
• echo <text>    Print text
• >              Redirect to new file
• >>             Append to file
• |              Pipe (chain commands)
• history        Show command history

PROCESSES:
• ps             Show processes
• top            Live process view
• <cmd> &        Run in background
• jobs           Show background jobs
• fg             Bring to foreground

NETWORK:
• ping <host>    Check connection
• curl <url>     Fetch from internet
• wget <url>     Download file

TIPS:
• Tab           Auto-complete
• Up/Down       Previous commands
• Ctrl+C        Cancel current command
• Ctrl+D        Exit/logout
• Ctrl+R        Search history
• Ctrl+L        Clear screen
EOF

echo ""
echo "✨ EPIC Terminal Dungeon created successfully! ✨"
echo ""
echo "📚 LEGENDARY DUNGEON INCLUDES:"
echo "   - 3 Main areas (Library, Armory, Portal Chamber)"
echo "   - 3 Basic Realms (Ice Castle, Fire Mountain, Sky Tower)"
echo "   - 🏰 NEW: Masters Tower (Advanced post-game content)"
echo "   - 2000+ ancient scrolls to search through!"
echo "   - 35+ commands to discover progressively"
echo "   - INTERACTIVE dragon boss fight"
echo "   - Hidden archives (. prefix) with secrets"
echo "   - Binary file challenges (strings)"
echo "   - Cryptography puzzles (base64)"
echo "   - Text editor training (nano/vim)"
echo "   - Complete cheat sheet + hints"
echo ""
echo "🐉 EPIC FEATURES:"
echo "   ✓ Dragon validates your incantation!"
echo "   ✓ 2000 scrolls organized in sections/bookshelves"
echo "   ✓ Hidden .secret_archives (need ls -a)"
echo "   ✓ Binary artifacts (strings extraction)"
echo "   ✓ Victory fanfare when you win"
echo "   ✓ Three cryptographic keys (base64)"
echo ""
echo "🏰 MASTERS TOWER (Post-Game):"
echo "   ✓ Text Processing Lab (head, tail, wc, sort, uniq, cut)"
echo "   ✓ Archive Vault (tar, gzip)"
echo "   ✓ Comparison Chamber (diff)"
echo "   ✓ Binary Mysteries (strings advanced)"
echo "   ✓ Transformation Workshop (sed, awk)"
echo ""
echo "To begin your epic adventure:"
echo "  cd terminal_dungeon"
echo "  cat welcome.txt"
echo ""
echo "⚠️  LIBRARY CHALLENGE:"
echo "    The library has 4 sections with 2000 scrolls in archives!"
echo "    Use 'grep -r' to search recursively through all sections:"
echo "    cd library"
echo "    grep -r 'dragon' ."
echo ""
echo "If you get stuck:"
echo "  cat HINTS.txt"
echo "  cat CHEAT_SHEET.txt"
echo ""
echo "🎮 PROGRESSION:"
echo "    1. Complete main quest (dragon fight)"
echo "    2. Unlock Masters Tower for advanced training"
echo "    3. Master all 35+ terminal commands"
echo ""
echo "Good luck, brave adventurer! 🗡️ ⚔️ 🏰 🐉"
