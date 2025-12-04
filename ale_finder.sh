#!/bin/bash

# DEBUG="/tmp/ale_finder_debug.log"

function debug_log {
    # if $DEBUG exists and has size > 0, log messages to it
    if [ -s "$DEBUG" ]; then
        echo "$1" >> "$DEBUG"
    fi
}

# Define log file
debug_log "--- NEW RUN $(date) ---"

LINTER_NAME=$(basename "$0" | sed 's/^ale_//; s/\.sh$//')
debug_log "Linter determined: $LINTER_NAME"

TARGET_FILE="$1"
debug_log "Target file arg: $TARGET_FILE"

if [ -z "$TARGET_FILE" ] || [[ "$TARGET_FILE" == -* ]]; then
    DIR="$PWD"
else
    DIR=$(cd "$(dirname -- "$TARGET_FILE")" && pwd)
fi
debug_log "Starting search from: $DIR"

# Search upwards
while [ "$DIR" != "/" ]; do
    CANDIDATE="$DIR/env/bin/$LINTER_NAME"
    debug_log "Checking for: $CANDIDATE"

    if [ -f "$CANDIDATE" ]; then
        debug_log echo "FOUND IT!"
        
        # Set PYTHONPATH
        export PYTHONPATH="$DIR:$PYTHONPATH"
        debug_log "Exported PYTHONPATH: $PYTHONPATH"
        
        # Exec local
        debug_log "Executing local binary..."
        exec "$CANDIDATE" "$@"
    fi
    DIR=$(dirname "$DIR")
done

debug_log "FAILURE: Could not find 'env/bin/$LINTER_NAME' in any parent directory."
debug_log "Falling back to global system $LINTER_NAME"
debug_log ""

# Fallback
exec "$LINTER_NAME" "$@"
