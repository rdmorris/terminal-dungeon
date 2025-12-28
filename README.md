# 🏰 Terminal Dungeon

An epic, immersive dungeon crawler that teaches Unix/Linux terminal commands through adventure, cryptography, and puzzle-solving!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-blue.svg)]()

## 🎮 What is Terminal Dungeon?

Terminal Dungeon transforms your shell into an interactive RPG where the filesystem becomes your game world. Navigate through rooms (directories), decode cryptographic keys, search through thousands of ancient scrolls, and defeat a dragon—all while mastering real terminal commands!

**What makes this special:**
- 🗺️ **2000+ files** organized in a realistic multi-level library structure
- 🔐 **Real cryptography** - Base64 encoding/decoding of keys
- 🐉 **Interactive boss fight** that validates your command knowledge
- 📚 **Progressive learning** - start simple, discover advanced techniques organically
- 🎯 **Learn by doing** - experience the pain points before discovering solutions
- 💡 **Modern DevOps skills** - environment variables, aliases, recursive search

**Perfect for:**
- Kids learning their first terminal commands (ages 8+)
- Adults wanting to learn bash in a fun, engaging way
- Teachers looking for interactive command-line curriculum
- Anyone who wants to gamify their terminal learning

## ✨ Features

### 🏛️ Massive Multi-Level Library
- **4 themed sections**: Ancient History, Dragon Lore, Magical Arts, Reference
- **10 bookshelves** in the archives, each containing 200 scrolls
- **Hidden directories** teaching dotfile concepts
- **Realistic file hierarchy** mirroring real-world project structures

### 🔐 Cryptography Challenges
- **Base64-encoded keys** scattered throughout the dungeon
- **Three-part master passphrase** requiring information synthesis
- **Encrypted riddles** from the dragon itself
- Learn practical encoding/decoding used in real development

### 🎓 Progressive Skill Discovery
- **Start minimal**: Only `ls`, `cd`, `cat` at first
- **Feel the pain**: Navigate deeply nested directories manually
- **Discover solutions**: Find `grep -r`, environment variables, aliases
- **Experience relief**: "There's a better way!" moment in the Spell Forge
- **Master advanced techniques**: Recursive search, command chaining, automation

### 🐉 Interactive Dragon Boss Fight
- **Validates your incantation** - actually checks what you type
- **Requires knowledge synthesis** - combine clues from different locations
- **Uses decoded cryptography** - dragon riddle in Base64
- **Pattern matching validation** - must speak both sleep spell AND true name

### 🌀 Three Portal Realms
- **❄️ Ice Castle**: File operations (`cp`, `mv`, `rm`, `mkdir`, `touch`)
- **🔥 Fire Mountain**: Process management (`ps`, `top`, `kill`, `&`, `jobs`, `bg`, `fg`)
- **☁️ Sky Tower**: Networking (`ping`, `curl`, `wget`)

## 🚀 Quick Start

### Prerequisites

- Bash 4.0 or higher
- A Unix-like system (Linux, macOS, or Windows with WSL/Git Bash)
- Basic ability to navigate to a directory and run a script

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/terminal-dungeon.git
cd terminal-dungeon

# Make the setup script executable
chmod +x setup-dungeon.sh

# Run the setup script (creates ~2000 files, takes 10-30 seconds)
./setup-dungeon.sh

