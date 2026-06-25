FROM python:3.11-slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app
COPY dbt_project/ ./dbt_project

CMD ["python", "app/pipeline.py"]