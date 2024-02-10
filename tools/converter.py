import os
import sys
from anki.storage import Collection
from anki.importing.apkg import APKG
from anki.importing.colpkg import CollectionPackage

def read_apkg(file_path):
    try:
        package = APKG(file_path)
        package.open()
        package.setProgressBar(lambda x: None)  # Disable progress bar
        package.setup_progress_hook(lambda x: None)  # Disable progress hook
        collection = package.collection()
        return collection
    except Exception as e:
        print(f"Error reading .apkg file: {e}")
        return None


def read_colpkg(file_path):
    try:
        package = CollectionPackage(file_path)
        package.open()
        package.setProgressBar(lambda x: None)  # Disable progress bar
        package.setup_progress_hook(lambda x: None)  # Disable progress hook
        collection = package.collection()
        return collection
    except Exception as e:
        print(f"Error reading .colpkg file: {e}")
        return None


def main():
    if len(sys.argv) != 2:
        print("Usage: python read_anki_package.py <package_file>")
        sys.exit(1)

    file_path = sys.argv[1]

    if not os.path.exists(file_path):
        print(f"File '{file_path}' does not exist.")
        sys.exit(1)

    file_ext = os.path.splitext(file_path)[1]
    if file_ext == ".apkg":
        collection = read_apkg(file_path)
    elif file_ext == ".colpkg":
        collection = read_colpkg(file_path)
    else:
        print("Unsupported file format. Please provide a .apkg or .colpkg file.")
        sys.exit(1)

    if collection:
        # Do something with the collection, like printing some basic stats
        print(f"Number of notes: {len(collection.notes)}")
        print(f"Number of cards: {len(collection.cards)}")
        print(f"Number of decks: {len(collection.decks)}")
        # You can access more data from the collection object as needed


if __name__ == "__main__":
    main()
