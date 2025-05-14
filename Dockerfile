

# 1. Immagine ufficiale di Python
FROM python:3.10-slim

# 2. Installa SOLO chromadb (1.0.9 è l'ultima al momento)
RUN pip install --no-cache-dir chromadb==1.0.9

# 3. Directory per i dati (Render può montarci un disk)
RUN mkdir -p /chroma_data
WORKDIR /chroma_data

# 4. Render ti fornisce $PORT a runtime → usa quello
CMD ["sh", "-c", "chroma run --host 0.0.0.0 --port ${PORT:-8000} --path /chroma_data"]
