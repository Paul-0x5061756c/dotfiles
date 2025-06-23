#!/bin/bash

if ip a show tun0 > /dev/null 2>&1; then
    # Get the IP address assigned to tun0
    vpn_ip=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    echo "{\"text\": \"🔒 VPN ($vpn_ip)\", \"tooltip\": \"VPN is active: $vpn_ip\", \"class\": \"vpn-on\"}"
else
    echo '{"text": "🔓 No VPN", "tooltip": "VPN is not connected", "class": "vpn-off"}'
fi

