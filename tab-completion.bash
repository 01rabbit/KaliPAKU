#!/bin/bash

# 以下のリストから補完．適当に野菜の名前
candidates=(
  "cabbage"
  "carrot"
  "cucumber"
  "lettuce"
  "potate"
  "radish"
)

prompt=">>> "

function tab-complete () {
  local words=($READLINE_LINE)

  # 入力がなければ候補を表示して終わり
  if [ ! $words ]; then
    echo "$prompt$READLINE_LINE"
    echo ${candidates[@]}
    return
  fi

  # カーソル位置の単語を取得 
  local slice=(${READLINE_LINE:0:$(($READLINE_POINT + 1))})
  local n=$((${#slice[@]} - 1))

  # compgenで絞り込み
  local comp_words=($(compgen -W "$(echo ${candidates[@]})" -- ${words[$n]}))

  # 一つに決まったら挿入
  if [ ${#comp_words[@]} -eq 1 ]; then
    words[$n]=${comp_words[0]}

  # 一つに決まらなかったら候補の共通部分を取得
  elif [ ${#comp_words[@]} -gt 1 ]; then
    local prefix=$(printf "%s\n" "${comp_words[@]}" |\
      sed -e '$!{N;s/^\(.*\).*\n\1.*$/\1\n\1/;D;}')

    # カーソル位置の単語が共通部分と等しければ候補を表示
    if [ $prefix = ${words[$n]} ]; then
      echo "$prompt$READLINE_LINE"
      echo ${comp_words[@]}

    # 等しくなければ共通部分を挿入
    else
      words[$n]=$prefix
    fi
  fi

  # ラインバッファを更新
  READLINE_LINE="${words[@]}"
  slice="${words[@]:0:$(($n + 1))}"
  READLINE_POINT=${#slice}
}

set -o emacs
bind -x '"\t":"tab-complete"'

read -ep "$prompt" line