find . -type f -exec sh -c 'mv "$1" "./$(echo "$1" | sed "s|/|_|g" | sed "s|^\._||")"' _ {} \;
