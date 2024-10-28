ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache build-base

# Install Python and pip
RUN apk add --no-cache python3 py3-pip

# Copy add-on files
COPY ppg /ppg

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /ppg/requirements.txt

# Set the working directory
WORKDIR /ppg

# Run the main script
CMD ["python3", "/ppg/protocol_gateway.py"]
