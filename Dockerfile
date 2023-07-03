# Use an official Python runtime as the base image
FROM python:3

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Create a virtual environment
RUN python3 -m venv venv

# Activate the virtual environment
RUN /bin/bash -c "source venv/bin/activate"

# Install dependencies
RUN pip install flask torch nltk numpy sklearn pandas matplotlib

# Copy the Django project to the container
COPY . .

# Expose the Django development server port (adjust if needed)
EXPOSE 5000

# Set the command to run when the container starts
CMD ["python" ,"-m" , "flask" ,"run"]
