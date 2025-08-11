import os
import subprocess
import sys

tmp_path = "/tmp"

for file in os.listdir(tmp_path):
    if file.endswith(".tar.xz"):
        full_path = os.path.join(tmp_path, file)
        
        print(f"[+] Processing {file}...")
        
        # Extract the archive
        try:
            result = subprocess.run(["tar", "-xf", full_path], cwd=tmp_path, check=True)
            print(f"[+] Successfully extracted {file}")
        except subprocess.CalledProcessError as e:
            print(f"[!] Failed to extract {file}: {e}")
            sys.exit(1)
        
        # Try to find the directory that was extracted
        folder_name = file.replace(".tar.xz", "")
        folder_path = os.path.join(tmp_path, folder_name)
        
        # If the directory exists, compile it
        if os.path.isdir(folder_path):
            print(f"[+] Found extracted folder: {folder_name}")
            build_dir = os.path.join(folder_path, "build")
            os.makedirs(build_dir, exist_ok=True)
            
            # Run CMake
            try:
                print(f"[+] Running CMake for {folder_name}...")
                result = subprocess.run(["cmake", ".."], cwd=build_dir, check=True)
                print(f"[+] CMake completed successfully for {folder_name}")
            except subprocess.CalledProcessError as e:
                print(f"[!] CMake failed for {folder_name}: {e}")
                sys.exit(1)
            
            # Run Make
            try:
                print(f"[+] Building {folder_name}...")
                result = subprocess.run(["make", f"-j{os.cpu_count()}"], cwd=build_dir, check=True)
                print(f"[+] Build completed successfully for {folder_name}")
            except subprocess.CalledProcessError as e:
                print(f"[!] Build failed for {folder_name}: {e}")
                sys.exit(1)
            
            # Run Make Install
            try:
                print(f"[+] Installing {folder_name}...")
                result = subprocess.run(["make", "install"], cwd=build_dir, check=True)
                print(f"[+] Installation completed successfully for {folder_name}")
            except subprocess.CalledProcessError as e:
                print(f"[!] Installation failed for {folder_name}: {e}")
                sys.exit(1)
            
            # Optional: clear screen
            os.system("clear")
            print(f"[+] Successfully processed {file}")
            
        else:
            print(f"[!] Could not find extracted folder for {file}")
            sys.exit(1)

print("[+] All archives processed successfully!")