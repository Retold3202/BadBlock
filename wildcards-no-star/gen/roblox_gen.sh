#!/bin/bash

# Process the roblox.txt file
cat base/roblox.txt | grep -v '^#' | grep -v '^\s*$' | sort | uniq > wildcards-no-star/roblox_no_star.txt

# Create the header and combine with the processed file
(echo "# Title: 🎮 Roblox Blocklist (Wildcards no *)" && \
    echo "# Version: $(date +'%d%B%Yv1')" && \
    echo "# Expires: 12 hours" && \
    echo "# Description: Block Roblox telemetry, analytics, advertising, tracking, & more!" && \
    echo "# Homepage: https://badblock.celenity.dev" && \
    echo "" && \
    cat wildcards-no-star/roblox_no_star.txt) > temp_file && mv -v temp_file wildcards-no-star/roblox_no_star.txt

# Back-up old file
mv -v wildcards-no-star/roblox.txt wildcards-no-star/old/roblox_old.txt

# Rename new file
mv -v wildcards-no-star/roblox_no_star.txt wildcards-no-star/roblox.txt