# Enter the dungeon!
cd terminal_dungeon
cat welcome.txt
```

That's it! Your adventure begins!

## 📖 What You'll Learn

### Core Navigation (Beginner)
- `ls` - List directory contents
- `ls -l` - Detailed listing
- `ls -a` - Show hidden files (dotfiles)
- `cd <dir>` - Change directory
- `cd ..` - Go to parent directory
- `pwd` - Print working directory
- `cat <file>` - Read file contents
- `man <command>` - Read command manuals

### Search & Discovery (Intermediate)
- `grep "text" file` - Search within files
- `grep -r "text" dir/` - **Recursive search** (essential!)
- `grep -i` - Case-insensitive search
- `grep -n` - Show line numbers
- `find . -name "pattern"` - Find files by name
- `find . -type d` - Find directories

### Cryptography & Encoding (Intermediate)
- `base64` - Encode text
- `base64 -d` - Decode Base64
- `echo "text" | base64` - Pipe to encode
- Extracting encoded data from files
- Combining decoded information

### Automation & Efficiency (Advanced)
- `export VAR=value` - Environment variables
- `export VAR=$(command)` - Store command output
- `alias name='command'` - Create shortcuts
- `$VARIABLE` - Use variables
- Command substitution with `$()`

### File Operations (Advanced)
- `mkdir` - Create directories
- `touch` - Create empty files
- `cp` - Copy files
- `mv` - Move/rename files
- `rm` - Delete files (carefully!)
- `chmod` - Change permissions

### Process Management (Advanced)
- `ps` - Show processes
- `top` - Live process monitor
- `command &` - Run in background
- `jobs` - List background jobs
- `fg/bg` - Foreground/background control

### Power Tools (Expert)
- `|` - Pipes (chain commands)
- `>` - Redirect output (overwrite)
- `>>` - Redirect output (append)
- `history` - Command history
- Combining multiple commands for complex tasks

## 🗺️ Dungeon Map

```
terminal_dungeon/
├── 📜 welcome.txt
├── 📜 quest_log.txt
├── 📜 HINTS.txt
├── 📜 CHEAT_SHEET.txt
│
├── 📚 library/
│   ├── 🗝️ silver_key.txt (Base64 encoded)
│   ├── entrance_scroll.txt
│   ├── librarian_greeting.txt
│   │
│   ├── reference/
│   │   ├── search_techniques/
│   │   │   ├── grep_guide.txt
│   │   │   └── find_guide.txt
│   │   └── cryptography/
│   │       └── base64_guide.txt
│   │
│   ├── dragon_lore/
│   │   ├── combat_techniques/
│   │   │   └── sleep_spells.txt
│   │   └── bestiary/
│   │       └── dragon_species.txt
│   │
│   ├── magical_arts/
│   │   └── enchantments/
│   │       └── echo_magic.txt
│   │
│   ├── ancient_history/           ⭐ THE ARCHIVE CHALLENGE!
│   │   ├── README.txt
│   │   ├── shelf_01/ (200 scrolls)
│   │   ├── shelf_02/ (200 scrolls)
│   │   ├── shelf_03/ (200 scrolls) 🐉 Dragon's true name
│   │   ├── shelf_04/ (200 scrolls)
│   │   ├── shelf_05/ (200 scrolls)
│   │   ├── shelf_06/ (200 scrolls) 🔍 Gold key clue
│   │   ├── shelf_07/ (200 scrolls)
│   │   ├── shelf_08/ (200 scrolls)
│   │   ├── shelf_09/ (200 scrolls)
│   │   └── shelf_10/ (200 scrolls)
│   │
│   └── .secret_archives/          🔒 HIDDEN!
│       ├── 🗝️ gold_key.txt (Base64 encoded)
│       ├── archival_note.txt
│       ├── find_scroll.txt
│       └── pwd_scroll.txt
│
├── ⚔️ armory/
│   ├── 🗝️ bronze_key.txt (Base64 encoded)
│   ├── permission_guide.txt
│   ├── enchanted_shield.txt
│   │
│   ├── hall_of_echoes/
│   │   ├── echo_chamber.txt
│   │   └── redirection_scroll.txt
│   │
│   ├── spell_forge/               💡 THE REVELATION!
│   │   ├── forge_intro.txt (teaches aliases & env vars)
│   │   └── piping_scroll.txt
│   │
│   └── treasury/
│       ├── locked_door.txt
│       ├── encrypted_passphrase.txt (Base64)
│       ├── unlock_treasury.sh (interactive script)
│       ├── cryptography_scroll.txt
│       │
│       └── dragon_lair/
│           ├── dragon.txt (encrypted riddle)
│           ├── sleep_dragon.sh ⚡ BOSS FIGHT!
│           │
│           └── treasure_room/
│               ├── WELCOME.sh (victory fanfare)
│               ├── 🏆 TREASURE.txt
│               └── final_wisdom.txt
│
├── 🌀 portal_chamber/
│   ├── portal_intro.txt
│   ├── how_portals_work.txt
│   │
│   ├── ❄️ ice_castle/
│   │   ├── realm_entrance.txt
│   │   ├── frozen_scroll.txt
│   │   └── warning.txt
│   │
│   ├── 🔥 fire_mountain/
│   │   ├── realm_entrance.txt
│   │   └── daemon_scroll.txt
│   │
│   └── ☁️ sky_tower/
│       ├── realm_entrance.txt
│       └── network_scroll.txt
│
└── ✨ .secret_realm/              🎁 SECRET ENDING!
    ├── secret_entrance.txt
    └── master_scroll.txt
```

## 🎯 How to Play

### Start Simple
Use only the commands mentioned in `welcome.txt`:
- `ls` to see what's in a room
- `cd directory` to enter
- `cd ..` to go back
- `cat file.txt` to read scrolls

### The Learning Curve

**Phase 1: The Hard Way (First Hour)**
- Navigate manually through directories
- Decode keys one at a time
- Write things down on paper
- Go back and forth to check hints
- *Feel the tedium of manual navigation*

**Phase 2: The Discovery (Spell Forge)**
- Find the armory spell forge
- Read about aliases and environment variables
- Experience the "aha!" moment
- Set up your environment for efficiency

**Phase 3: The Mastery**
- Use `grep -r` to search 2000 scrolls instantly
- Store decoded keys as variables
- Chain commands with pipes
- Navigate like a pro

### Key Challenges

**🔐 The Three Keys (Cryptography)**
1. Find three Base64-encoded keys
2. Decode each one: `base64 -d`
3. Extract the master passphrase parts
4. Combine them to unlock the treasury

Example:
```bash
# Decode a key
grep "BEGIN SILVER" -A 2 silver_key.txt | grep -v "BEGIN\|END" | base64 -d

