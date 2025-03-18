# Используем официальный образ Python
FROM python:3.10

# Устанавливаем рабочую директорию
WORKDIR /app

RUN apt-get update && apt-get install -y libgl1 && rm -rf /var/lib/apt/lists/*

# Копируем файл requirements.txt в контейнер
COPY requirements.txt .

COPY lab-1/SuperdenceCoding.ipynb .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Устанавливаем Jupyter Notebook
RUN pip install jupyter

RUN pip install qiskit qiskit-ibm-runtime qiskit-aer

# Открываем порт для Jupyter Notebook
EXPOSE 8889

# Команда для запуска Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]
