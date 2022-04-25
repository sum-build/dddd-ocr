FROM python:3.9-slim-buster

COPY . /app

RUN cd /app \
#    && pip3 config set global.index-url "https://repo.nju.edu.cn/repository/pypi/simple" \
    && python3 -m pip install --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt \
    && pip3 uninstall opencv-python -y \
    && pip3 install opencv-python-headless \
    && rm -rf /tmp/* && rm -rf /root/.cache/*

WORKDIR /app
CMD ["python3", "ocr_server.py", "--port", "80", "--ocr", "--det"]
