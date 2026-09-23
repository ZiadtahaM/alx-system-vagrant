#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Cleanup trap
cleanup() {
    local exit_code=$?
    echo "Cleaning up resources..."
    exit "$exit_code"
}
trap cleanup EXIT ERR INT TERM

# Argument parsing
while [[ $# -gt 0 ]]; do
    case "$1" in
        --file|-f)
            FILE="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 --file <path>"
            exit 0
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

if [[ -z "${FILE:-}" ]]; then
    echo "Error: --file argument is required."
    exit 1
fi

echo "Processing $FILE..."
# Simulate work
sleep 1
echo "Done."

