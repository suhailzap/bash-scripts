
````markdown
# 🛠️ Shell Scripting Utilities

A collection of practical and production-grade shell scripts for Linux systems. These tools help with monitoring system performance, archiving logs, and analyzing web server logs.

---

## 📁 Contents

| Script | Description |
|--------|-------------|
| [`server-stats.sh`](#-server-statssh) | Get live system resource usage like CPU, memory, disk, top processes, and more |
| [`log-archive.sh`](#-log-archivesh) | Archive logs with date-timestamp into compressed `.tar.gz` files |
| [`analyze-nginx-logs.sh`](#-analyze-nginx-logssh) | Analyze an Nginx access log for traffic, endpoints, status codes, and user agents |

---

## 🧩 `server-stats.sh`

This script gives a summary of the server’s health and performance.

### 🔧 Features

- Total CPU usage
- Memory usage (used, free, percentage)
- Disk usage on `/`
- Top 5 processes by CPU and memory
- OS version, uptime, load average
- Logged in users
- Failed login attempts (optional)

### ▶️ Usage

```bash
chmod +x server-stats.sh
./server-stats.sh
````

---

## 📦 `log-archive.sh`

Compress logs from a given directory into a `.tar.gz` archive with a timestamp.

### 🧰 Features

* Accepts a log directory as argument
* Archives contents into `~/log_archives/`
* Keeps a `archive_log.txt` for audit

### ▶️ Usage

```bash
chmod +x log-archive.sh
./log-archive.sh /var/log
```

### ⏰ Cron Example

To run it daily at midnight:

```cron
0 0 * * * /path/to/log-archive.sh /var/log
```

---

## 🔍 `analyze-nginx-logs.sh`

Analyze a standard Nginx access log and extract:

* Top 5 IP addresses
* Top 5 request paths
* Top 5 HTTP status codes
* Top 5 user agents

### ▶️ Usage

```bash
chmod +x analyze-nginx-logs.sh
./analyze-nginx-logs.sh access.log
```

> Make sure the log format is the default Nginx combined log format.

---

## 📂 Directory Structure

```bash
.
├── server-stats.sh
├── log-archive.sh
├── analyze-nginx-logs.sh
└── README.md
```

---

## 📋 License

This project is licensed under the MIT License. Feel free to modify and use for personal or professional projects.

---

## 🙌 Contributing

Feel free to open issues or submit pull requests for improvements like:

* Output in JSON or CSV
* S3 upload for archived logs
* Interactive menus or flags

---


