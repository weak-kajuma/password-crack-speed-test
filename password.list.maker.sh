#!/usr/bin/env bash
makepassword () {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n $2 | sort | uniq >> password.list
}

if [ $1 == talk ] && [ $# == 1 ]; then
  echo "対話モードを起動しました。"
  read -p "文字数は何文字にしますか?: " wdlong
  read -p "いくつ生成しますか?: " wdquantity
  echo "文字数:$wdlong文字"
  echo "生成数:$wdquantity個"
  read -p "上記の設定でよろしいでしょうか？(y)or(n)" check
  if [ $check == "yes" ] || [ $check == "y" ]; then
    makepassword $wdlong $wdquantity
  else
    echo "生成をキャンセルしました"
    exit
  fi
  echo "生成が完了しました。これで終了します。"
elif [ $# == 2 ]; then
  makepassword $1 $2
else
  echo "引数の設定が間違えている可能性があります"
fi
