# Uses the latest image provided by statim-ai-server-base
FROM statim-ai-server:0.1.0

# Install model dependencies
# Example:
#    RUN poetry add <package>
RUN poetry add diffusers
RUN poetry add torch
RUN poetry add transformers
RUN poetry add accelerate

# Download models
# This will run the create_model.py file for each handler present in the handlers directory
COPY --chown=statim:statim handlers/. ./download_models/.
RUN poetry run python download_models/download_models.py

# Copy handlers
# This will copy all the handlers present in the handlers directory to the app directory
COPY --chown=statim:statim handlers/ ./app/handlers/
