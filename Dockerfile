# python image as base or parent image 

FROM python:3.8-slim-bullseye

# Disable .pyc and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies for Pillow
RUN apt-get update && apt-get install -y --no-install-recommends \
    libjpeg-dev zlib1g-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install requirements
RUN python -m pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Copy all project files
COPY . .


# Expose port
EXPOSE 8000


# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

