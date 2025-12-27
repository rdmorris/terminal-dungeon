# 🏰 Terminal Dungeon

An epic, interactive dungeon crawler that teaches Unix/Linux terminal commands through adventure and puzzle-solving!

## 🎮 What is Terminal Dungeon?

Terminal Dungeon is a filesystem-based adventure game that teaches terminal commands by turning your shell into an interactive RPG. Players explore rooms (directories), read ancient scrolls (files), collect keys, learn magical spells (commands), and ultimately defeat a dragon using their newfound terminal powers!

**Perfect for:**

* Kids learning their first terminal commands (ages 8+)
* Adults wanting to learn shell scripting in a fun way
* Teachers looking for engaging ways to teach the command line
* Users on lightweight systems (Alpine, BSD) using the POSIX version

## ✨ Features

* 🗺️ **Three main areas** with unique themes and lessons
* 🌀 **Three portal realms** teaching specialized skills
* 🐉 **Interactive dragon boss fight** that validates your commands
* 📚 **20+ commands** taught progressively through discovery
* 🔍 **Secret ending** for explorers who master hidden files
* 🎯 **Real terminal practice** - no simulation, actual shell commands
* 🛡️ **Dual-Script Support** - Choose between feature-rich Bash or universal POSIX Shell

## 🚀 Quick Start

### 1. Prerequisites

* **For Bash Version:** Bash 4.0 or higher. Recommended for most Linux and macOS users.
* **For POSIX Version:** Any standard shell (`sh`, `dash`, `zsh`, `ksh`). Perfect for Alpine Linux, OpenBSD, or restricted environments.

### 2. Installation & Setup

Choose the version that fits your system:

#### **Option A: Bash (Standard)**

Recommended for the full experience with modern features.

```bash
git clone https://github.com/YOUR_USERNAME/terminal-dungeon.git
cd terminal-dungeon
chmod +x setup-dungeon.sh
./setup-dungeon.sh

```

#### **Option B: POSIX (Universal)**

Use this if you are on a minimal system or want to learn the universal Unix standard.

```sh
git clone https://github.com/YOUR_USERNAME/terminal-dungeon.git
cd terminal-dungeon
chmod +x setup-dungeon-posix.sh
./setup-dungeon-posix.sh

```

### 3. Enter the Dungeon!

```bash
cd terminal_dungeon
cat welcome.txt

```

---

## 📖 What You'll Learn

### Basic Commands (Entrance & Library)

* `ls`, `cd`, `pwd`, `cat` - The Four Foundations
* `man` - Accessing the Great Archives (Manuals)
* `grep` - Searching through thousands of scrolls
* `find` - Tracking down hidden files

### Intermediate Commands (Armory)

* `chmod` - Breaking magical seals (Permissions)
* `echo` & `>` - Scribing your own scrolls (Redirection)
* `|` - Chaining spells (Pipes)
* `*`, `?`, `[]` - Pattern Magic (Wildcards)

### Advanced Commands (Portal Realms)

* **Ice Castle**: `cp`, `mv`, `rm`, `mkdir`, `touch` (Matter manipulation)
* **Fire Mountain**: `ps`, `top`, `kill`, `jobs` (Commanding spirits/processes)
* **Sky Tower**: `ping`, `curl`, `wget` (Communicating across realms)

---

## 🗺️ Dungeon Map

```
terminal_dungeon/
├── 📜 welcome.txt (Start Here)
├── 📜 quest_log.txt
├── 📜 HINTS.txt
├── 📜 CHEAT_SHEET.txt
├── 📚 library/
│   ├── Ancient scrolls with grep challenges
│   └── secret_archives/ -> 🗝️ Gold Key
├── ⚔️ armory/
│   ├── Permission challenges
│   ├── 🗝️ Bronze Key
│   └── spell_forge/ -> 🔗 Pipe and alias magic
├── 🌀 portal_chamber/
│   ├── ❄️ ice_castle/    (File operations)
│   ├── 🔥 fire_mountain/ (Process management)
│   └── ☁️ sky_tower/     (Networking)
└── 💰 treasury/
    └── dragon_lair/
        ├── 🐉 Interactive boss fight
        └── treasure_room/ -> 🏆 VICTORY!

```

---

## 🐉 The Dragon Fight

The final boss is an **interactive script** that validates your knowledge. To face the dragon, you must navigate to its lair and run the challenge:

```bash
cd armory/treasury/dragon_lair
./sleep_dragon.sh

```

**The Challenge:** The dragon requires an incantation consisting of a sleep spell and its true name. You must find these hidden in the Library and Armory!

---

## 🛠️ Bash vs. POSIX: Which one?

* **`setup-dungeon.sh` (Bash)**: Uses modern features like "brace expansion" to create files instantly. It is the gold standard for Linux users.
* **`setup-dungeon-posix.sh` (POSIX)**: Uses older, more universal syntax. It is designed to work on **any** Unix-like system, teaching you the "write once, run anywhere" philosophy of shell scripting.

---

## 🤝 Contributing

We love new rooms and puzzles!

1. Fork the repo.
2. Add your room/challenge to both scripts.
3. Ensure the POSIX version doesn't use `[[ ]]` or `{1..10}`.
4. Open a Pull Request!

## 📝 License

Licensed under the MIT License. See [LICENSE](https://www.google.com/search?q=LICENSE) for details.

---

**Ready to become a Terminal Wizard?** 🧙‍♂️
