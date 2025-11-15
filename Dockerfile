# Используем официальный Python + alpine
FROM python:3.10-alpine

# Системные зависимости для python-pptx/Pillow
RUN apk add --no-cache gcc musl-dev libffi-dev

# Рабочая директория
WORKDIR /app

# Копируем код
COPY . .

# Python-зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Порт, который будет слушать сервер внутри контейнера
EXPOSE 8000

# Запускаем MCP-сервер в режиме HTTP
# Важно: именно http-транспорт, чтобы Smithery мог стучаться
CMD ["python", "ppt_mcp_server.py", "--transport", "http", "--port", "8000"]
