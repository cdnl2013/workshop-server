#!/bin/bash

# sample iptables config
# DROP ALL INPUT, ALLOW ALL OUTPUT

# Interdire toute connexion entrante et forwardée
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP

# Décommenter pour filtrer aussi les connexions sortantes
# iptables -t filter -P OUTPUT DROP

# Ne pas casser les connexions etablies
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Autoriser loopback
# iptables -t filter -A INPUT -i lo -j ACCEPT

# Autoriser ICMP (Ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT

# Autoriser SSH
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT

# HTTP In/Out
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT

# HTTPS In/Out
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT

# Block sample ip
# iptables -I INPUT -s 12.34.56.78 -j DROP
