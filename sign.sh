#!/bin/sh
# Signs every list with the key whose public half the game ships (public.pem), then checks the signature.
set -e
cd "$(dirname "$0")"
Key="${BADLADS_SIGNING_KEY:-$HOME/.badlads/driver-workarounds-signing.pem}"
for List in workarounds-*.json; do
	openssl dgst -sha256 -sign "$Key" -out "$List.bin" "$List"
	openssl dgst -sha256 -verify public.pem -signature "$List.bin" "$List"
	openssl base64 -A -in "$List.bin" > "$List.sig"
	rm "$List.bin"
done
