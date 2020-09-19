1. Place the `asrOutput.json` in the `tmp` directory

2. Translate `asrOutput.json` to `output.txt`

```sh
$ ruby trans.rb > tmp/output.txt
```

3. Translate `output.txt` to `output_for_esa.txt`

```sh
$ ruby trans_for_esa.rb > tmp/output_for_esa.txt
```
