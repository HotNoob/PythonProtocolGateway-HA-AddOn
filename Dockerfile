ARG BUILD_FROM
FROM $BUILD_FROM

# Copy add-on files
COPY ppg /ppg

RUN apk add --no-cache build-base python3 py3-pip 

# Create a virtual environment and install dependencies
RUN python3 -m venv /venv \
    && /venv/bin/pip install --no-cache-dir -r /ppg/requirements.txt

# Set the working directory and specify the virtual environment in CMD
WORKDIR /ppg
CMD ["/venv/bin/python", "/protocol_gateway.py"]
