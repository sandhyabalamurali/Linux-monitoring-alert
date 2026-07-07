# Linux System Monitoring Agent

## About the Project

This is my first Linux automation project using Bash scripting.

The purpose of this project is to monitor system resources continuously. The script checks CPU usage, memory usage, disk usage, and network statistics every 60 seconds. It stores all the collected data in a CSV file. If any resource usage exceeds the configured threshold, an email alert is sent using Postfix and Gmail SMTP.

This project helped me understand how Linux monitoring works and how automation can reduce manual work for system administrators.

---

## Features

- Monitor CPU usage
- Monitor Memory usage
- Monitor Disk usage
- Monitor Network RX/TX bytes
- Store monitoring logs in a CSV file
- Send email alerts when thresholds are exceeded
- Continuous monitoring using a Bash while loop

---

## Technologies Used

- Bash Shell Scripting
- Ubuntu Linux
- AWK
- Top
- Free
- DF
- Postfix
- Gmail SMTP

---

## Project Workflow

1. Install and configure Postfix.
2. Create the monitoring script.
3. Collect CPU, Memory, Disk, and Network usage.
4. Save the values into a CSV file.
5. Compare values with the configured thresholds.
6. Send an email alert if the threshold is exceeded.
7. Wait for 60 seconds and repeat the process.

---

## What I Learned

During this project I learned:

- Writing Bash scripts
- Using loops and conditions
- Parsing Linux command output using AWK
- Reading system information
- Logging data into CSV files
- Configuring Postfix with Gmail SMTP
- Sending email alerts automatically
- Debugging Bash scripts

---

## Flowchart
<img width="1536" height="1024" alt="ChatGPT Image Jul 7, 2026, 09_40_59 PM" src="https://github.com/user-attachments/assets/80406b5f-a871-442d-af3f-92e1c753759d" />


---

## How to Run

```bash
chmod +x monitor.sh
./monitor.sh
```

---

## Sample Output

```text
CPU Usage: 12.45%
Memory Usage: 35.12%
Disk Usage: 48%
RX Bytes: 145623
TX Bytes: 56321
```

---

## Author

**Sandhya Balamurali**

This project is part of my Linux and Cloud learning journey. I am building projects to improve my Linux, Shell Scripting, AWS, and DevOps skills.
