<p align="center">
  <img src="img/Hogwartscrest.webp" alt="Hogwarts crest" width="320" />
</p>

# Hogwarts Commandline ⚡

> *"It is our choices, Harry, that show what we truly are… far more than our `PATH`."* — Dumbledore, probably

Turn your boring Muggle terminal into a **wizard's workshop**. One `bash` install on macOS, Linux, or any Unix-like system, and everyday commands become **Harry Potter spells**.

```bash
curl -fsSL https://raw.githubusercontent.com/amirabbas-gh/hogwarts-commandline/main/install.sh | bash
# or clone and run locally:
git clone https://github.com/amirabbas-gh/hogwarts-commandline.git
cd hogwarts-commandline && ./install.sh
```

Then open a new terminal (or `source ~/.zshrc`) and try:

```bash
lumos              # list files — Lumos! Light reveals what was hidden
apparate Documents # cd — vanish from here, appear there
legilimens README.md
avadakedavra -h now   # shutdown — The Killing Curse (see Dark Arts below)
```

---

## Why?

Because `rm -rf node_modules` hits different when you type **`evanescototalus node_modules`** and pretend you're at the Battle of Hogwarts.

This project does **not** replace your shell or install binaries — it only adds **shell functions** that call the real commands underneath. Uninstall anytime.

---

## Install & uninstall

| Action | Command |
|--------|---------|
| Install | `./install.sh` |
| Uninstall | `./uninstall.sh` |
| In-session spellbook | `hogwartsspellbook` |

Supports **bash** and **zsh**. Fish coming eventually (probably when someone learns Aguamenti in Fish syntax).

---

## Spell → command reference

Spells are typed **without spaces** (e.g. `avadakedavra`, not `avada kedavra`).

### Navigation & discovery

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `lumos` | `ls` | Wand-light reveals what's in the dark |
| `lumosmaxima` | `ls -la` | Maximum light — even hidden files |
| `apparate [dir]` | `cd` | Instant travel; invalid paths block the Floo |
| `homenumrevelio` | `pwd` | Reveals where you truly are |
| `revelio` | `find` | Reveals hidden things |
| `accio` | `grep` | Summons lines that match |
| `acciofanum` | `rg` / `grep` | Summons with modern Seeker speed |
| `specialisrevelio` | `which` | Reveals where a spell binary lives |
| `pointme` | `which` | Four-Point Spell — "north" of binaries |
| `whompingwillow` | `tree` | Directory structure that fights back |

### Files & directories

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `legilimens` | `cat` | Read the contents of someone's mind/file |
| `geminio` | `cp` | Duplication Charm |
| `mobilicorpus` | `mv` | Levitate and move |
| `evanesco` | `rm` | Vanish into thin air |
| `evanescototalus` | `rm -rf` | Vanish *everything* (use like a Horcrux: never) |
| `engorgio` | `mkdir` | Swell to create space |
| `reducio` | `rmdir` | Shrink away empty dirs |
| `aguamenti` | `touch` | Conjure an empty file from nothing |
| `portus` | `ln` | Portkey links between paths |
| `horcrux` | `cp -a` | Dark backup copy — immortal archive |

### Reading & editing

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `omnioculars` | `less` | Zoom and replay file contents |
| `extendableear` | `tail -f` | Eavesdrop on growing logs |
| `aparecium` | `head` | Reveal the beginning |
| `descendo` | `tail` | Reveal the end |
| `quill` | `$EDITOR` / `vi` | Write with a proper wizard quill |
| `quickquotesquill` | `nano` | Rita Skeeter's editor of choice |
| `sectumsempracut` | `sed` | Slash and reshape text |
| `scribblifors` | `sort` | Enchant quills to line up |

### Permissions

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `imperio` | `chmod` | Control another's actions |
| `imperiocurse` | `sudo` | Total control (root) |
| `alohomora` | `chmod +x` | Unlock the door — make executable |
| `colloportus` | `chmod -x` | Lock the door |
| `priorincantatoown` | `chown` | Who owned the last spell |

### Text & data

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `sonorus` | `echo` | Magnify your voice |
| `arithmancy` | `wc` | Count words like Hermione |
| `deletriusdupes` | `uniq` | Remove duplicate echoes |
| `priorincantatodiff` | `diff` | See what the last spell changed |
| `confundus` | `tr` | Confuse characters |
| `diffindo` | `cut` | Split strings apart |

