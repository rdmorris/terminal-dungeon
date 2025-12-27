#!/bin/sh

# Terminal Dungeon - An Interactive POSIX Shell Learning Adventure
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
• ls         - REVEAL what is in this room
• cd <dir>   - Enter a room (like: cd library)
• cd ..      - Go back to the previous room
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
EOF

# ===================
# LIBRARY - Man pages and grep
# ===================
mkdir -p library

cat > library/entrance_scroll.txt << 'EOF'
📚 LIBRARY ENTRANCE 📚

You stand in a grand library. Thousands of ancient scrolls line the walls.
The head librarian approaches... Try: cat librarian_greeting.txt
EOF

cat > library/librarian_greeting.txt << 'EOF'
👴 THE HEAD LIBRARIAN 👴

"Welcome, young wizard! I am the keeper of knowledge.
⚡ NEW SPELL UNLOCKED: man

The 'man' spell (short for 'manual') reveals EVERYTHING about a spell!
Try these:
• man ls
• man cat
Press 'q' to quit the manual when you're done reading.
EOF

cat > library/silver_key.txt << 'EOF'
🗝️  THE SILVER KEY! 🗝️
You found the first key! (Key 1 of 3)
EOF

# Create many scroll files for grep practice (POSIX style loop)
i=1
while [ "$i" -le 20 ]; do
  cat > "library/scroll_$i.txt" << EOF
Ancient Scroll #$i
This scroll contains historical records.
Date: Year $(( 1000 + i * 10 ))
Weather: Cloudy
EOF
  i=$((i + 1))
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

cat > library/dragon_lore.txt << 'EOF'
📜 DRAGON LORE 📜
To put a dragon to sleep, one must chant the words: "somnum draconis"
EOF

mkdir -p library/secret_archives
cat > library/secret_archives/gold_key.txt << 'EOF'
🗝️  THE GOLDEN KEY! 🗝️
You found the second key! (Key 2 of 3)
EOF

# ===================
# ARMORY - Permissions and wildcards
# ===================
mkdir -p armory

cat > armory/entrance_note.txt << 'EOF'
⚔️  THE ARMORY ⚔️
Try: ls -l
Notice the letters at the start? Those are PERMISSIONS.
EOF

cat > armory/bronze_key.txt << 'EOF'
🗝️  THE BRONZE KEY! 🗝️
(Key 3 of 3) All three keys are yours!
EOF

# Create a locked scroll
cat > armory/locked_scroll.txt << 'EOF'
🔒 This scroll is magically sealed! Use 'chmod +r' to read it.
EOF
chmod 000 armory/locked_scroll.txt

# Create weapon files for wildcard practice (POSIX style loop)
i=1
while [ "$i" -le 5 ]; do
  cat > "armory/weapon_$i.txt" << EOF
⚔️  Weapon #$i: Ancient Sword
Damage: $(( i * 10 ))
EOF
  i=$((i + 1))
done

# ===================
# TREASURY AND DRAGON
# ===================
mkdir -p armory/treasury
mkdir -p armory/treasury/dragon_lair

# The Dragon Fight Script (POSIX Compliant)
cat > armory/treasury/dragon_lair/sleep_dragon.sh << 'EOF'
#!/bin/sh
echo ""
echo "🐉 THE DRAGON AWAKENS! 🐉"
echo ""
echo "🐉 The dragon roars: 'Speak the words of power, or face my flames!'"
echo "Speak the incantation (The sleep spell and my true name):"
read -r incantation

case "$incantation" in
    *"somnum draconis"* )
        case "$incantation" in
            *"Ignis Maximus"* )
                echo "✨ The dragon collapses into deep slumber!"
                echo "🎉 The path to the treasure_room is now clear!"
                echo "Enter with: cd treasure_room && ./WELCOME.sh"
                ;;
            * )
                echo "🐉 'You know the sleep spell, but not my TRUE NAME!'"
                ;;
        esac
        ;;
    *"Ignis Maximus"* )
        echo "🐉 'You know my name, but the sleep spell is still needed!'"
        ;;
    * )
        echo "🔥🔥 WRONG! The dragon breathes FIRE! 💀"
        ;;
esac
EOF
chmod +x armory/treasury/dragon_lair/sleep_dragon.sh

# Victory script
mkdir -p armory/treasury/dragon_lair/treasure_room
cat > armory/treasury/dragon_lair/treasure_room/WELCOME.sh << 'EOF'
#!/bin/sh
echo "✨🎉🏆 CONGRATULATIONS! YOU WON! 🏆🎉✨"
cat TREASURE.txt
EOF
chmod +x armory/treasury/dragon_lair/treasure_room/WELCOME.sh

cat > armory/treasury/dragon_lair/treasure_room/TREASURE.txt << 'EOF'
💎💎💎 THE LEGENDARY TREASURE! 💎💎💎
You are now a Terminal Wizard!
EOF

# ===================
# PORTALS & OTHER REALMS
# ===================
mkdir -p portal_chamber
mkdir -p portal_chamber/ice_castle
mkdir -p portal_chamber/fire_mountain
mkdir -p portal_chamber/sky_tower

# Secret Ending
mkdir -p .secret_realm
cat > .secret_realm/master_scroll.txt << 'EOF'
🌟 THE MASTER SCROLL 🌟
You found the hidden realm using 'ls -a'!
EOF

# Cheat Sheet
cat > CHEAT_SHEET.txt << 'EOF'
📋 POSIX QUICK REF 📋
ls, cd, pwd, cat, cp, mv, rm, mkdir, chmod, grep, find
EOF

echo "✨ POSIX Terminal Dungeon created! ✨"
echo "To start: cd terminal_dungeon && cat welcome.txt"
