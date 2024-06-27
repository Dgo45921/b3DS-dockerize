# b3DS
The original b1k/b3DS project, but dockerized.

## Prerequisites
* Docker engine

## Usage

### Using Docker (Recommended)

**Note: To build the image succesfully, you must have the game in the same folder as the DockerFile and the b3DSDecrypt py, b3DSEncrypt.py scripts. You must also edit the line 10 of the DockerFile replacing both 'game_name' with the name of the game you want to encrypt/decrypt**

**For example:**
```DockerFile
FROM python:2.7-stretch


WORKDIR /b3DS


COPY b3DSDecrypt.py /b3DS/D.py
COPY b3DSEncrypt.py /b3DS/E.py
# Copy the game you want to decrypt/encrypt
COPY MarioGame.3ds /b3DS/MarioGame.3ds 
RUN pip install pycrypto


# Create a directory to mount as a volume

ENTRYPOINT [ "python" ]


```

1. **Build Docker Image:**

   ```sh
   docker build -t b3ds:latest .
   ```
    if the above command fails, use:
    ```sh
    docker buildx build -t b3ds:latest .
    ```
2. **Run docker container:**
    ```sh
    docker run --volume <path_of_your_host_machine>:(/decrypted_games|/encrypted_games) b3ds (D/E).py <game_name>.3ds
    ```
   - Replace <path_of_your_host_machine> with the path on your host machine where the decrypted/encrypted game will be.
   - Choose either /decrypted_games or /encrypted_games to link to the respective folder inside the container.
   - Use D for decrypting or E for encrypting, followed by the game file name <game_name>.3ds.

   example:
    ```sh
    docker run --volume /home/johnDoe/mygames:/decrypted_games b3ds D.py MarioGame.3ds
    ```


### Using python 2.7
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
