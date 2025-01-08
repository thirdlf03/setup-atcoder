#!/bin/bash
echo "AtCoder環境構築プログラムが起動されました"
echo "どの言語で構築しますか？　数字で選択してください"

array=("cpp" "java" "python" "rust")

echo "0. C++ (recommend)"
echo "1. Java"
echo "2. Python"
echo "3. Rust"

read -p "数字を入力してください: " selectNum

if [[ -z "$selectNum" ]]; then
  echo "数字を入力してください。"
  exit 1
fi

if ! [[ "$selectNum" =~ ^[0-9]+$ ]]; then
  echo "無効な入力です。数値を入力してください。"
  exit 1
fi

if [[ $selectNum -ge 0 && $selectNum -lt ${#array[@]} ]]; then
  echo "${array[$selectNum]}での構築を開始します。"
  cd ${array[$selectNum]} && docker build -t ${array[$selectNum]} . && docker run -v ./workspace:/opt/workspace --tty --name atcoder_${array[$selectNum]}_container -d ${array[$selectNum]}
  echo "セットアップ完了"
else
  echo "無効な選択肢です。再度実行してください。"
  exit 1
fi
