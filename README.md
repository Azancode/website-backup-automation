# website-backup-automation
A Bash automation project by **Azan Sagheer** for creating, logging, and uploading website backups securely to the cloud.   This script is part of my **Linux System Administration portfolio**, showcasing shell scripting, automation, and system maintenance skills.


# 🧠 Website Backup Automation Script

A Bash automation project by **Azan Sagheer** for creating, logging, and uploading website backups securely to the cloud.  
This script is part of my **Linux System Administration portfolio**, showcasing shell scripting, automation, and system maintenance skills.

---

## ⚙️ Features

- 🗂️ **Full website backups** from `/var/www`
- 🧾 **Detailed logging** of all actions
- ⏰ **Timestamped backup files**
- ☁️ **Automatic cloud upload** via [rclone](https://rclone.org/)
- 📧 **Email notifications** via `msmtp`
- 🔁 **Backup rotation** (keeps the 5 most recent backups)
- ⚡ **Error handling** for reliability
- 🧩 **Custom arguments** for source and destination

---

## 📜 Usage

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/website-backup-automation.git
cd website-backup-automation
```

### 2️⃣ Make the script executable
```bash
chmod +x backupforwebsites.sh
```

### 3️⃣ Run the script
```bash
./backupforwebsites.sh [SOURCE] [DESTINATION]
```

**Examples:**
```bash
./backupforwebsites.sh /var/www /etc/backupofsites.tar.gz
./backupforwebsites.sh
```

If no arguments are provided, it defaults to:
- Source: `/var/www`
- Destination: `/etc/backupofsites_<timestamp>.tar.gz`

---

## 🧰 Requirements

- Linux (Ubuntu/Debian recommended)
- `tar`
- `rclone`
- `msmtp` (for email notifications)
- `cron` (optional for scheduling)

Install dependencies:
```bash
sudo apt update
sudo apt install tar rclone msmtp -y
```

---

## 🕓 Schedule Automatic Backups

You can automate this script using a **cron job**:
```bash
sudo crontab -e
```

Add the following line to run it daily at midnight:
```
0 0 * * * /path/to/backupforwebsites.sh >> /path/to/backup.log 2>&1
```

---

## 🧠 Example Output (backup.log)

```
-----------------------------------------
Backup Script Started: Fri Oct 17 23:09:46 PKT 2025
Source: /var/www
Destination: /etc/backupofsites_2025-10-17_23-09-46.tar.gz
Creating backup...
Backup created successfully at /etc/backupofsites_2025-10-17_23-09-46.tar.gz
Sending email notification...
Email sent to ChughtaiAzan97@gmail.com
Uploading backup to cloud...
Backup uploaded to cloud at mydrive:backups/
Rotating old backups (keep last 5)...
Old backups rotated.
Backup Script Completed: Fri Oct 17 23:09:46 PKT 2025
-----------------------------------------
```

---

## 👨‍💻 Author

**Azan Sagheer**  
🖥️ Linux System Administrator | Bash Automation | Web Server Management  
📧 [ChughtaiAzan97@gmail.com](mailto:ChughtaiAzan97@gmail.com)  
🌐 [LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/yourusername)

---

## 🏆 Skills Demonstrated

- Linux system administration  
- Bash scripting & automation  
- File compression and management  
- Logging and monitoring  
- Cloud storage integration (rclone)  
- Email automation (msmtp)  
- Scheduling with cron  

---

## 🧾 License

MIT License © 2025 Azan Sagheer
