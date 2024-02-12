import json
import firebase_admin
from firebase_admin import credentials, db

cred = credentials.Certificate("./todoappkey.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://todoapp-8ed5c.firebaseio.com'
})

try:
    with open('./todo.json', 'r') as data_file:
        data = json.load(data_file)
except FileNotFoundError:
    print("Error: todo.json file not found")
    exit()
except json.JSONDecodeError:
    print("Error: Invalid JSON format in todo.json")
    exit()

try:
    ref = db.reference('tasks') 
    ref.set(data)
    print("Data successfully imported into the 'tasks' collection!")
except Exception as e:
    print("Error during database import", e)
    exit()
