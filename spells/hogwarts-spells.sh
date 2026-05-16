# shellcheck shell=bash
# Hogwarts Commandline — spell wrappers for Unix-like systems (bash & zsh)

_hogwarts() { command "$@"; }

# zsh parses function bodies with aliases active unless we disable them during load
# (common collision: accio → Cursor from shell plugins)
_hogwarts_restore_aliases() {
  [[ -n "${ZSH_VERSION:-}" && -n "${_HOGWARTS_ALIASES_WERE_ON:-}" ]] && setopt aliases
}
if [[ -n "${ZSH_VERSION:-}" ]] && [[ -o aliases ]]; then
  _HOGWARTS_ALIASES_WERE_ON=1
  unsetopt aliases
fi

_hogwarts_load_spells() {

  # ─── Navigation & discovery ─────────────────────────────────────────────────
  lumos() { _hogwarts ls "$@"; }
  lumosmaxima() { _hogwarts ls -la "$@"; }
  revelio() { _hogwarts find "$@"; }
  accio() { _hogwarts grep "$@"; }
  acciofanum() { _hogwarts rg "$@" 2>/dev/null || _hogwarts grep "$@"; }
  specialisrevelio() { _hogwarts which "$@"; }
  pointme() { _hogwarts which "$@"; }
  whompingwillow() {
    _hogwarts tree "$@" 2>/dev/null || _hogwarts find . -print | sed 's|[^/]*/| |g'
  }

  apparate() {
    if [[ $# -eq 0 ]]; then
      builtin cd || return
    elif [[ -d "$1" ]]; then
      builtin cd "$1" || return
    else
      echo "The Floo Network cannot reach '$1'." >&2
      return 1
    fi
  }

  homenumrevelio() { _hogwarts pwd; }

  # ─── Reading & viewing ──────────────────────────────────────────────────────
  legilimens() { _hogwarts cat "$@"; }
  legilimensoculum() { _hogwarts bat "$@" 2>/dev/null || _hogwarts cat "$@"; }
  omnioculars() { _hogwarts less "$@"; }
  extendableear() { _hogwarts tail -f "$@"; }
  aparecium() { _hogwarts head "$@"; }
  descendo() { _hogwarts tail "$@"; }
  riddikulus() { _hogwarts file "$@"; }
  prophecium() { _hogwarts stat "$@"; }

  # ─── Writing & editing ──────────────────────────────────────────────────────
  quill() { _hogwarts "${EDITOR:-vi}" "$@"; }
  quickquotesquill() { _hogwarts nano "$@" 2>/dev/null || _hogwarts vi "$@"; }
  sectumsempracut() { _hogwarts sed "$@"; }
  scribblifors() { _hogwarts sort "$@"; }

  # ─── File charms ────────────────────────────────────────────────────────────
  geminio() { _hogwarts cp "$@"; }
  mobilicorpus() { _hogwarts mv "$@"; }
  evanesco() { _hogwarts rm "$@"; }
  evanescototalus() { _hogwarts rm -rf "$@"; }
  engorgio() { _hogwarts mkdir "$@"; }
  reducio() { _hogwarts rmdir "$@"; }
  aguamenti() { _hogwarts touch "$@"; }
  portus() { _hogwarts ln "$@"; }
  horcrux() { _hogwarts cp -a "$@"; }

  # ─── Permissions & ownership ────────────────────────────────────────────────
  imperio() { _hogwarts chmod "$@"; }
  imperiocurse() { _hogwarts sudo "$@"; }
  alohomora() { _hogwarts chmod +x "$@"; }
  colloportus() { _hogwarts chmod -x "$@"; }
  priorincantatoown() { _hogwarts chown "$@"; }

  # ─── Text & data ────────────────────────────────────────────────────────────
  sonorus() { _hogwarts echo "$@"; }
  arithmancy() { _hogwarts wc "$@"; }
  deletriusdupes() { _hogwarts uniq "$@"; }
  priorincantatodiff() { _hogwarts diff "$@"; }
  reparotext() { _hogwarts patch "$@"; }
  confundus() { _hogwarts tr "$@"; }
  diffindo() { _hogwarts cut "$@"; }

  # ─── Archives & compression ─────────────────────────────────────────────────
  undetectableextension() { _hogwarts tar "$@"; }
  reduciozip() { _hogwarts gzip "$@"; }
  engorgiounzip() { _hogwarts gunzip "$@"; }
  packtrunk() { _hogwarts zip "$@"; }
  unpacktrunk() { _hogwarts unzip "$@"; }

  # ─── Processes & tasks ──────────────────────────────────────────────────────
  priorincantato() { _hogwarts ps "$@"; }
  quidditch() { _hogwarts top "$@" 2>/dev/null || _hogwarts ps aux; }
  stupefy() { _hogwarts kill -STOP "$@"; }
  incarcerous() { _hogwarts jobs "$@"; }
  liberacorpus() { _hogwarts fg "$@"; }
  levicorpus() { _hogwarts bg "$@"; }

  sectumsempra() {
    if [[ $# -lt 1 ]]; then
      echo "Usage: sectumsempra <pid>  — The curse that must not be cast lightly." >&2
      return 1
    fi
    _hogwarts kill "$@"
  }

  # ─── Network ────────────────────────────────────────────────────────────────
  floo() { _hogwarts ssh "$@"; }
  flookey() { _hogwarts ssh-keygen "$@"; }
  patronumdelivery() { _hogwarts scp "$@"; }
  owl() { _hogwarts curl "$@"; }
  owlpost() { _hogwarts wget "$@"; }
  lumosping() { _hogwarts ping "$@"; }
  revelionetwork() { _hogwarts ifconfig "$@" 2>/dev/null || _hogwarts ip "$@"; }
  legilimensnetwork() { _hogwarts netstat "$@" 2>/dev/null || _hogwarts ss "$@"; }
  specialisreveliodns() { _hogwarts dig "$@" 2>/dev/null || _hogwarts nslookup "$@"; }

  # ─── System & identity ──────────────────────────────────────────────────────
  mirorerised() { _hogwarts whoami; }
  specialisrevelioid() { _hogwarts id "$@"; }
  hogwartsletter() { _hogwarts hostname; }
  sortinghat() { _hogwarts uname "$@"; }
  roomofrequirement() { _hogwarts df "$@"; }
  engorgiodisk() { _hogwarts du "$@"; }
  gillyweed() { _hogwarts free "$@" 2>/dev/null || _hogwarts vm_stat 2>/dev/null || true; }
  tempus() { _hogwarts date "$@"; }
  tempustotalum() { _hogwarts cal "$@"; }

  # ─── Shell & environment ──────────────────────────────────────────────────────
  pensieve() { _hogwarts history "$@"; }
  obliviate() { _hogwarts clear; }
  incantato() { _hogwarts export "$@"; }
  obliviatevar() { _hogwarts unset "$@"; }
  polyjuice() { _hogwarts su "$@"; }
  wandregistry() { _hogwarts alias "$@"; }
  finiteincantatem() { _hogwarts unalias "$@"; }
  accioscript() { # shellcheck disable=SC1090
    source "$@"
  }

  disapparate() {
    local code="${1:-0}"
    builtin exit "$code"
  }

  # ─── Package managers (Diagon Alley) ────────────────────────────────────────
  diagonalley() {
    if command -v brew >/dev/null; then _hogwarts brew "$@"
    elif command -v apt >/dev/null; then _hogwarts apt "$@"
    elif command -v yum >/dev/null; then _hogwarts yum "$@"
    elif command -v dnf >/dev/null; then _hogwarts dnf "$@"
    elif command -v pacman >/dev/null; then _hogwarts pacman "$@"
    else echo "No Diagon Alley found on this Muggle system." >&2; return 127
    fi
  }

  # ─── Dev tools ──────────────────────────────────────────────────────────────
  parseltongue() { _hogwarts python3 "$@" 2>/dev/null || _hogwarts python "$@"; }
  snitchruntime() { _hogwarts node "$@"; }
  timeturner() { _hogwarts git "$@"; }
  potionschamber() { _hogwarts docker "$@"; }
  gringotts() { _hogwarts git "$@"; }

  # ─── Help ───────────────────────────────────────────────────────────────────
  hogwartshelp() { _hogwarts man "$@"; }
  restrictedsection() { _hogwarts man "$@"; }

  # ─── Dark Arts (system power) — use responsibly ─────────────────────────────
  avadakedavra() {
    echo "⚡ Avada Kedavra — The Killing Curse. The system will power off."
    echo "   (Muggles call this 'shutdown'. There is no undo.)"
    _hogwarts sudo shutdown "$@" 2>/dev/null || _hogwarts shutdown "$@"
  }

  reparo() {
    echo "✨ Reparo — mending what was broken. Rebooting..."
    _hogwarts sudo reboot "$@" 2>/dev/null || _hogwarts reboot "$@"
  }

  petrificustotalus() {
    echo "🪨 Petrificus Totalus — everything freezes."
    _hogwarts sudo halt "$@" 2>/dev/null || _hogwarts halt "$@"
  }

  hogwartsspellbook() {
    cat <<'SPELLBOOK'

  ╔══════════════════════════════════════════════════════════════╗
  ║           HOGWARTS COMMANDLINE — SPELLBOOK                   ║
  ╚══════════════════════════════════════════════════════════════╝

  NAVIGATION          │  FILES & TEXT           │  SYSTEM
  ────────────────────┼─────────────────────────┼──────────────────
  lumos          → ls │  geminio           → cp │  mirorerised → whoami
  apparate       → cd │  mobilicorpus      → mv │  imperiocurse → sudo
  homenumrevelio → pwd│  evanesco          → rm │  avadakedavra → shutdown
  revelio        → find│  legilimens        → cat│  reparo        → reboot
  accio          → grep│  pensieve       → history│  obliviate     → clear

  Type: hogwartsspellbook
  Full list: README.md in the project repo

SPELLBOOK
  }
}

_hogwarts_load_spells
if [[ -n "${ZSH_VERSION:-}" ]]; then
  unfunction _hogwarts_load_spells 2>/dev/null
  # Functions must win over user aliases (e.g. accio → Cursor)
  _hogwarts_spell_names=(
    lumos lumosmaxima revelio accio acciofanum specialisrevelio pointme whompingwillow
    apparate homenumrevelio legilimens legilimensoculum omnioculars extendableear
    aparecium descendo riddikulus prophecium quill quickquotesquill sectumsempracut
    scribblifors geminio mobilicorpus evanesco evanescototalus engorgio reducio
    aguamenti portus horcrux imperio imperiocurse alohomora colloportus priorincantatoown
    sonorus arithmancy deletriusdupes priorincantatodiff reparotext confundus diffindo
    undetectableextension reduciozip engorgiounzip packtrunk unpacktrunk priorincantato
    quidditch stupefy incarcerous liberacorpus levicorpus sectumsempra floo flookey
    patronumdelivery owl owlpost lumosping revelionetwork legilimensnetwork
    specialisreveliodns mirorerised specialisrevelioid hogwartsletter sortinghat
    roomofrequirement engorgiodisk gillyweed tempus tempustotalum pensieve obliviate
    incantato obliviatevar polyjuice wandregistry finiteincantatem accioscript disapparate
    diagonalley parseltongue snitchruntime timeturner potionschamber gringotts hogwartshelp
    restrictedsection avadakedavra reparo petrificustotalus hogwartsspellbook
  )
  for _hs in "${_hogwarts_spell_names[@]}"; do
    unalias "$_hs" 2>/dev/null
  done
  unset _hogwarts_spell_names _hs
else
  unset -f _hogwarts_load_spells 2>/dev/null
fi
_hogwarts_restore_aliases
unset _HOGWARTS_ALIASES_WERE_ON
