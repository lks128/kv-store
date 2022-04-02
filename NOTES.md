example how to put value

```shell
% curl -X POST https://kv-store.defmacro.eu/test -d 'abcd' -H 'Content-Type: application/text'
{"status": "ok"}
```

example how to get value

```shell
% curl  https://kv-store.defmacro.eu/test                                         
{"status": "ok", "data": {"key": "test", "value": "abcd"}}%
```