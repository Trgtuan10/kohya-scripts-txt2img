from datasets import load_dataset
import os

dataset = load_dataset("YaYaB/onepiece-blip-captions")
train_dataset = dataset["train"]

images = train_dataset["image"]
captions = train_dataset["text"]

output_folder = "onepiece_dataset"
os.makedirs(output_folder, exist_ok=True)


for i, (image, caption) in enumerate(zip(images, captions)):
    image_path = os.path.join(output_folder, f"image_{i}.jpg")
    image.save(image_path)

    caption_path = os.path.join(output_folder, f"image_{i}.caption")
    with open(caption_path, "w") as file:
        file.write(caption)

print("Đã lưu ảnh và caption vào thư mục", output_folder)