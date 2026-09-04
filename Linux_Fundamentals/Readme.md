# Linux Fundamentals Assignment

**Name:** Abhiroop Sistu  
**Enrollment Number:** 24bcs10287  

---

## Task 1: Soft Links vs. Hard Links

*   **Soft Link (Symlink):** This functions exactly like a Windows shortcut. It simply points to the original file's location. If the original file is deleted, the link breaks (becoming a dangling link) since its target is gone. It also receives its own unique inode number.
*   **Hard Link:** Think of this as an alternate physical doorway to the exact same data on the disk. It shares the identical inode number with the source file. If you delete the original file, the hard link remains fully functional because the actual data blocks haven't been removed yet.

### My Hands-On Practice

First, I generated a dummy test file:

```bash
echo "Testing out Linux links for DevOps" > original.txt
```

Next, I created both a hard and a soft link:

```bash
ln original.txt hard_link.txt      # Created the hard link
ln -s original.txt soft_link.txt   # Created the soft link (using the -s flag)
```

To verify their behavior, I checked the inodes using `ls -li`:

```text
1458291 -rw-r--r-- 2 abhiroop abhiroop 35 Sep 3 18:00 hard_link.txt
1458291 -rw-r--r-- 2 abhiroop abhiroop 35 Sep 3 18:00 original.txt
1458299 lrwxrwxrwx 1 abhiroop abhiroop 12 Sep 3 18:01 soft_link.txt -> original.txt
```

**Observation:** `original.txt` and `hard_link.txt` share the same inode (**`1458291`**), while `soft_link.txt` has a completely different inode.

### Interview Prep: What happens if the source file is deleted?

If I execute:

```bash
rm original.txt
```

I can still read the contents by running:

```bash
cat hard_link.txt
```

However, running:

```bash
cat soft_link.txt
```

will return a **"No such file or directory"** error since its target path no longer exists.

Another key difference is that **soft links can point across different file systems, while hard links generally cannot**.

---

## Task 2: `adduser` vs `useradd`

I previously thought these commands were interchangeable, but they operate very differently in Ubuntu/WSL.

- **`useradd`:** This is the low-level, native Linux command. Running `useradd newuser` does the bare minimum. It won't prompt for a password, it won't create a home directory unless you add the `-m` flag, and it doesn't necessarily assign the interactive shell you want by default. It is best suited for automated/background scripts rather than manual user creation.
- **`adduser`:** This is the recommended approach for Ubuntu. It is actually a friendly Perl script that calls `useradd` in the background but provides an interactive setup wizard.

### Creating a Test User

I utilized `adduser` to generate a test profile, which automatically configured the home directory and prompted me for the necessary details:

```bash
sudo adduser devtestuser
```

### Output

```text
Adding user `devtestuser' ...
Creating home directory `/home/devtestuser' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for devtestuser
	Full Name []: Dev Test User
	Room Number []: 
Is the information correct? [Y/n] Y
```

This was much easier! I verified the creation by checking `/etc/passwd` and confirmed the user was fully set up with a `/bin/bash` shell ready to go.

---

## Task 3: `journalctl`

The `journalctl` command serves as the master log viewer for Linux distributions using `systemd`. Instead of manually hunting down individual text files in `/var/log`, `journalctl` aggregates logs from sources such as the kernel, boot process, and services into one accessible location.

### Useful Commands from My Practice

- `journalctl`: Dumps every recorded log, which is usually too much information.
- `journalctl -b`: Filters the output to only show logs from the current boot session.
- `journalctl -f`: Runs in **follow mode**, streaming new logs live. This is incredibly useful for real-time debugging of a crashing application.

### Isolating a Specific Service

To view logs for a single service such as SSH, I used the `-u` (unit) flag along with `-n` to restrict the output to the last 15 lines, preventing it from flooding my terminal:

```bash
sudo journalctl -u ssh -n 15
```

This successfully printed out the most recent SSH daemon startups and connection attempts.

---

## Task 4: My Linux Command Cheat Sheet

I spent time practicing these fundamental commands to navigate my WSL terminal efficiently. Here is my quick reference guide.

### Moving Around

- `pwd`: **Print working directory** — displays the exact folder path I am currently inside.
- `ls -la`: Lists all items in a folder, including hidden files (`-a`), and displays detailed permissions (`-l`).
- `cd /path/`: Changes my current directory.

### Messing with Files

- `mkdir -p project/src`: Creates a new directory. The `-p` flag is useful because it builds parent folders if they don't exist yet.
- `touch newfile.txt`: Instantly creates a blank file.
- `cp -r folder1 folder2`: Copies a folder. The `-r` (**recursive**) flag is required when copying directories.
- `mv file.txt /new/path/`: Moves a file to a new destination. It can also be used to rename files.
- `rm -rf folder/`: Force deletes a folder and everything inside it without asking. **Use this command carefully.**

### Reading Files

- `cat file.txt`: Prints the entire file directly into the terminal.
- `head -n 10 file.txt`: Shows the first 10 lines of a file.
- `tail -n 10 file.txt`: Shows the last 10 lines of a file.

### Permissions

- `chmod +x script.sh`: Makes a script executable so it can be run directly.
- `chown user:group file.txt`: Changes the owner and group associated with a file.

### System Checks

- `top` (or `htop`): Opens a live task manager showing processes and their CPU/RAM usage.
- `df -h`: Shows available disk space using human-readable units such as GB.
- `free -h`: Shows current RAM and swap memory usage.

---

