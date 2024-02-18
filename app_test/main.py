from fastapi import FastAPI, File, UploadFile
import torch
from torchvision import models, transforms
from PIL import Image
import io
import torch.nn.functional as F
import os

app = FastAPI()

# 기본 이미지 경로 설정
default_img_path = "default_img/default_img.jpg"


def load_model(model_path):
    model = models.efficientnet_v2_s(weights='DEFAULT')
    model.classifier[1] = torch.nn.Linear(1280, 6)
    model.load_state_dict(torch.load(
        model_path, map_location=torch.device('cpu')))
    model.eval()
    return model


model = load_model("jellyfish_efficientnet.pth")

transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406],
                         std=[0.229, 0.224, 0.225]),
])

label_list = [
    'Moon_jellyfish',
    'barrel_jellyfish',
    'blue_jellyfish',
    'compass_jellyfish',
    'lions_mane_jellyfish',
    'mauve_stinger_jellyfish',
]


@app.get("/")
def read_root():
    return {"message": "Jellyfish Classifier"}


@app.post("/classify")
async def classify_image(file: UploadFile = File(None)):
    if file:
        image_bytes = await file.read()
    else:
        with open(default_img_path, 'rb') as default_img:
            image_bytes = default_img.read()
    predicted_label = predict_with_labels(image_bytes)
    return {"class_label": predicted_label}


@app.post("/predict_probability")
async def predict_probability_endpoint(file: UploadFile = File(None)):
    if file:
        image_bytes = await file.read()
    else:
        with open(default_img_path, 'rb') as default_img:
            image_bytes = default_img.read()
    probabilities = predict_probability(image_bytes)
    probabilities_labels = {
        label_list[i]: prob for i, prob in enumerate(probabilities)
    }
    return {"probabilities": probabilities_labels}


def predict_with_labels(image_bytes):
    image = Image.open(io.BytesIO(image_bytes))
    image = transform(image).unsqueeze(0)
    with torch.no_grad():
        outputs = model(image)
        _, predicted = torch.max(outputs, 1)
        predicted_class_idx = predicted.item()
        predicted_label = label_list[predicted_class_idx]
        return predicted_label


def predict_probability(image_bytes):
    image = Image.open(io.BytesIO(image_bytes))
    image = transform(image).unsqueeze(0)
    with torch.no_grad():
        outputs = model(image)
        probabilities = F.softmax(outputs, dim=1)[0] * 100
        probabilities = probabilities.tolist()
    return probabilities
