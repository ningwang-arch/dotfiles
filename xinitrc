#!/bin/sh

# 设置fcitx
export LANG="zh_CN.UTF-8"
export LANGUAGE=zh_CN:en_US
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# 启动i3
exec i3
