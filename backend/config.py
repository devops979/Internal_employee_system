import os
import urllib.parse

class Config:
    # If a full DATABASE_URL is supplied (e.g. from Secrets Manager),
    # just use it. Otherwise build one for local Docker Compose.
    if "DATABASE_URL" in os.environ:
        SQLALCHEMY_DATABASE_URI = os.environ["DATABASE_URL"]
    else:
        user     = urllib.parse.quote_plus(os.getenv("DB_USER", "admin"))
        password = urllib.parse.quote_plus(os.getenv("DB_PASS", "password"))
        host     = os.getenv("DB_HOST", "mysql")      # docker-compose service name
        port     = os.getenv("DB_PORT", "3306")
        dbname   = os.getenv("DB_NAME", "employees")
        SQLALCHEMY_DATABASE_URI = (
            f"mysql+pymysql://{user}:{password}@{host}:{port}/{dbname}"
        )

    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.environ.get("SECRET_KEY", "dev-secret")
    CORS_ORIGINS = os.environ.get("CORS_ORIGINS", "*")
