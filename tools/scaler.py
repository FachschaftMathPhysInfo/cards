import os
import zipfile
from io import BytesIO
from PIL import Image

import anki.importing.apkg as apkg

def scale_image(image_data, scale_factor):
    img = Image.open(BytesIO(image_data))
    new_width = int(img.width * scale_factor)
    new_height = int(img.height * scale_factor)
    img = img.resize((new_width, new_height), Image.ANTIALIAS)
    buffered = BytesIO()
    img.save(buffered, format="JPEG")
    return buffered.getvalue()


def scale_images_in_package(package_path, max_file_size_kb):
    # Extract package contents
    with zipfile.ZipFile(package_path, 'r') as zip_ref:
        zip_ref.extractall('temp_package')

    # Load collection
    col_path = os.path.join('temp_package', 'collection.anki2')
    collection = apkg.Collection(col_path)

    # Scale images
    for media_id, media_data in collection.media.items():
        if media_data['name'].endswith('.jpg') or media_data['name'].endswith('.jpeg'):
            # Initialize scale factor
            scale_factor = 1.0
            # Iterate to find the right scale factor
            while True:
                scaled_data = scale_image(media_data['data'], scale_factor)
                # Check file size
                if len(scaled_data) <= max_file_size_kb * 1024:
                    break
                # Reduce scale factor
                scale_factor -= 0.05
            collection.media[media_id]['data'] = scaled_data

    # Rebuild package
    collection.write('temp_package')
    collection.close()

    # Repackage
    with zipfile.ZipFile(package_path, 'w') as zip_ref:
        for root, _, files in os.walk('temp_package'):
            for file in files:
                zip_ref.write(os.path.join(root, file), os.path.relpath(os.path.join(root, file), 'temp_package'))

    # Clean up temporary files
    os.system('rm -rf temp_package')

def main():
    if len(sys.argv) != 2:
        print("Usage: python scaler.py <package_file>")
        sys.exit(1)

    file_path = sys.argv[1]

    if not os.path.exists(file_path):
        print(f"File '{file_path}' does not exist.")
        sys.exit(1)

    file_ext = os.path.splitext(file_path)[1]
    if file_ext == ".apkg":
        scale_images_in_package(file_path, 200)
    else:
        print("Unsupported file format. Please provide a .apkg file.")
        sys.exit(1)