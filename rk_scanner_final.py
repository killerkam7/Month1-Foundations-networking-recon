import socket
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

def is_host_up(ip):
    ports = [80, 443, 22, 445]
    for port in ports:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(0.3)
            result = sock.connect_ex((ip, port))
            sock.close()
            if result == 0:
                return ip
        except:
            pass
    return None

print("Cameron Final Scanner")
with ThreadPoolExecutor(max_workers=50) as executor:
    future_to_ip = {executor.submit(is_host_up, f"192.168.12.{i}"): i for i in range(1, 255)}
    for future in as_completed(future_to_ip):
        ip = future.result()
        if ip:
            print(f"Host UP: {ip}")
