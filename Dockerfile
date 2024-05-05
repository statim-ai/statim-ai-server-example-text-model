FROM statim-ai-server:latest

# Install model dependencies
RUN poetry add diffusers
RUN poetry add torch
RUN poetry add transformers

# Download models
COPY --chown=statim:statim handlers/. ./download_models/.
RUN poetry run python download_models/download_models.py

# Copy handlers
COPY --chown=statim:statim handlers/ ./app/handlers/
