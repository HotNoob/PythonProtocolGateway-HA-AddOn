ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache build-base python3 py3-pip py3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Install Python dependencies in the virtual environment
RUN /venv/bin/pip install --no-cache-dir -r /ppg/requirements.txt

# Set the working directory and specify the virtual environment in CMD
WORKDIR /ppg
CMD ["/venv/bin/python", "/ppg/protocol_gateway.py"]
