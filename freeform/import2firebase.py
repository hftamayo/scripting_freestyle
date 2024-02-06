import firebase_admin
from firebase_admin import credentials, db

cred = credentials.Certificate('./todofirebase.json')
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://todo-8ed5c.firebaseio.com'
})

try:
    with open('todo.json', 'r') as f:
        data = json.load(f)
except FileNotFoundError:
    print("Error: todo.json file not found")
    exit()
except json.JSONDecodeError:
    print("Error: Invalid JSON format in todo.json")
    exit()

ref = db.reference()

tasks_ref = ref.child('tasks')

try:
    tasks_ref.get()
except db.ApiCallError as e:
    if e.code == 404:
        tasks_ref.set({})
        print("Tasks collection created")

try:
    tasks_ref.set(data)
    print("data imported successfully")
except Exception as e:
    print("error during database import", e)
