from flask import Blueprint, request, abort

import json
import psycopg

bp = Blueprint('kv_store', __name__)

@bp.route('/_status')
def index():
    return "ok"

@bp.route('/<key>', methods=['POST'])
def post(key):
    try:
        with psycopg.connect("") as conn:
            with conn.cursor() as cur:
                cur.execute("insert into kv_store.values (key, value) values (%s, %s) on conflict (key) do update set value = excluded.value", (key, request.data.decode('utf-8')))
                # rec = cur.fetchone()

            return json.dumps({
                "status": "ok"
            }), 201
    except Exception as e:
        return json.dumps({
            "status": "error",
            "error": {
                # TODO: for production use sanitize error messages to exclude database names etc
                "message": str(e)
            }
        }), 503


@bp.route('/<key>', methods=['GET'])
def get(key):
    try:
        with psycopg.connect("") as conn:
            with conn.cursor() as cur:
                cur.execute("select * from kv_store.values where key = %s", (key,))
                rec = cur.fetchone()

        if rec is not None:
            return json.dumps({
                "status": "ok",
                "data": {
                "key": key,
                "value": rec[1]
                }
            })
        else:
            abort(404)
    except Exception as e:
        return json.dumps({
            "status": "error",
            "error": {
                # TODO: for production use sanitize error messages to exclude database names etc
                "message": str(e)
            }
        }), 503
