import os
import subprocess
import sys

def is_source_code_directory(path):
    """Check if directory contains source code by looking for common build files"""
    indicators = [
        "CMakeLists.txt",
        "configure",
        "configure.ac", 
        "configure.in",
        "Makefile",
        "Makefile.in",
        "meson.build",
        "setup.py",
        "Cargo.toml"
    ]
    
    for indicator in indicators:
        if os.path.exists(os.path.join(path, indicator)):
            return True
    return False

tmp_path = "/tmp"

# Process directories directly (skip archive extraction)
for item in os.listdir(tmp_path):
    item_path = os.path.join(tmp_path, item)
    
    # Only process directories that contain source code
    if os.path.isdir(item_path) and is_source_code_directory(item_path):
        print(f"[+] Processing source directory: {item}")
        
        build_dir = os.path.join(item_path, "build")
        os.makedirs(build_dir, exist_ok=True)
        
        # Run CMake
        try:
            print(f"[+] Running CMake for {item}...")
            result = subprocess.run(["cmake", ".."], cwd=build_dir, check=True)
            print(f"[+] CMake completed successfully for {item}")
        except subprocess.CalledProcessError as e:
            print(f"[!] CMake failed for {item}: {e}")
            sys.exit(1)
        
        # Run Make
        try:
            print(f"[+] Building {item}...")
            result = subprocess.run(["make", f"-j{os.cpu_count()}"], cwd=build_dir, check=True)
            print(f"[+] Build completed successfully for {item}")
        except subprocess.CalledProcessError as e:
            print(f"[!] Build failed for {item}: {e}")
            sys.exit(1)
        
        # Run Make Install
        try:
            print(f"[+] Installing {item}...")
            result = subprocess.run(["make", "install"], cwd=build_dir, check=True)
            print(f"[+] Installation completed successfully for {item}")
        except subprocess.CalledProcessError as e:
            print(f"[!] Installation failed for {item}: {e}")
            sys.exit(1)
        
        # Optional: clear screen
        os.system("clear")
        print(f"[+] Successfully processed {item}")

print("[+] All source directories processed successfully!")