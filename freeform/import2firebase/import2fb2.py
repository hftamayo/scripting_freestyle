import sys
import json
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import timeit

cred = credentials.Certificate("todoappkey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

class UploadJSONFileToFirestore:
    def __init__(self) -> None:
        self.start = timeit.default_timer()
        if(len.sys.argv) != 3:
            print("Error: check your command line arguments: expected filepath, method, collection")
            return None
        
        self.json_data = sys.argv[1:][0]
        self.method = sys.argv[1:][1]
        self.collectionname = sys.argv[1:][2]

    def __str__(self) -> str:
        return (f'Uploading ==={self.file} ***** JSON items to firestore!')
    
    @property
    def method(self):
        return self.method
    
    @method.setter
    def method(self, val):
        if val == 'set' or val == 'add':
            self._method = val
        else:
            print(f"Error: method {val} must be set or add")

    @property
    def json_data(self):
        return self.json_data
    
    @json_data.setter
    def json_data(self, val):
        if val:
            try:
                f = open(val, 'r')

                data = json.load(f)
                f.close()
                self._json_data = data
            except Exception as e:
                print(f'File Exception: {str(e)}')
        else:
            print(f"Wrong file path {val}")

    def upload(self):
        if self.json_data and self.method:
            for idx, item in enumerate(self.json_data):
                '''
                START FOR JUST FOR DEMO REASONS
                '''
                from pygments import highlight
                from pygments.lexers import JsonLexer
                from pygments.formatters import TerminalFormatter

                json_str = json.dumps(item, indent=4, sort_keys=True)
                print(highlight(json_str, JsonLexer(), TerminalFormatter()))
                '''
                END FOR JUST FOR DEMO REASONS
                '''

                if self.method == 'set':
                    self.set(item)
                else:
                    self.add(item)
                #end of the file passed as parameter
                #print sucess message
                if idx == len(self.json_data)-1:
                    stop = timeit.default_timer()
                    print('*********************\n**************DATA UPLOAD COMPLETED**************\n*********************')
                    print(f'Elapsed Time: {stop - self.start}')

    #stage2: add data to firestore collection with auto id
    def add(self, data):
        try:
            db.collection(self.collectionname).add(data)
        except Exception as e:
            print(f'Error: {str(e)}')

    def set(self, data):
        try:
            db.collection(self.collectionname).document(data['id']).set(data)
        except Exception as e:
            print(f'Error: {str(e)}')

uploadjson = UploadJSONFileToFirestore()
uploadjson.upload()
