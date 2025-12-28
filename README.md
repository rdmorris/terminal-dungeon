# 🏰 Terminal Dungeon

An epic, immersive dungeon crawler that teaches **35+ Unix/Linux terminal commands** through adventure, cryptography, binary analysis, and puzzle-solving!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-blue.svg)]()
[![Commands](https://img.shields.io/badge/Commands-35+-brightgreen.svg)]()

## 🎮 What is Terminal Dungeon?

Terminal Dungeon transforms your shell into an **interactive RPG** where the filesystem becomes your game world. Navigate through library sections with thousands of ancient scrolls, decode cryptographic keys, extract secrets from binary artifacts, and defeat a dragon—all while mastering real terminal commands from beginner to expert level!

**What makes this special:**
- 🗺️ **2000+ files** organized in a realistic multi-level library structure
- 🔐 **Real cryptography** - Base64 encoding/decoding of quest items
- 💾 **Binary file challenges** - Extract secrets using `strings`
- 🐉 **Interactive boss fight** that validates your command knowledge
- 📚 **Progressive learning** - start simple, discover advanced techniques organically
- 🎯 **Learn by doing** - experience pain points before discovering solutions
- 🏰 **Masters Tower** - Post-game advanced training with 10+ additional commands
- 💡 **Professional skills** - environment variables, aliases, text processing, archives

**Perfect for:**
- Kids learning their first terminal commands (ages 8+)
- Adults wanting to learn bash in a fun, engaging way
- Teachers looking for interactive command-line curriculum
- Developers wanting to level up their terminal skills
- Anyone who wants to gamify their terminal learning

## ✨ Features

### 🏛️ Massive Multi-Level Library
- **4 themed sections**: Ancient History, Dragon Lore, Magical Arts, Reference
- **10 bookshelves** in the archives, each containing 200 scrolls (2000 total!)
- **Hidden directories** teaching dotfile concepts (`.secret_archives`)
- **Realistic file hierarchy** mirroring real-world project structures
- **Recursive search challenge** - learn `grep -r` on actual deep structures

### 🔐 Cryptography & Binary Challenges
- **Base64-encoded keys** scattered throughout the dungeon
- **Three-part master passphrase** requiring information synthesis
- **Binary artifacts** with embedded secrets (sealed_artifact.bin)
- **Cursed scrolls** requiring `strings` to read
- **Encrypted riddles** teaching practical encoding/decoding

### 🎓 Progressive Skill Discovery
- **Start minimal**: Only `ls`, `cd`, `cat`, `cd ..` at first
- **Feel the pain**: Navigate deeply nested directories manually
- **Discover solutions**: Find `grep -r`, environment variables, aliases
- **Experience relief**: "There's a better way!" moment in the Spell Forge
- **Master advanced techniques**: Text processing, archives, binary analysis

### 🐉 Interactive Dragon Boss Fight
- **Validates your incantation** - actually checks what you type
- **Requires knowledge synthesis** - combine clues from different locations
- **Binary cursed scroll** - use `strings` to extract hints
- **Pattern matching validation** - must speak both sleep spell AND true name

### 🏰 Masters Tower (Post-Game Advanced Content)
Unlock after defeating the dragon to access:
- **Text Processing Lab**: `head`, `tail`, `wc`, `sort`, `uniq`, `cut`
- **Archive Vault**: `tar`, `gzip`/`gunzip`, compression workflows
- **Comparison Chamber**: `diff` for finding file differences
- **Binary Mysteries**: Advanced `strings` techniques and analysis
- **Transformation Workshop**: `sed`, `awk` for power users

### 🌀 Three Portal Realms
- **❄️ Ice Castle**: File operations (`cp`, `mv`, `rm`, `mkdir`, `touch`)
- **🔥 Fire Mountain**: Process management (`ps`, `top`, `kill`, `&`, `jobs`, `bg`, `fg`)
- **☁️ Sky Tower**: Networking (`ping`, `curl`, `wget`)

## 🚀 Quick Start

### Prerequisites

- Bash 4.0 or higher
- A Unix-like system (Linux, macOS, or Windows with WSL/Git Bash)
- ~50MB disk space (for 2000+ files)

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

### 🌟 Core Commands (Main Quest - 25 commands)

**Navigation & Reading:**
- `ls`, `ls -l`, `ls -a` - List files and directories
- `cd`, `cd ..`, `pwd` - Navigate filesystem
- `cat`, `man`, `less` - Read files and documentation

**Search & Discovery:**
- `grep`, `grep -r`, `grep -i` - Search within files (recursive!)
- `find` - Find files by name or type

**Cryptography & Binary:**
- `base64`, `base64 -d` - Encode/decode data
- `strings` - Extract readable text from binary files

**File Operations:**
- `mkdir`, `touch` - Create directories and files
- `cp`, `mv`, `rm` - Copy, move, delete
- `chmod` - Change permissions

**Automation & Environment:**
- `export` - Environment variables
- `alias` - Command shortcuts
- `echo`, `>`, `>>`, `|` - Output and piping
- `history` - Command history

**Process Management:**
- `ps`, `top` - View processes
- `kill`, `jobs`, `bg`, `fg`, `&` - Control processes

**Network:**
- `ping`, `curl`, `wget` - Network operations

### ⭐ Advanced Commands (Masters Tower - 10+ commands)

**Text Processing:**
- `head`, `tail` - View file beginnings/endings
- `wc` - Count lines, words, characters
- `sort` - Sort data
- `uniq` - Find unique entries
- `cut` - Extract columns

**Archives & Compression:**
- `tar` - Create and extract archives
- `gzip`, `gunzip` - Compress/decompress files
- `zcat`, `zgrep` - Work with compressed files

**Comparison:**
- `diff` - Compare files and find differences

**Power Tools (Advanced):**
- `sed` - Stream editor for text transformation
- `awk` - Pattern scanning and processing language

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
│   ├── reference/                 (Tutorials & guides)
│   │   ├── search_techniques/
│   │   │   ├── grep_guide.txt
│   │   │   └── find_guide.txt
│   │   └── cryptography/
│   │       └── base64_guide.txt
│   │
│   ├── dragon_lore/               (Quest information)
│   │   ├── combat_techniques/
│   │   │   └── sleep_spells.txt
│   │   └── bestiary/
│   │       └── dragon_species.txt
│   │
│   ├── magical_arts/              (Spell knowledge)
│   │   └── enchantments/
│   │       └── echo_magic.txt
│   │
│   ├── ancient_history/           ⭐ THE ARCHIVE CHALLENGE!
│   │   ├── README.txt
│   │   ├── shelf_01/ (200 scrolls - Years 1000-1199)
│   │   ├── shelf_02/ (200 scrolls - Years 1200-1399)
│   │   ├── shelf_03/ (200 scrolls) 🐉 Dragon's true name in scroll 0666
│   │   ├── shelf_04/ (200 scrolls)
│   │   ├── shelf_05/ (200 scrolls)
│   │   ├── shelf_06/ (200 scrolls) 🔍 Gold key clue in scroll 1313
│   │   ├── shelf_07/ (200 scrolls)
│   │   ├── shelf_08/ (200 scrolls)
│   │   ├── shelf_09/ (200 scrolls)
│   │   └── shelf_10/ (200 scrolls)
│   │
│   └── .secret_archives/          🔒 HIDDEN! (use ls -a)
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
│   │   ├── forge_intro.txt (aliases & env vars)
│   │   └── piping_scroll.txt
│   │
│   └── treasury/
│       ├── locked_door.txt
│       ├── encrypted_passphrase.txt (Base64)
│       ├── 💾 sealed_artifact.bin (strings challenge!)
│       ├── strings_scroll.txt
│       ├── unlock_treasury.sh (interactive script)
│       │
│       └── dragon_lair/
│           ├── dragon.txt
│           ├── 💾 cursed_scroll.bin (strings required!)
│           ├── curse_breaking.txt
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
│   ├── ☁️ sky_tower/
│   │   ├── realm_entrance.txt
│   │   └── network_scroll.txt
│   │
│   └── 🏰 masters_tower/          ⭐ POST-GAME CONTENT!
│       ├── entrance.txt
│       │
│       ├── text_processing_lab/
│       │   ├── README.txt
│       │   ├── sample_data.txt
│       │   ├── head_tail_scroll.txt
│       │   ├── wc_scroll.txt
│       │   ├── sort_scroll.txt
│       │   ├── uniq_scroll.txt
│       │   └── cut_scroll.txt
│       │
│       ├── archive_vault/
│       │   ├── README.txt
│       │   ├── tar_scroll.txt
│       │   ├── gzip_scroll.txt
│       │   ├── scrolls_to_archive/
│       │   ├── sealed_ancient_archive.tar.gz
│       │   └── challenge.txt
│       │
│       ├── comparison_chamber/
│       │   ├── README.txt
│       │   ├── diff_scroll.txt
│       │   ├── prophecy_original.txt
│       │   ├── prophecy_corrupted.txt
│       │   └── challenge.txt
│       │
│       ├── binary_mysteries/
│       │   ├── strings_mastery.txt
│       │   ├── mystery.bin
│       │   └── challenge.txt
│       │
│       ├── transformation_workshop/
│       │   ├── README.txt
│       │   ├── sed_scroll.txt
│       │   ├── awk_scroll.txt
│       │   └── challenge.txt
│       │
│       └── completion_scroll.txt
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
- Navigate manually through deep directory structures
- Decode keys one at a time, write them down
- Go back and forth to check hints
- *Feel the tedium of manual navigation*

**Phase 2: The Discovery (Spell Forge)**
- Find the armory spell forge
- Learn about aliases and environment variables
- Experience the "aha!" moment
- Set up your environment for efficiency

**Phase 3: The Mastery (Main Quest Complete)**
- Use `grep -r` to search 2000 scrolls instantly
- Store decoded keys as variables
- Extract secrets from binary files with `strings`
- Navigate like a pro
- Defeat the dragon!

**Phase 4: Advanced Training (Masters Tower)**
- Process text like a professional
- Archive and compress files
- Compare and transform data
- Master sed and awk

### Key Challenges

**🔐 The Three Keys (Cryptography)**
1. Find three Base64-encoded keys in different locations
2. Decode each one using `base64 -d`
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

**💾 The Binary Artifacts (strings)**
Extract hidden messages from corrupted binary files:
```bash
# Read the sealed artifact
strings armory/treasury/sealed_artifact.bin

# Find specific fragments
strings sealed_artifact.bin | grep "FRAGMENT"

# Read the cursed scroll
strings armory/treasury/dragon_lair/cursed_scroll.bin
```

**📚 The Archive Search (2000 Scrolls)**
The library contains 2000 scrolls across 10 bookshelves in multiple sections. **Don't read them manually!**

```bash
cd library
# Search recursively through ALL sections and shelves
grep -r "dragon" .
grep -r "SECRET" ancient_history/
grep -r "Ignis" .
```

**🐉 The Dragon Fight (Boss Battle)**
```bash
cd armory/treasury/dragon_lair

# First, extract hints from the cursed scroll
strings cursed_scroll.bin

# Then face the dragon
./sleep_dragon.sh
# Speak the complete incantation when prompted!
```

### Pro Tips
- Hidden files/directories start with `.` - use `ls -a`
- Get stuck? `cat HINTS.txt` or `cat CHEAT_SHEET.txt`
- Set up aliases early: `alias hints='cat $DUNGEON_HOME/HINTS.txt'`
- Use environment variables to store decoded keys
- `grep -r` searches recursively through all subdirectories
- `strings` reveals secrets in binary files
- After beating the dragon, explore the Masters Tower!

## 🎓 Educational Philosophy

Terminal Dungeon teaches through **experiential learning**:

### 1. Progressive Disclosure
Players start knowing only 4 commands. New commands are discovered organically through exploration, creating natural learning moments and genuine curiosity.

### 2. Pain Before Solution
Players experience manual navigation frustration *before* learning about aliases and environment variables. This creates genuine appreciation for automation and "aha!" moments.

### 3. Realistic Scale
2000 files across multiple directory levels mirrors real-world codebases. Players understand *why* tools like `grep -r` exist through necessity, not abstraction.

### 4. Knowledge Synthesis
The dragon fight requires combining information from multiple sources:
- Sleep spell from dragon_lore
- True name from ancient archives (2000 scrolls)
- Binary extraction from cursed scroll
- All combined in one command

This mirrors real problem-solving where you must gather and synthesize information.

### 5. Practical Application
Every command taught has immediate use in the quest. No abstract lessons - everything serves a purpose:
- `base64` → decode keys
- `strings` → read binary artifacts
- `grep -r` → search vast archives
- `export` → store important data
- `tar` → unseal ancient archives

### 6. Tiered Mastery
- **Basic tier**: Complete main quest (25 commands)
- **Advanced tier**: Masters Tower challenges (10+ commands)
- **Expert tier**: Sed/Awk transformation mastery

## 👨‍👩‍👧‍👦 For Parents and Teachers

### Age Appropriateness
- **Ages 8-10**: Can complete basic challenges with guidance, focus on navigation and simple commands
- **Ages 11-13**: Can complete main quest independently with occasional hints
- **Ages 14+**: Can explore all advanced features and optimize solutions
- **Adults**: Comprehensive professional skill development

### Learning Outcomes
After completing Terminal Dungeon, students will:
- Navigate complex directory structures confidently
- Search efficiently through thousands of files using recursive grep
- Understand and use environment variables and aliases
- Decode Base64 data for cryptographic challenges
- Extract text from binary files
- Create and extract tar archives
- Process text with head, tail, wc, sort, uniq, cut
- Compare files to find differences
- Chain commands with pipes for complex workflows
- Understand file permissions and hidden files
- Read and apply man page documentation
- **Bonus**: Transform text with sed and awk (advanced students)

### Classroom Use
- **Time**: 
  - Main quest: 2-3 hours
  - Masters Tower: Additional 1-2 hours
  - Total: 3-5 hours for complete mastery
- **Setup**: Install once, students play individually or in pairs
- **Assessment**: Track which commands students discover and use
- **Differentiation**: 
  - Struggling students: Focus on main quest
  - Advanced students: Challenge them to complete Masters Tower
  - Expert students: Have them add new challenges
- **Extension**: Students can create their own dungeon additions

### Common Questions

**Q: Do they need prior terminal experience?**
A: No! The dungeon starts with absolute basics (ls, cd, cat).

**Q: Will they break anything?**
A: No, all actions are contained within the `terminal_dungeon` directory. Safe environment.

**Q: What if they get stuck?**
A: Built-in `HINTS.txt` and `CHEAT_SHEET.txt` provide progressive hints without spoiling the experience.

**Q: Is this just for kids?**
A: No! Adults learn these same commands. The dungeon teaches professional-level skills used daily by developers and system administrators.

**Q: What makes this better than a tutorial?**
A: 
- **Motivation**: Game mechanics create intrinsic motivation
- **Context**: Commands are learned when needed, not memorized
- **Retention**: Experience-based learning creates lasting understanding
- **Engagement**: 3-5 hours flies by vs. struggling through dry documentation

## 🤝 Contributing

Contributions welcome! Ideas:

- 🗺️ **New areas**: Additional realms or library sections
- 🧩 **New puzzles**: More cryptographic or binary challenges
- 🌍 **Translations**: Localize to other languages
- 📚 **Educational paths**: Alternative difficulty modes
- 🎨 **ASCII art**: Make rooms more visually engaging
- 🔧 **Tools**: Helper scripts for teachers
- 📖 **Documentation**: Improve guides and hints

Please open an issue first to discuss major changes!

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by classic text adventures and the Unix philosophy
- Created to make terminal learning accessible and fun for everyone
- Thanks to the open-source community for terminal education tools
- Special appreciation for the developers who built the amazing GNU tools we teach

## 🔗 Resources for Further Learning

After conquering the dungeon, continue your journey:

**Beginner Resources:**
- [The Linux Command Line](http://linuxcommand.org/tlcl.php) - Comprehensive free book
- [Command Line Challenge](https://cmdchallenge.com/) - Online practice puzzles
- [Explainshell](https://explainshell.com/) - Understand complex commands

**Intermediate:**
- [Vim Adventures](https://vim-adventures.com/) - Learn vim through gaming
- [Regex101](https://regex101.com/) - Master pattern matching
- [Bash Pitfalls](https://mywiki.wooledge.org/BashPitfalls) - Avoid common mistakes

**Advanced:**
- [Advanced Bash Scripting Guide](https://tldp.org/LDP/abs/html/)
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
- [Sed & Awk](https://www.oreilly.com/library/view/sed-awk/1565922255/)

## 💬 Community & Support

- 🐛 **Bug reports**: Open an issue with details
- 💡 **Feature ideas**: Suggest in discussions
- ❓ **Questions**: Check existing issues or ask in discussions
- 📢 **Success stories**: Share your experience!
- 👨‍🏫 **Teaching**: Share how you used it in the classroom

## ⭐ Show Your Support

If Terminal Dungeon helped you or someone you know learn the terminal:
- ⭐ Star this repository
- 🐛 Report bugs or suggest features
- 📢 Share with others learning the command line
- 💬 Tell us your story in discussions!
- 🎓 If you're a teacher, let us know how it worked in your classroom

## 📊 Project Stats

- **35+ commands** taught progressively
- **2000+ files** for realistic scale
- **4 library sections** with deep hierarchy
- **10 bookshelves** with 200 scrolls each
- **4 realms** plus Masters Tower
- **6 chambers** in advanced training
- **100% hands-on** - no passive reading
- **Proven pedagogy** - pain → discovery → mastery

---

**Ready to become a Terminal Wizard?** 🧙‍♂️

```bash
./setup-dungeon.sh
cd terminal_dungeon
cat welcome.txt
```

**The adventure begins with a single command.**

May your paths be true, your grep always match, and your pipes never break! 🗡️⚔️🏰✨
