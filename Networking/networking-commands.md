# Network Fundamentals Assignment

---

## 1. Basic Host and IP Info

*   `hostname`: Prints the computer's network name.
*   `ipconfig | grep -i 'IPv4'`: Retrieves the Windows IP configuration and filters the output to only show the local IPv4 address.
*   `getmac //v`: Displays the physical MAC addresses of all network adapters on the machine in a detailed (verbose) format.

![Basic Host Info](Screenshot%202026-09-03%20210147.png)

---

## 2. Routing and ARP (Neighbors)

*   `route print -4`: Displays the machine's active IPv4 routing table, showing how network traffic is directed.
*   `arp -a`: Displays the ARP (Address Resolution Protocol) cache, which maps local IP addresses to their corresponding physical MAC addresses.

![Routing and ARP](Screenshot%202026-09-03%20210401.png)

---

## 3. Connectivity Testing (Ping and Traceroute)

*   `ping -n 4 8.8.8.8`: Sends exactly 4 ICMP echo requests to Google's public DNS server (8.8.8.8) to verify internet connectivity.
*   `tracert -h 12 google.com`: Traces the path that data packets take across the internet to reach google.com, limited to a maximum of 12 hops.

![Connectivity Testing](Screenshot%202026-09-03%20210454.png)

---

## 4. DNS Lookups

*   `nslookup google.com`: Queries the default DNS server to resolve the domain name "google.com" into its associated IP addresses.
*   `nslookup 8.8.8.8`: Performs a reverse DNS lookup to find the domain name associated with the IP address 8.8.8.8.
*   `ipconfig /all | grep -i 'dns servers'`: Retrieves detailed network configuration and filters the output to display the currently configured DNS servers.

![DNS Lookups](Screenshot%202026-09-03%20210519.png)

---

## 5. Network Statistics and Ports

*   `netstat -ano | grep LISTENING`: Lists all active network connections and filters for ports that are actively listening for incoming traffic, along with their Process IDs (PID).
*   `netstat -s`: Displays detailed network statistics categorized by protocol (e.g., IPv4, IPv6, TCP, UDP).

![Network Statistics](Screenshot%202026-09-03%20210548.png)

---

## 6. Web Requests and Port Scanning

*   `curl -I https://github.com`: Sends a web request to GitHub and fetches only the HTTP headers to verify the server is responding correctly.
*   `curl -s ifconfig.me`: Silently queries an external web service to reveal the network's public-facing external IP address.
*   `powershell -Command 'Test-NetConnection -ComputerName github.com -Port 443'`: Uses PowerShell to check if port 443 (HTTPS) is open and accessible on github.com.

![Web Requests Part 1](Screenshot%202026-09-03%20210657.png)
![Web Requests Part 2](Screenshot%202026-09-03%20210721.png)