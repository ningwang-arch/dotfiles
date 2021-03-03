# flameshot自启动
flameshot &

# 设置fcitx
export LANG="zh_CN.UTF-8"
export LANGUAGE=zh_CN:en_US
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
# fcitx &

# 自启动qv2ray
# qv2ray &

# 自启动listen1
# /home/eclipse/.local/share/listen1_2.17.1_linux_x86_64.AppImage &

# 设置背景图片
feh --bg-fill /home/eclipse/Pictures/WallPaper/background.png

# 使顶栏透明
xcompmgr &

# 控制终端透明
# picom -b &

# 启动i3
exec i3
