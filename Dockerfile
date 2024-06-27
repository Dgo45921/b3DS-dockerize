FROM python:2.7-stretch


WORKDIR /b3DS


COPY b3DSDecrypt.py /b3DS/D.py
COPY b3DSEncrypt.py /b3DS/E.py
# Copy the game you want to decrypt/encrypt
COPY game_name.3ds /b3DS/game_name.3ds 
RUN pip install pycrypto


ENTRYPOINT [ "python" ]