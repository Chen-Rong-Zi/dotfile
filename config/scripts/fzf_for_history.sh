#!/bin/bash

# 使用 fzf 搜索历史命令
# selected_command=$(history | fzf --tac --preview "echo {}" --preview-window=up:30%)

selected_command=$(history | fzf --preview "echo {}" --preview-window=down,5%,border-block)

selected_command=$(echo $selected_command | cut -d ' ' -f 4-)
# 如果用户选择了命令，执行它
if [ -n "$selected_command" ]; then
  echo -e "\e[34mExcuting:\e[0m $selected_command"
#   echo -e "This is green text"
  # eval execute the cmd in the current environment, while exec , like what bash -c do , just call bash to execute the cmd
  eval "$selected_command"
else
  echo "No command selected."
fi
