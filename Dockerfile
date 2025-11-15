# Базовый образ
FROM python:3.10-alpine

# Системные зависимости (для pillow / lxml / crypto и т.п.)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Рабочая директория
WORKDIR /app

# Копируем код
COPY . .

# Ставим зависимости
RUN pip install --no-cache-dir -r requirements.txt

# HTTP-порт MCP сервера
EXPOSE 8000

# ВАЖНО: запускаем сервер СРАЗУ в HTTP-режиме, а не stdio
CMD ["python", "ppt_mcp_server.py", "--transport", "http", "--port", "8000"]
