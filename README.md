# b3DS
The original b1k/b3DS project, but dockerized.

## Prerequisites
* Docker engine

## Usage

### With docker (recommended)
```sh
docker build -t b3ds:latest # to build docker image
docker buildx build -t b3ds:latest . # if the previous command did not succeed
docker run b3ds (D/E).py <game_name>.3ds # D for decrypt and E for Encrypt followed by the game file name
```

### With python 2.7
```sh
python b3DSEncrypt.py (file.3ds) # to encrypt 3ds file
python b3DSDecrypt.py (file.cia) # to decrypt cia file
```
## Support
Supports all known crypto-types:

* Normal (Key 0x2C)
* 7.x (Key 0x25)
* New3DS 9.3 (Key 0x18)
* New3DS 9.6 (Key 0x1B)
