FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN useradd -m nonroot
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
USER nonroot

CMD ["gunicorn", "-b", ":8080", "main:app"]

