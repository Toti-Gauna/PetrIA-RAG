# PLACEHOLDER for the assistant (FastAPI). It only proves that the image builds
# and starts. Installing dependencies and the real entrypoint arrive with the
# assistant, batch 1.7.
FROM python:3.12-slim

# Never run as root inside the container.
RUN useradd --create-home --uid 10001 app
USER app
WORKDIR /home/app

CMD ["python", "-c", "print('PetrIA-RAG: placeholder image, no app yet')"]
