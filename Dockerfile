# -----------------------
# 🐳 Base Image
# -----------------------
FROM python:3.9-slim

# -----------------------
# 🧱 Set working directory
# -----------------------
WORKDIR /app

# -----------------------
# 🧾 Copy all project files
# -----------------------
COPY . /app

# -----------------------
# 🧰 Install dependencies
# -----------------------
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir pandas numpy scikit-learn xgboost shap streamlit

# -----------------------
# 🚪 Expose Streamlit port
# -----------------------
EXPOSE 8501

# -----------------------
# 🚀 Default Command
# -----------------------
CMD ["streamlit", "run", "app_streamlit/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
