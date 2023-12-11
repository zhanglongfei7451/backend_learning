# -*- coding: utf-8 -*-
import os
import json

dirs = [
    "H:\Git_python学习\coredns-grafana"
]


def main():
    for d in dirs:
        for f in os.listdir(d):
            filename = "{}/{}".format(d, f)
            if not f.endswith(".json") or f.startswith("."):
                continue
            try:
                with open(filename, "r+", encoding='UTF-8') as fp:
                    json_data = fp.read()
                    data = json.loads(json_data)
                    fp.seek(0)
                    fp.write(json.dumps(data["dashboard"], sort_keys=True))  # 字母序
                    print("{}: success".format(filename))
            except Exception as e:
                print("{}: {}".format(filename, e))


if __name__ == "__main__":
    main()