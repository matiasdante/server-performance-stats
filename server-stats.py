import subprocess

# import os

# You can easy use os.system("command")

def exec(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout.strip()

print("=== OPERATING SYSTEM ===")
print(exec("cat /etc/os-release | grep -e '^NAME' -e '^VERSION'"), '\n')
# os.system("cat /etc/os-release | grep -e '^NAME' -e '^VERSION'")

print("=== UPTIME ===")
print(exec("uptime -p"), '\n')
# os.system("uptime -p")

print("=== LOAD AVERAGE ===")
print(exec("lscpu | awk '/^CPU\\(s\\):/ { print \"CPU Total Cores: \" $2 }'"))
# os.system("lscpu | awk '/^CPU\\(s\\):/ { print \"CPU Total Cores: \" $2 }'")
print(exec("uptime | awk -F'load average:' '{ print $2 }'"), '\n')
# os.system("uptime | awk -F'load average:' '{ print $2 }'")

print("=== USERS ===")
print(exec("who"), '\n')
# os.system("who")

print("=== LOGIN FAILED ===")
print(exec("sudo lastb | head -n 10"), '\n')
# os.system("sudo lastb | head -n 10")

print("=== TOTAL CPU USAGE ===")
cpu_info = exec("top -bn1 | grep 'Cpu(s)'")
# cpu_info = os.system("top -bn1 | grep 'Cpu(s)'")
cpu_used = cpu_info.split()[1]
cpu_sys = cpu_info.split()[3]
cpu_idle = cpu_info.split()[7]
print(f"CPU Used: {cpu_used}%")
print(f"CPU System: {cpu_sys}%")
print(f"CPU Idle: {cpu_idle}%", '\n')

print("=== TOTAL RAM USAGE ===")
print(exec("free -h"), '\n')
# os.system("free -h")

print("=== TOTAL DISK USAGE ===")
print(exec("df -h"), '\n')
# os.system("df -h")

print("=== TOP PS BY CPU ===")
print(exec("ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6"), '\n')
# os.system("ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6")

print("=== TOP PS BY RAM ===")
print(exec("ps -eo pid,comm,%mem --sort=-%mem | head -n 6"), '\n')
# os.system("ps -eo pid,comm,%mem --sort=-%mem | head -n 6")
