import os
from PIL import Image

def resize_images(folder, target_size=(512, 512)):
    # Lặp qua tất cả các tệp trong thư mục
    for filename in os.listdir(folder):
        # Kiểm tra nếu tệp là một ảnh
        if filename.lower().endswith((".png", ".jpg", ".jpeg", ".gif")):
            # Đường dẫn đầy đủ của ảnh
            file_path = os.path.join(folder, filename)

            # Mở ảnh
            image = Image.open(file_path)

            # Thay đổi kích thước ảnh
            resized_image = image.resize(target_size)

            # Lưu ảnh đã thay đổi kích thước, ghi đè lên ảnh gốc
            resized_image.save(file_path)

            print(f"Resized {filename} to {target_size}")

# Đường dẫn tới thư mục chứa ảnh
folder = "onepiece_dataset"

# Kích thước mục tiêu cho ảnh (width, height)
target_size = (512, 512)

# Gọi hàm để thay đổi kích thước ảnh
resize_images(folder, target_size)