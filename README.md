# ODLRS-Docker

**ODLRS-Docker** is a full-stack Django project built as a **3-tier architecture application** for managing diagnostic centers and generating reports.  
This project is designed primarily for **Docker practice**, demonstrating containerization, volumes for data persistence, and service orchestration via Docker Compose.

---

## Features

- Custom user authentication using **Django Allauth**  
- Manage diagnostic centers, tests, and reports  
- SQLite database for local development  
- Media & static file handling  
- Fully **Dockerized** environment for easy setup and deployment  
- Demonstrates **3-tier architecture**: Web (Django), Database (SQLite), optional separation via Docker Compose

---

## Technology Stack

- **Backend:** Django 2.2.1  
- **Database:** SQLite (local, lightweight)  
- **Python version:** 3.8  
- **Containerization:** Docker & Docker Compose  
- **Frontend:** Django Templates, Bootstrap (via static files)  

---

***##MUST DOWNLOAD database db.sqlite3 via drive link before running application( place it in same folder)
https://drive.google.com/file/d/18tyowDNglRWU1SECs-36952r0hp7pOBs/view?usp=sharing

## Docker Setup

### 1. Build the Docker image

```bash
docker build -t odlrs-backend .


docker run -it -p 8000:8000 odlrs-backend
```


The project includes a docker-compose.yaml file to manage the web and database services.
```
docker-compose up --build
```

The Django app will be available on port 8000

Database is persisted via Docker volumes
