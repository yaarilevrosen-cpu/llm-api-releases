#!/bin/sh
# llm-api 4.13.0 - install on Linux or a Raspberry Pi (64-bit).
#
#   curl -fsSL https://yaarilevrosen-cpu.github.io/llm-api-releases/install.sh | sh
#
# What it does: finds Python 3.11+ (installs it if missing), downloads the
# release tarball from GitHub, checks its SHA-256 against the one written
# into this script, and runs the installer (standalone, no questions). Then
# open http://127.0.0.1:8000/console on this machine.
# Options:  curl -fsSL .../install.sh | sh -s -- --dir PATH | --dry-run
#
# Everything is inside main(), called on the last line, so a download cut
# short can never run half a script.

main() {
    VERSION='4.13.0'
    URL="${LLM_API_RELEASE_URL:-https://github.com/yaarilevrosen-cpu/llm-api-releases/releases/download/v4.13.0}/llm-api-4.13.0.tar.gz"
    SHA256='9c2f56807acb842d2ea0ff678a323049831c1855f0c1aac9633505861c2c5a93'
    DIR="${LLM_API_DIR:-$HOME/llm-api}"
    PASS=""
    while [ $# -gt 0 ]; do
        case "$1" in
            --dir) DIR="$2"; shift ;;
            --model|--host|--name) PASS="$PASS $1 $2"; shift ;;
            --dry-run|--no-model) PASS="$PASS $1" ;;
        esac
        shift
    done
    case " $PASS " in *" --model "*) ;; *) PASS="$PASS --no-model" ;; esac

    say()  { printf '  %s\n' "$*"; }
    fail() {
        printf '\n  [x] %s\n' "$1" >&2
        printf '      %s\n' "$2" >&2
        printf '      %s\n\n' "$3" >&2
        exit 1
    }

    printf '\n  llm-api %s - installing on this machine\n\n' "$VERSION"

    [ "$(uname -s)" = "Linux" ] || fail "This installer is for Linux." \
        "On Windows, download the setup: https://yaarilevrosen-cpu.github.io/llm-api-releases/" \
        "ב־Windows מורידים את קובץ ההתקנה מדף ההורדה."
    case "$(uname -m)" in
        x86_64|amd64|aarch64|arm64) ;;
        *) fail "This machine is $(uname -m); llm-api needs a 64-bit system (x86_64 or arm64)." \
               "On a Raspberry Pi, install the 64-bit Raspberry Pi OS." \
               "ב־Raspberry Pi צריך את מערכת ההפעלה בגרסת 64 ביט." ;;
    esac
    command -v curl >/dev/null 2>&1 || fail "curl is missing." "Install it: sudo apt-get install -y curl" \
        "צריך curl: sudo apt-get install -y curl"

    SUDO=""
    if [ "$(id -u)" -ne 0 ]; then
        command -v sudo >/dev/null 2>&1 || fail "sudo is missing." \
            "Run this as root, or install sudo first." "מריצים כ־root או מתקינים sudo קודם."
        SUDO="sudo"
    fi

    good_python() {
        "$1" -c 'import sys, venv, ensurepip; sys.exit(0 if sys.version_info >= (3, 11) else 1)' >/dev/null 2>&1
    }
    PY=""
    for cand in python3.13 python3.12 python3.11 python3; do
        if command -v "$cand" >/dev/null 2>&1 && good_python "$cand"; then PY="$(command -v "$cand")"; break; fi
    done
    if [ -z "$PY" ]; then
        say "Python 3.11 or newer is needed - installing it (sudo may ask for your password)."
        if command -v apt-get >/dev/null 2>&1; then
            $SUDO env DEBIAN_FRONTEND=noninteractive apt-get update -qq </dev/null >/dev/null 2>&1 || true
            for v in 3.12 3.11; do
                if $SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq "python$v" "python$v-venv" </dev/null >/dev/null 2>&1; then
                    PY="$(command -v "python$v")"; break
                fi
            done
            if [ -z "$PY" ] && $SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq python3 python3-venv </dev/null >/dev/null 2>&1 \
                    && good_python python3; then
                PY="$(command -v python3)"
            fi
        elif command -v dnf >/dev/null 2>&1; then
            $SUDO dnf install -y -q python3.12 </dev/null >/dev/null 2>&1 && PY="$(command -v python3.12)"
        fi
    fi
    if [ -z "$PY" ]; then
        # Last resort, no root needed: a standalone Python from uv (works on arm64 too).
        say "No packaged Python 3.11+ here - fetching a standalone one with uv."
        curl -LsSf https://astral.sh/uv/install.sh | env UV_NO_MODIFY_PATH=1 sh >/dev/null 2>&1 || true
        UV="$HOME/.local/bin/uv"
        [ -x "$UV" ] && "$UV" python install 3.12 >/dev/null 2>&1 && PY="$("$UV" python find 3.12 2>/dev/null)"
    fi
    [ -n "$PY" ] && good_python "$PY" || fail "Could not find or install Python 3.11+." \
        "Install python3.11 (or newer) and python3.11-venv, then run the same command again." \
        "מתקינים python3.11 (או חדש יותר) ו־python3.11-venv ומריצים שוב את אותה פקודה."
    say "[ok] $("$PY" -V 2>&1)"

    STAGE="$(mktemp -d "${TMPDIR:-/tmp}/llm-api-install.XXXXXX")"
    trap 'rm -rf "$STAGE"' EXIT
    CODE="$(curl -sSL -o "$STAGE/llm-api.tar.gz" -w '%{http_code}' "$URL" || echo 000)"
    [ "$CODE" = "200" ] || fail "Could not download $URL ($CODE)." \
        "Check the internet connection and run the same command again." \
        "בודקים את החיבור לאינטרנט ומריצים שוב את אותה פקודה."
    GOT="$("$PY" -c 'import hashlib, sys; print(hashlib.sha256(open(sys.argv[1], "rb").read()).hexdigest())' "$STAGE/llm-api.tar.gz")"
    [ "$GOT" = "$SHA256" ] || fail "The download does not match its SHA-256 - nothing was installed." \
        "expected $SHA256, got $GOT. Try again later; if it repeats, report it." \
        "הקובץ שהורד לא תואם את ה־SHA-256 שלו, ולא הותקן כלום."
    say "[ok] downloaded llm-api $VERSION, SHA-256 checked"
    "$PY" -c 'import sys, tarfile; t = tarfile.open(sys.argv[1]); t.extractall(sys.argv[2], filter="data")' \
        "$STAGE/llm-api.tar.gz" "$STAGE" 2>/dev/null \
        || "$PY" -c 'import sys, tarfile; tarfile.open(sys.argv[1]).extractall(sys.argv[2])' "$STAGE/llm-api.tar.gz" "$STAGE" \
        || fail "The download could not be unpacked." "Run the same command again." "מריצים שוב את אותה פקודה."

    # stdin is this script: give the installer the terminal (sudo prompts) or nothing.
    # (A subshell: a failed redirection on a builtin would end this very shell
    # silently when there is no terminal - docker exec, cloud-init, CI.)
    if (exec </dev/tty) 2>/dev/null; then IN=/dev/tty; else IN=/dev/null; fi
    # shellcheck disable=SC2086
    "$PY" "$STAGE/llm-api/installer.py" --auto --role standalone --dir "$DIR" $PASS <"$IN" || exit 1
    case " $PASS " in *" --dry-run "*) return 0 ;; esac
    printf '\n  Open the console on this machine:  http://127.0.0.1:8000/console\n'
    printf '  פותחים את הקונסולה במכונה הזאת:   http://127.0.0.1:8000/console\n'
    printf '  No screen on this machine? From your computer:  ssh -L 8000:127.0.0.1:8000 %s@<this machine>\n' "$(id -un)"
    printf '  then open http://127.0.0.1:8000/console there.\n\n'
}

main "$@"
