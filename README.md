# AtCoder環境構築
DockerでAtCoderの環境を構築できます。  
環境についての詳しい説明は、後の方でしています。

## 対応言語
C++

## 対応予定
Java   
Python  
Rust  


# コンテナ作成
## Mac or Linuxの場合
まず、dockerの起動とこのレポジトリをcloneしてください。  
```bash
git clone https://github.com/thirdlf03/setup-atcoder
cd setup-atcoder
```

その後、ターミナルで
```bash
chmod +x ./setup.sh && ./setup.sh
```
を実行し、自分が構築したい言語を選んでください。(現在C++のみ)

セットアップ完了と出るとコンテナが完成しています


## Windowsの場合
まず、dockerの起動とこのレポジトリをcloneしてください。  
```bash
git clone https://github.com/thirdlf03/setup-atcoder
cd setup-atcoder
```
自分の構築したい言語のディレクトリに移動します。  
今回の場合、c++にしようと思います。  
```bash
cd cpp
```
その後、以下のコマンドを実行してください。
```bash
docker build -t cpp . && docker run -v ./workspace:/opt/workspace --tty --name atcoder_cpp_container -d cpp
```


# コンテナ操作
コンテナに入りたい場合、ターミナルで
```bash
docker exec -it atcoder_cpp_container /bin/bash
```
と入力してください。　atcoder_言語名_container

入った後、
```bash
cd /opt/workspace
```
に移動してください

このworkspaceディレクトリが、cloneしてきたディレクトリの配下にあるcpp/workspaceのようなworkspaceと紐づいています。


もし、コンテナがストップしてしまった場合は
```bash
docker container start atcoder_cpp_container
```
で起動できます！

# 各言語ごとの環境
基本、atcoder cliとonline-judge-toolsは導入していますが、rustのように別のツールがある場合はそちらを採用します。

atcode cliやonline-judge-toolsの説明は省きます。

## C++
gccとg++ 12.3  
atcoder cli  
online-judge-tools 