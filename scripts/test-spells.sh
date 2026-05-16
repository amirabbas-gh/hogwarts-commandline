#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SPELLS="${ROOT}/spells/hogwarts-spells.sh"
FAIL=0
PASS=0

SPELLS_LIST=(
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

spell_defined() {
  local shell_bin="$1" spell="$2"
  if [[ "$shell_bin" == "zsh" ]]; then
    zsh -ic "source '${SPELLS}'; whence -w ${spell}" 2>/dev/null | grep -q "function"
  else
    bash -ic "source '${SPELLS}'; declare -f ${spell}" >/dev/null 2>&1
  fi
}

run_shell_tests() {
  local shell_name="$1"
  local shell_bin="$2"

  echo "=== Testing with ${shell_name} ==="

  if ! "${shell_bin}" -ic "source '${SPELLS}'" 2>&1; then
    echo "FAIL: could not source spells file in ${shell_name}"
    FAIL=$((FAIL + 1))
    return
  fi

  for spell in "${SPELLS_LIST[@]}"; do
    if spell_defined "$shell_bin" "$spell"; then
      PASS=$((PASS + 1))
    else
      echo "FAIL: ${spell} not defined after source"
      FAIL=$((FAIL + 1))
    fi
  done

  local tmp
  tmp="$(mktemp -d)"
  if [[ "$shell_bin" == "zsh" ]]; then
    zsh -ic "
      source '${SPELLS}'
      lumos >/dev/null
      sonorus 'lumos' | grep -q lumos
      engorgio testdir && lumos testdir | grep -q testdir
      mirorerised >/dev/null
      apparate '${tmp}' && homenumrevelio | grep -q '${tmp}'
      accio hogwarts '${ROOT}/README.md' | grep -q hogwarts
    " 2>/dev/null
  else
    bash -ic "
      source '${SPELLS}'
      lumos >/dev/null
      sonorus 'lumos' | grep -q lumos
      engorgio testdir && lumos testdir | grep -q testdir
      mirorerised >/dev/null
    " 2>/dev/null
  fi && echo "OK: smoke tests passed (${shell_name})" || {
    echo "FAIL: smoke tests (${shell_name})"
    FAIL=$((FAIL + 1))
  }
  rm -rf "$tmp"
  echo ""
}

run_shell_tests "zsh" "zsh"
run_shell_tests "bash" "bash"

echo "================================"
echo "Results: ${PASS} checks passed, ${FAIL} failed"
if [[ "$FAIL" -gt 0 ]]; then
  exit 1
fi
echo "All spells loaded successfully."