# Advanced: Store as variable
export SILVER_KEY=$(grep "BEGIN SILVER" -A 2 library/silver_key.txt | grep -v "BEGIN\|END" | base64 -d)
echo $SILVER_KEY
```

**📚 The Archive Search (2000 Scrolls)**
The library's ancient_history section contains 2000 scrolls across 10 bookshelves. Three contain critical information. **Don't read them manually!**

```bash
cd library
# Search recursively through ALL sections and shelves
grep -r "dragon" .
grep -r "SECRET" ancient_history/
grep -r "GOLD_KEY" .
```

**🐉 The Dragon Fight (Boss Battle)**
```bash
cd armory/treasury/dragon_lair
./sleep_dragon.sh
# Speak the incantation when prompted
# Must include BOTH sleep spell AND dragon's true name!
```

### Pro Tips
- Hidden files/directories start with `.` - use `ls -a`
- Get stuck? `cat HINTS.txt` or `cat CHEAT_SHEET.txt`
- The dragon riddle is Base64 encoded - decode it!
- Set up aliases early for easier navigation
- Use environment variables to store decoded keys

## 🎓 Educational Philosophy

Terminal Dungeon teaches through **experiential learning**:

### 1. Progressive Disclosure
Players start knowing only 4 commands. New commands are discovered organically as they explore, creating natural learning moments.

### 2. Pain Before Solution
Players experience manual navigation frustration *before* learning about aliases and environment variables. This creates genuine appreciation for automation.

### 3. Realistic Scale
2000 files across multiple directory levels mirrors real-world codebases. Players understand *why* tools like `grep -r` exist.

### 4. Knowledge Synthesis
The dragon fight requires combining information from multiple sources - just like real problem-solving.

### 5. Practical Application
Every command taught has immediate use in the quest. No abstract lessons - everything serves a purpose.

## 👨‍👩‍👧‍👦 For Parents and Teachers

### Age Appropriateness
- **Ages 8-10**: Can complete basic challenges with guidance
- **Ages 11-13**: Can complete independently with hints
- **Ages 14+**: Can explore advanced features and optimize solutions

### Learning Outcomes
After completing Terminal Dungeon, students will:
- Navigate complex directory structures confidently
- Search efficiently through thousands of files
- Understand and use environment variables
- Create automation shortcuts with aliases
- Decode Base64 data
- Chain commands with pipes
- Understand file permissions and hidden files
- Read and apply man page documentation

### Classroom Use
- **Time**: 2-4 hours for complete playthrough
- **Setup**: Install once, students play individually or in pairs
- **Assessment**: Track which commands students discover
- **Extension**: Students can add new rooms or challenges

### Common Questions

**Q: Do they need prior terminal experience?**
A: No! The dungeon starts with absolute basics.

**Q: Will they break anything?**
A: No, all actions are contained within the `terminal_dungeon` directory.

**Q: What if they get stuck?**
A: Built-in `HINTS.txt` and `CHEAT_SHEET.txt` provide guidance without spoilers.

## 🤝 Contributing

Contributions welcome! Ideas:

- 🗺️ **New areas**: Additional realms or library sections
- 🧩 **New puzzles**: More cryptographic challenges
- 🌍 **Translations**: Localize to other languages
- 📚 **Educational paths**: Alternative difficulty modes
- 🎨 **ASCII art**: Make rooms more visually engaging
- 🔧 **Tools**: Helper scripts for teachers

Please open an issue first to discuss major changes!

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by classic text adventures and the Unix philosophy
- Created to make terminal learning accessible and fun
- Thanks to the open-source community for terminal education tools

## 🔗 Resources for Further Learning

After conquering the dungeon, continue your journey:

- [The Linux Command Line](http://linuxcommand.org/tlcl.php) - Comprehensive free book
- [Command Line Challenge](https://cmdchallenge.com/) - Online practice puzzles
- [Vim Adventures](https://vim-adventures.com/) - Learn vim through gaming
- [Regex101](https://regex101.com/) - Master pattern matching
- [Explainshell](https://explainshell.com/) - Understand complex commands
- [Bash Pitfalls](https://mywiki.wooledge.org/BashPitfalls) - Avoid common mistakes

## 💬 Community & Support

- 🐛 **Bug reports**: Open an issue with details
- 💡 **Feature ideas**: Suggest in discussions
- ❓ **Questions**: Check existing issues or ask in discussions
- 📢 **Success stories**: Share your experience!

## ⭐ Show Your Support

If Terminal Dungeon helped you or someone you know learn the terminal:
- ⭐ Star this repository
- 🐛 Report bugs or suggest features
- 📢 Share with others learning the command line
- 💬 Tell us your story in discussions!

---

**Ready to become a Terminal Wizard?** 🧙‍♂️

```bash
./setup-dungeon.sh
cd terminal_dungeon
cat welcome.txt
```

**The adventure begins with a single command.**

May your paths be true and your grep always match! 🗡️⚔️🏰✨
