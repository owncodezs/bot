# Use a base image with Ubuntu
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Update the package lists and install Python 3 and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install virtualenv
RUN pip3 install virtualenv

# Create a virtual environment
RUN python3 -m venv venv

# Activate the virtual environment
RUN /bin/bash -c "source venv/bin/activate"

# Install project dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask application code to the working directory
COPY app.py .

# Expose the port on which the Flask application will run
EXPOSE 5000

# Define the command to run when the container starts
CMD ["python3", "app.py"]
