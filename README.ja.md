[en](./README.md) <time datetime="2020-01-18T12:53:05+0900">2020-01-18</time>

# Get bash path

　Bashファイルパスを取得する。

# 特徴

* API

# 開発環境

* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release

```sh
$ uname -a
Linux raspberrypi 4.19.75-v7l+ #1270 SMP Tue Sep 24 18:51:41 BST 2019 armv7l GNU/Linux
```

# インストール

```sh
mkdir -p /tmp/work
cd /tmp/work
git clone https://github.com/ytyaru/Shell.Path.20200118125311
```

# 使い方

```sh
cd /src
./test_path.sh
./call_path.sh
```

call_path.sh
```sh
. "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/path.sh"
echo "SelfPath    : $(SelfPath)"
echo "SelfName    : $(SelfName)"
echo "SelfExt     : $(SelfExt)"
echo "SelfNameId  : $(SelfNameId)"

echo "CallerPath  : $(CallerPath)"
echo "CallerName  : $(CallerName)"
echo "CallerExt   : $(CallerExt)"
echo "CallerNameId: $(CallerNameId)"
```
```sh
SelfPath    : /tmp/work/Shell.Path.20200118125311/src/path.sh
SelfName    : path.sh
SelfExt     : sh
SelfNameId  : path
CallerPath  : /tmp/work/Shell.Path.20200118125311/src/call_path.sh
CallerName  : call_path.sh
CallerExt   : sh
CallerNameId: call_path
```

# 著者

　ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# ライセンス

　このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)

