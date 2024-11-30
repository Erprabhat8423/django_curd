# Use an official Python image as the base
FROM python:3.12.6-slim

# Set environment variables
# Prevents Python from writing .pyc files.
ENV PYTHONDONTWRITEBYTECODE=1 

# Ensures output is flushed immediately.
ENV PYTHONUNBUFFERED=1

# Set working directory inside the container
WORKDIR /django

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev gcc python3-dev musl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pip and update it
RUN pip install --upgrade pip

# Copy requirements.txt to the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["gunicorn", "django_curd.wsgi:application", "--bind", "0.0.0.0:8000"]
