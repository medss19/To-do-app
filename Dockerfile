# Step 1: Use official Python runtime as base image
FROM python:3.11-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy the current directory contents into the container
COPY . /app

# Step 4: Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose the port the app runs on
EXPOSE 8000

# Step 6: Define environment variable (optional for Flask apps)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8000

# Step 7: Run the Flask app using gunicorn or flask
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
