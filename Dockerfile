FROM python:3.10-slim

WORKDIR /app

# dipendenze
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# directory per la persistenza (facoltativa: abbinala a un “Disk” di Render)
RUN mkdir -p /chroma_db_path

# Render assegna la porta in $PORT ⇒ la passiamo a chroma
CMD ["sh", "-c", "chroma run --host 0.0.0.0 --port $PORT --path /chroma_db_path"]
