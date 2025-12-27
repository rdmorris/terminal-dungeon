# 🏰 Terminal Dungeon

An epic, interactive dungeon crawler that teaches Unix/Linux terminal commands through adventure and puzzle-solving!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-blue.svg)]()

## 🎮 What is Terminal Dungeon?

Terminal Dungeon is a filesystem-based adventure game that teaches terminal commands by turning your shell into an interactive RPG. Players explore rooms (directories), read ancient scrolls (files), collect keys, learn magical spells (commands), and ultimately defeat a dragon using their newfound terminal powers!

**Perfect for:**
- Kids learning their first terminal commands (ages 8+)
- Adults wanting to learn bash in a fun way
- Teachers looking for engaging ways to teach the command line
- Anyone who wants to gamify their terminal learning

## ✨ Features

- 🗺️ **Three main areas** with unique themes and lessons
- 🌀 **Three portal realms** teaching specialized skills
- 🐉 **Interactive dragon boss fight** that validates your commands
- 📚 **20+ commands** taught progressively through discovery
- 🔍 **Secret ending** for explorers who master hidden files
- 📖 **Built-in help system** with hints and cheat sheets
- 🎯 **Real terminal practice** - no simulation, actual bash commands
- 🏆 **Achievement system** with quest log tracking

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

# Run the setup script
./setup-dungeon.sh

# Enter the dungeon!
cd terminal_dungeon
cat welcome.txt
```

That's it! You're ready to start your adventure!

## 📖 What You'll Learn

### Basic Commands (Entrance & Library)
- `ls` - List directory contents
- `cd` - Change directory
- `pwd` - Print working directory
- `cat` - Read files
- `man` - Read command manuals
- `grep` - Search within files
- `find` - Search for files

### Intermediate Commands (Armory)
- `chmod` - Change file permissions
- `echo` - Print text and create files
- `>` and `>>` - Output redirection
- `|` - Pipes for chaining commands
- Wildcards (`*`, `?`, `[]`)
- `alias` - Create command shortcuts
- `history` - View command history

### Advanced Commands (Portal Realms)
- **Ice Castle**: `cp`, `mv`, `rm`, `mkdir`, `touch`
- **Fire Mountain**: `ps`, `top`, `kill`, `jobs`, `bg`, `fg`, `&`
- **Sky Tower**: `ping`, `curl`, `wget`, `netstat`

### Bonus Skills
- Text editing with `nano` and `vim`
- Understanding file permissions
- Working with hidden files (`.dotfiles`)
- Combining commands for powerful effects

## 🗺️ Dungeon Map

```
terminal_dungeon/
├── 📜 welcome.txt
├── 📜 quest_log.txt
├── 📜 HINTS.txt
├── 📜 CHEAT_SHEET.txt
├── 📚 library/
│   ├── Ancient scrolls with grep challenges
│   ├── Man page tutorials
│   └── secret_archives/
│       └── 🗝️ Gold Key
├── ⚔️ armory/
│   ├── Permission challenges
│   ├── 🗝️ Bronze Key
│   ├── hall_of_echoes/
│   └── spell_forge/
│       └── 🔗 Pipe and alias magic
├── 🌀 portal_chamber/
│   ├── ❄️ ice_castle/      (File operations)
│   ├── 🔥 fire_mountain/   (Process management)
│   └── ☁️ sky_tower/       (Networking)
└── 💰 treasury/
    └── dragon_lair/
        ├── 🐉 Interactive boss fight
        └── treasure_room/
            └── 🏆 VICTORY!
```

## 🎯 How to Play

1. **Start simple**: Use only the commands mentioned in `welcome.txt` at first
2. **Read everything**: Every file teaches you something new
3. **Explore thoroughly**: Use `ls` in every room to see what's available
4. **Take notes**: Create your own journal with `echo` and `>>`
5. **Don't be afraid to fail**: The dragon can't actually hurt you!
6. **Use hints when stuck**: `cat HINTS.txt` and `cat CHEAT_SHEET.txt`

### Pro Tips
- The dragon fight requires information from TWO different locations
- Hidden files start with `.` - use `ls -a` to see them
- Combine commands with pipes `|` for powerful effects
- Read the man pages: `man command_name`

## 🐉 The Dragon Fight

The final boss is an **interactive script** that validates your knowledge:

```bash
cd armory/treasury/dragon_lair
./sleep_dragon.sh
# Then speak the correct incantation!
```

You'll need to:
1. Find the sleep spell in the library
2. Discover the dragon's true name using `grep`
3. Combine both in one command

No spoilers - figure it out through exploration!

## 🎓 Educational Philosophy

Terminal Dungeon teaches through **progressive discovery**:

1. **Start Minimal**: Players begin knowing only 4 commands
2. **Learn by Doing**: New commands are discovered by reading files
3. **Contextual Learning**: Each command is introduced when it's needed
4. **Meaningful Practice**: Puzzles require actual understanding, not memorization
5. **Build Confidence**: Early successes encourage deeper exploration

This mirrors how real terminal mastery develops - through curiosity, experimentation, and practical application.

## 👨‍👩‍👧‍👦 For Parents and Teachers

### Age Appropriateness
- **Ages 8-10**: Can complete with guidance, focuses on basic navigation
- **Ages 11-13**: Can complete independently with occasional hints
- **Ages 14+**: Can explore advanced features and bonus challenges

### Learning Outcomes
After completing Terminal Dungeon, students will be able to:
- Navigate a filesystem confidently
- Read and create files using terminal commands
- Search for information efficiently
- Understand file permissions
- Chain commands together for complex tasks
- Read man pages and learn new commands independently

### Classroom Use
- **Time**: 2-4 hours for complete playthrough
- **Setup**: Install on lab computers or students' personal machines
- **Group Play**: Great for pair programming
- **Extension**: Students can create their own dungeon additions!

## 🤝 Contributing

Contributions are welcome! Here are some ideas:

- 🗺️ Add new rooms or realms
- 🧩 Create additional puzzles
- 🌍 Translate to other languages
- 📝 Improve documentation
- 🐛 Fix bugs or improve error messages
- 🎨 Add ASCII art

Please open an issue first to discuss major changes.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by text-based adventure games and the Unix philosophy
- Created to make terminal learning fun and accessible for everyone
- Special thanks to the open source community for teaching tools and techniques

## 🔗 Resources for Further Learning

After completing Terminal Dungeon, continue your journey:

- [The Linux Command Line](http://linuxcommand.org/tlcl.php) - Free book
- [Command Line Challenge](https://cmdchallenge.com/) - Online practice
- [Vim Adventures](https://vim-adventures.com/) - Learn vim through gaming
- [Bash Pitfalls](https://mywiki.wooledge.org/BashPitfalls) - Common mistakes
- [Explainshell](https://explainshell.com/) - Understand complex commands

## ⭐ Show Your Support

If Terminal Dungeon helped you learn the terminal, please:
- ⭐ Star this repository
- 🐛 Report bugs or suggest features
- 📢 Share with others who want to learn
- 💬 Tell us about your experience!

---

**Ready to become a Terminal Wizard?** 🧙‍♂️

```bash
./setup-dungeon.sh
cd terminal_dungeon
cat welcome.txt
```

May your commands always execute successfully! 🗡️⚔️🏰
