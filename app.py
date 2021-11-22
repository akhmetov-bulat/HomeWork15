import sqlite3
from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/<itemid:int>')
def item_info(int:itemid):



if __name__ == '__main__':
    app.run(Debug=True)


