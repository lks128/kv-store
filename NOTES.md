example how to put value

```shell
% curl -X POST http://127.0.0.1:5000/test -d 'abcd' -H 'Content-Type: application/text'
{"status": "ok"}
```

example how to get value

```shell
% curl  http://127.0.0.1:5000/test                                         
{"status": "ok", "data": {"key": "test", "value": "abcd"}}%
```