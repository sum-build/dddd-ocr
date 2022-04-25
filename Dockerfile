FROM python:3.9-slim-buster

COPY . /app

RUN cd /app \
#    && pip3 config set global.index-url "https://repo.nju.edu.cn/repository/pypi/simple" \
    && python3 -m pip install --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -rf /tmp/* && rm -rf /root/.cache/* \
#    && sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com/#g' /etc/apt/sources.list \
    && apt-get --allow-releaseinfo-change update \
    && apt install libgl1-mesa-glx libglib2.0-0 -y \
    && apt clean

WORKDIR /app
CMD ["python3", "ocr_server.py", "--port", "80", "--ocr", "--det"]