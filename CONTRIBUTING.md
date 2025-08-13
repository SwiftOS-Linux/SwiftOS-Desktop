# SwiftOS Desktop

## Getting This Repo
```bash
git clone https://github.com/SwiftOS-Linux/SwiftOS-Desktop.git
```

## Container Making By Docker
```bash
docker build -t swiftos-desktop .
docker run -it --privileged -v "%cd%:/root/SwiftOS-Desktop" --entrypoint /bin/bash -p 3390:3390 swiftos-desktop
```
## Compilation
```bash
cmake -B build
cd build
make -j$(nproc)
```
