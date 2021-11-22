from sql_queries import get_info
from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/<int:itemid>')
def item_info(itemid:int):
    item_info = get_info(itemid)
    return jsonify(item_info), 200


if __name__ == '__main__':
    app.run(debug=True)


