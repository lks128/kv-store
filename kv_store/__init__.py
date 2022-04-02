from flask import Flask


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    
    from . import kv_store
    app.register_blueprint(kv_store.bp)
    app.add_url_rule('/', endpoint='index')

    return app