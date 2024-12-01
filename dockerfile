# Use an official Python slim image as the base
FROM python:3.12.6-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1  
ENV PYTHONUNBUFFERED=1         

# Set the working directory inside the container
WORKDIR /django

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev gcc python3-dev musl-dev default-libmysqlclient-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install pip and update it
RUN pip install --upgrade pip

# Copy requirements.txt to the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Ensure media folder exists
RUN mkdir -p /django/media

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["sh", "-c", "python manage.py migrate && gunicorn django_curd.wsgi:application --bind 0.0.0.0:8000"]
