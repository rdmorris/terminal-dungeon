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
• Silver key: In the library
• Gold key: In library's secret_archives
• Bronze key: In the armory

DRAGON TIPS:
• Read library/dragon_lore.txt for the sleep spell
• Use 'grep "SECRET" library/*.txt' to find the dragon's name
• You need BOTH parts in one command: ./sleep_dragon.sh

STUCK ON GREP?
• Try: grep "GOLD_KEY" library/*.txt
• This searches all .txt files in library for "GOLD_KEY"

HIDDEN SECRET:
• Use 'ls -a' to see hidden files and directories
• Look for things starting with .

NEED THE CHEAT SHEET?
• cat CHEAT_SHEET.txt

Remember: Exploration and experimentation are key!
Every scroll you read teaches you something new!
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

Some scrolls here contain secrets. You'll need another spell to find them..."
EOF

cat > library/silver_key.txt << 'EOF'
🗝️  THE SILVER KEY! 🗝️

You found the first key!
(Key 1 of 3)

The librarian nods approvingly.
"Two more keys remain. One lies in my secret archives..."
EOF

# Create many scroll files for grep practice
for i in {1..20}; do
  cat > library/scroll_$i.txt << EOF
Ancient Scroll #$i

This scroll contains historical records.
Date: Year $(( 1000 + i * 10 ))
Weather: Cloudy
EOF
done

# Hide the important scroll
cat > library/scroll_13.txt << 'EOF'
Ancient Scroll #13

This scroll contains historical records.
Date: Year 1130
SECRET CLUE: The dragon's true name is "Ignis Maximus"
Weather: Stormy
Hidden message: GOLD_KEY_LOCATION=secret_archives
EOF

cat > library/search_scroll.txt << 'EOF'
🔍 SCROLL OF SEARCHING 🔍

"Young wizard, the library has thousands of scrolls.
Reading each one would take years!

⚡ NEW SPELL UNLOCKED: grep

The GREP spell searches for words inside files!

Try these:
• grep "SECRET" scroll_*.txt
• grep "GOLD_KEY" *.txt
• grep -n "dragon" *.txt  (shows line numbers)
• grep -i "secret" *.txt  (ignores case)

Use 'man grep' to learn more!

Hint: One of the scrolls here contains a SECRET CLUE about
the dragon and the GOLD_KEY_LOCATION. Find it!"
EOF

mkdir -p library/secret_archives

cat > library/secret_archives/gold_key.txt << 'EOF'
🗝️  THE GOLDEN KEY! 🗝️

You found the second key using your searching skills!
(Key 2 of 3)

"Excellent work!" says the librarian.
"You've mastered grep. But there's one more spell you need here..."
EOF

cat > library/secret_archives/find_scroll.txt << 'EOF'
🔎 SCROLL OF SEEKING 🔎

⚡ NEW SPELL UNLOCKED: find

While GREP searches INSIDE files, FIND searches FOR files!

Try these:
• find . -name "*.txt"           (find all .txt files)
• find . -name "*key*"           (find files with 'key' in name)
• find . -type d                 (find all directories)
• find . -name "*.txt" | wc -l   (count txt files)

The library is vast. Use 'find' to discover hidden chambers!
EOF

cat > library/secret_archives/pwd_scroll.txt << 'EOF'
📍 SCROLL OF LOCATION 📍

⚡ NEW SPELL: pwd

This spell shows your EXACT location in the dungeon!
Essential when paths become complex.

Try: pwd
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

All three keys are yours! The treasury awaits!
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

Here you can create your OWN custom spells!

⚡ NEW SPELL: alias

Aliases let you create shortcuts for complex commands!

Try these:
• alias teleport='cd'
• teleport ..
• alias reveal='ls -la'
• reveal

These shortcuts only last while you're in the dungeon.
To make them permanent, you'd add them to ~/.bashrc

Use 'man bash' and search for 'alias' to learn more!
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

Three ancient portals stand before you, each leading to a different realm!

⚡ NEW SPELL: ssh (Secure Shell - Teleportation Magic)

SSH lets you teleport to other castles/realms!

The syntax is: ssh username@hostname

For practice in this dungeon, we have three local realms:
• ice_castle
• fire_mountain  
• sky_tower

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
2. The dragon's TRUE NAME (hidden in library/scroll_13.txt)

To face the dragon, run: ./sleep_dragon.sh

You must speak BOTH parts together in ONE command!
Hint: echo "first_part second_part"

Use grep to find the clues if you haven't already!
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
echo "   - 3 Realms (Ice Castle, Fire Mountain, Sky Tower)"
echo "   - 20+ spells to discover progressively"
echo "   - INTERACTIVE dragon boss fight"
echo "   - Secret ending with hidden realm"
echo "   - Text editor training (nano/vim)"
echo "   - Complete cheat sheet + hints"
echo ""
echo "🐉 NEW FEATURES:"
echo "   ✓ Dragon actually checks your incantation!"
echo "   ✓ Victory fanfare when you win"
echo "   ✓ Text editing lessons"
echo "   ✓ Hidden realm with ls -a"
echo "   ✓ Hints file for when stuck"
echo ""
echo "To begin your epic adventure:"
echo "  cd terminal_dungeon"
echo "  cat welcome.txt"
echo ""
echo "If you get stuck:"
echo "  cat HINTS.txt"
echo "  cat CHEAT_SHEET.txt"
echo ""
echo "🎮 TIP: The dragon fight is REAL - you must speak the"
echo "    correct incantation by running ./sleep_dragon.sh"
echo "    in the dragon_lair directory!"
echo ""
echo "Good luck, brave adventurer! 🗡️ ⚔️ 🏰 🐉"
