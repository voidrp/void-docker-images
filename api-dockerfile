FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN pip install --upgrade pip
RUN pip install --no-cache-dir \
    flask \
    flask-cors \
    aiohttp \
    python-dotenv

EXPOSE 5000

CMD ["python", "app.py"]
