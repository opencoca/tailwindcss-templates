#!/usr/bin/env bash
set -euo pipefail

# Poka-yoke guard for HTML conversion scope.
# Allowed targets are top-level layout templates only: layouts/*.html
# Excluded by design: vendor snapshots and exported asset trees.

usage() {
  cat <<'EOF'
Usage:
  scripts/poka-yoke-html-scope.sh --print-safe
  scripts/poka-yoke-html-scope.sh --assert <file1> [file2 ...]
  scripts/poka-yoke-html-scope.sh --assert-stdin

Modes:
  --print-safe   Print the safe conversion target list (layouts/*.html).
  --assert       Fail if any provided file is outside safe scope.
  --assert-stdin Read newline-delimited file paths from stdin and assert scope.
EOF
}

is_safe_target() {
  local f="$1"
  [[ "$f" =~ ^layouts/[^/]+\.html$ ]]
}

print_safe_targets() {
  rg --files layouts -g '*.html' | rg '^layouts/[^/]+\.html$' | sort
}

assert_targets() {
  local bad=()
  local f
  for f in "$@"; do
    if ! is_safe_target "$f"; then
      bad+=("$f")
    fi
  done

  if ((${#bad[@]} > 0)); then
    echo "ERROR: Refusing to continue. These files are outside safe scope:" >&2
    printf '  - %s\n' "${bad[@]}" >&2
    echo "Safe scope is: layouts/*.html (top-level only)." >&2
    return 1
  fi

  echo "OK: ${#@} file(s) are within safe scope (layouts/*.html)."
}

main() {
  if (($# == 0)); then
    usage
    exit 2
  fi

  case "$1" in
    --print-safe)
      shift
      print_safe_targets
      ;;
    --assert)
      shift
      if (($# == 0)); then
        echo "ERROR: --assert requires at least one file path." >&2
        exit 2
      fi
      assert_targets "$@"
      ;;
    --assert-stdin)
      shift
      mapfile -t files
      if ((${#files[@]} == 0)); then
        echo "ERROR: --assert-stdin received no file paths." >&2
        exit 2
      fi
      assert_targets "${files[@]}"
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "ERROR: Unknown option: $1" >&2
      usage
      exit 2
      ;;
  esac
}

main "$@"
