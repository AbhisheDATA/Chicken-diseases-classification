# Use a smaller base image
FROM python:3.8-alpine

# Install AWS CLI and update the package list
RUN apk --no-cache add aws-cli

# Set the working directory in the container
WORKDIR /app

# Copy just the requirements file first to leverage Docker caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Specify the command to run your application
CMD ["python3", "app.py"]
