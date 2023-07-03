# Use a base image with Ubuntu
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Update the package lists and install Python 3, pip, and other dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev gcc

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
COPY . .

# Expose the port on which the Flask application will run
EXPOSE 5000

# Define the command to run when the container starts
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0:5000"]
