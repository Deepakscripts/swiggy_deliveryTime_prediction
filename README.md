
# 📦 Swiggy Delivery Time Prediction 🚀  

## 📌 Overview  
This project aims to **predict the estimated delivery time** for food orders based on multiple influencing factors, such as:  
✔ **Rider details**  
✔ **Vehicle information**  
✔ **Weather conditions**  
✔ **Traffic congestion**  
✔ **Restaurant and customer locations**  

## 🎯 Business Use Case  
In the competitive **food delivery** market, **accurate Estimated Time of Arrival (ETA)** predictions are crucial for:  
✔ **Enhancing Customer Satisfaction** – Reducing uncertainty in wait times  
✔ **Optimizing Delivery Operations** – Efficient resource allocation for drivers  
✔ **Reducing Operational Costs** – Better planning leads to fuel and time savings  
✔ **Minimizing Order Cancellations** – Customers are less likely to cancel if they have reliable ETAs  

## 🏗️ Tech Stack  
### 🔹 Machine Learning & Backend  
- **Python 3.11** (pandas, NumPy, scikit-learn)  
- **MLflow** (Model tracking and experiment logging)  
- **DVC (Data Version Control)**  
- **Flask API** (For serving model predictions)  

### 🔹 Cloud & DevOps  
- **AWS (EC2, S3, ECR, CodeDeploy, IAM, CloudWatch)**  
- **GitHub Actions** (CI/CD automation)  
- **Docker** (Containerization for deployment)  

### 🔹 CI/CD Pipeline  
Our **Continuous Integration and Deployment (CI/CD)** process includes:  
✔ **Code Checkout & Dependency Management**  
✔ **Data & Model Versioning (DVC)**  
✔ **Automated Unit & Performance Tests**  
✔ **Building & Deploying Docker Image to AWS ECR**  
✔ **Automated Deployment using AWS CodeDeploy**  

## 🔄 CI/CD Workflow  
The **GitHub Actions CI/CD pipeline** automates the process with the following steps:  
1️⃣ **Code Checkout & Setup Python** (GitHub Actions)  
2️⃣ **Install Dependencies** (`requirements-dev.txt`)  
3️⃣ **DVC Pull** (Retrieve versioned data & models)  
4️⃣ **Model Testing** (Test registry & performance)  
5️⃣ **Model Promotion** (Deploy the best model)  
6️⃣ **Docker Image Build & Push to AWS ECR**  
7️⃣ **Deploy to AWS EC2 using AWS CodeDeploy**  

## 🚀 Deployment Instructions  
### 🔹 Manual Deployment  
To manually deploy the service, run:  
```bash
# Set up AWS credentials
aws configure set aws_access_key_id <ACCESS_KEY>
aws configure set aws_secret_access_key <SECRET_KEY>

# Build and push Docker image to AWS ECR
docker build -t swiggy-delivery-time-prediction .
docker tag swiggy-delivery-time-prediction:latest <AWS_ECR_REPO>:latest
docker push <AWS_ECR_REPO>:latest

# Deploy via AWS CodeDeploy
aws deploy create-deployment \
  --application-name swiggy-delivery-time-prediction \
  --deployment-group-name swiggy-delivery-time-group \
  --s3-location bucket=swiggy-delivery-time-deploy,key=deployment.zip,bundleType=zip
```

### 🔹 Running Locally  
1️⃣ Clone the repository  
```bash
git clone https://github.com/your-repo/swiggy-delivery-time-prediction.git
cd swiggy-delivery-time-prediction
```
2️⃣ Install dependencies  
```bash
pip install -r requirements.txt
```
3️⃣ Start Flask API  
```bash
python flask_app/app.py
```

### 🔹 Running Tests  
```bash
pytest tests/test_model_registry.py
pytest tests/test_model_perf.py
```

## 📌 Contribution Guidelines  
✔ **Fork the repository**  
✔ **Create a feature branch** (`git checkout -b feature-name`)  
✔ **Commit changes** (`git commit -m "Added feature"`)  
✔ **Push to branch** (`git push origin feature-name`)  
✔ **Open a Pull Request**  