### Archives

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `undetectableextension` | `tar` | Bag with unlimited extension |
| `packtrunk` / `unpacktrunk` | `zip` / `unzip` | Trunk packing charms |
| `reduciozip` / `engorgiounzip` | `gzip` / `gunzip` | Compress and expand |

### Processes

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `priorincantato` | `ps` | See the last spells cast (processes) |
| `quidditch` | `top` | Fast-moving stats overhead |
| `sectumsempra` | `kill` | Cuts down a PID — the curse that ends processes |
| `stupefy` | `kill -STOP` | Stun in place |
| `incarcerous` | `jobs` | Bind with ropes |
| `liberacorpus` / `levicorpus` | `fg` / `bg` | Release or levitate jobs |

### Network

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `floo` | `ssh` | Floo Network to remote hosts |
| `flookey` | `ssh-keygen` | Register your fireplace |
| `patronumdelivery` | `scp` | Patronus carries your files |
| `owl` | `curl` | Owl post request |
| `owlpost` | `wget` | Owl downloads the scroll |
| `lumosping` | `ping` | Send a spark — is the host alive? |
| `revelionetwork` | `ifconfig` / `ip` | Reveal network faces |
| `legilimensnetwork` | `netstat` / `ss` | Read open connections |

### System & shell

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `mirorerised` | `whoami` | Mirror shows your true self |
| `specialisrevelioid` | `id` | Groups and UID revealed |
| `hogwartsletter` | `hostname` | Name on your acceptance letter |
| `sortinghat` | `uname` | Which house is this kernel? |
| `roomofrequirement` | `df` | Space appears when you need it |
| `engorgiodisk` | `du` | How bloated is this directory? |
| `gillyweed` | `free` / `vm_stat` | Breathe in RAM stats |
| `tempus` / `tempustotalum` | `date` / `cal` | Time-Turner calendar |
| `pensieve` | `history` | Dip into past commands |
| `obliviate` | `clear` | Erase the screen's memory |
| `incantato` / `obliviatevar` | `export` / `unset` | Set or wipe env vars |
| `polyjuice` | `su` | Become another user |
| `wandregistry` | `alias` | List registered spells |
| `finiteincantatem` | `unalias` | End the enchantment |
| `accioscript` | `source` | Pull a script into the shell |
| `disapparate [code]` | `exit` | Leave the room |

### Dev & packages

| Spell | Muggle command | Lore |
|-------|------------------|------|
| `diagonalley` | `brew` / `apt` / … | Shop for packages |
| `parseltongue` | `python` | Speak to serpents |
| `snitchruntime` | `node` | Golden Snitch runtime |
| `timeturner` / `gringotts` | `git` | Version vault at Gringotts |
| `potionschamber` | `docker` | Brew containers |
| `hogwartshelp` | `man` | Restricted Section manual |

---

## Dark Arts — power management

Use these only when you mean it. They call real `shutdown` / `reboot` / `halt`.

| Spell | Muggle command | What happens |
|-------|----------------|--------------|
| **`avadakedavra`** | `shutdown` | *The Killing Curse.* Powers off the machine. There is no undo. |
| **`reparo`** | `reboot` | Mends the system by restarting it |
| **`petrificustotalus`** | `halt` | Freezes the system to a halt |

Example:

```bash
avadakedavra now          # shut down immediately
reparo                    # reboot
```

---

## How it works

1. `install.sh` appends a marked block to `~/.zshrc` or `~/.bashrc`.
2. That block sources `spells/hogwarts-spells.sh`.
3. Spell functions wrap `command` so your real binaries stay reachable.

If spells do not work after install, reload your shell:

```bash
source ~/.zshrc   # or ~/.bashrc
```

**zsh note:** If you have aliases that collide with spell names (e.g. `accio` → Cursor), the installer removes those aliases for spell names only so `grep` wins over your editor.

### Test all spells

```bash
./scripts/test-spells.sh
```

No root required for install. Dark Arts may ask for `sudo` like normal shutdown.

---

## Contributing

Missing your favorite spell? Open a PR with:

1. Function in `spells/hogwarts-spells.sh`
2. One line of lore in this README table

Ideas welcome: `expectopatronum` → `curl` health check, `prioriincantatem` → `diff` three-way, etc.

---

## Disclaimer

Harry Potter names and spells are © Warner Bros. / J.K. Rowling. This is a **fan parody project** with no official affiliation. Don't actually curse your production servers — backups are your Patronus.

---

## License

MIT — see [LICENSE](LICENSE). Cast freely; attribute kindly.
