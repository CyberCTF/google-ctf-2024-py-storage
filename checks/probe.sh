#!/bin/sh
# The store answers an unknown request with a hex-encoded failure.
# The service runs the challenge in nsjail for each connection; the probe sends one harmless request (the hex-encoded line x, which the store answers with fail: unknown request).
(printf '78\n'; sleep 4) | curl -sS --max-time 6 telnet://challenge:1337 2>/dev/null | grep -q "6661696c3a20756e6b6e6f776e2072657175657374"
