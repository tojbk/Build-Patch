#/bin/bash
# 仓库 https://github.com/281677160/openwrt-package 修改

function TIME() {
Compte=$(date +%Y年%m月%d号%H时%M分)
  [[ -z "$1" ]] && {
    echo -ne " "
    } || {
    case $1 in
    r) export Color="\e[31m";;
    g) export Color="\e[32m";;
    b) export Color="\e[34m";;
    y) export Color="\e[33m";;
    z) export Color="\e[35m";;
    l) export Color="\e[36m";;
    esac
      [[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
        echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
      }
    }
}

TIME b "首页微调"
curl -fsSL https://raw.githubusercontent.com/tojbk/Build-Patch/main/index.htm > ${HOME_PATH}/package/lean/autocore/files/x86/index.htm
TIME b "修改主题VPN菜单为GFW"
sed -i 's/VPN/GFW/g' ${HOME_PATH}/feeds/danshui/luci-theme-atmaterial_new/htdocs/luci-static/atmaterial_Brown/css/style.css
sed -i '3,4d' ${HOME_PATH}/feeds/danshui/luci-theme-atmaterial_new/root/etc/uci-defaults/30_luci-theme-atmaterial_new
sed -i 's/VPN/GFW/g' ${HOME_PATH}/feeds/danshui/luci-theme-design/htdocs/luci-static/design/css/style.css
TIME b "插件重命名"
sed -i 's/解除网易云音乐播放限制/音乐解锁/g' ${HOME_PATH}/feeds/danshui/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua
sed -i 's/msgstr "UPnP"/msgstr "UPnP设置"/g' ${HOME_PATH}/feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po
sed -i 's/ShadowSocksR Plus+/SSR Plus+/g' ${HOME_PATH}/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/PassWall/Pass Wall/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/po/zh-cn/passwall.po
sed -i 's/msgstr "FTP 服务器"/msgstr "FTP 服务"/g' ${HOME_PATH}/feeds/luci/applications/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/文件管理器/文件管理/g' ${HOME_PATH}/feeds/danshui/luci-app-filebrowser/luasrc/controller/filebrowser.lua
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ${HOME_PATH}/feeds/danshui/luci-app-socat/po/zh-cn/socat.po
sed -i 's/EQoS/网速限制/g' ${HOME_PATH}/feeds/danshui/eqos-master-wiwiz/files/eqos-controller.lua

TIME b "调整 luci-app-eqos 到 管控 菜单"
sed -i 's/network/control/g' ${HOME_PATH}/feeds/danshui/eqos-master-wiwiz/files/eqos-controller.lua
TIME b "调整 luci-app-ssr-plus 到 GFW 菜单"
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
sed -i '12a entry({"admin", "vpn"}, firstchild(), "GFW", 45).dependent = false' ${HOME_PATH}/feeds/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
TIME b "调整 luci-app-passwall 到 GFW 菜单"
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/controller/passwall.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/auto_switch/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/passwall1/luci-app-passwall/luasrc/view/passwall/server/*.htm
TIME b "调整 luci-app-vssr 到 GFW 菜单"
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/danshui/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/danshui/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/danshui/luci-app-vssr/luasrc/view/vssr/*.htm
TIME b "调整 luci-app-openclash 到 GFW 菜单"
sed -i 's/services/vpn/g' ${HOME_PATH}/package/luci-app-openclash/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/package/luci-app-openclash/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/package/luci-app-openclash/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/package/luci-app-openclash/luci-app-openclash/luasrc/view/openclash/*.htm
TIME b "调整 luci-app-v2ray-server 到 GFW 菜单"
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/services/vpn/g' ${HOME_PATH}/feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
TIME b "调整 luci-app-zerotier 到 GFW 菜单"
sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' ${HOME_PATH}/feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
TIME b "调整 luci-app-ipsec-server 到 GFW 菜单"
sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' feeds/luci/applications/luci-app-ipsec-server/luasrc/controller/ipsec-server.lua
TIME b "调整 luci-app-aliyundrive-webdav 到 nas 菜单"
sed -i 's/services/nas/g' ${HOME_PATH}/feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/controller/*.lua
sed -i 's/services/nas/g' ${HOME_PATH}/feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/model/cbi/aliyundrive-webdav/*.lua
sed -i 's/services/nas/g' ${HOME_PATH}/feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/*.htm
TIME b "调整 luci-app-aria2 到 NAS 菜单"
sed -i 's/services/nas/g' ${HOME_PATH}/feeds/luci/applications/luci-app-aria2/luasrc/controller/aria2.lua
TIME b "调整 luci-app-hd-idle 到 NAS 菜单"
sed -i 's/services/nas/g' ${HOME_PATH}/feeds/luci/applications/luci-app-hd-idle/luasrc/controller/hd_idle.lua
TIME b "调整 luci-app-mwan3helper 到 网络菜单"
sed -i 's/\"services\"/\"network\"/g' ${HOME_PATH}/feeds/luci/applications/luci-app-mwan3helper/luasrc/controller/mwan3helper.lua
curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/mwan3helper_status.htm > ${HOME_PATH}/feeds/luci/applications/luci-app-mwan3helper/luasrc/view/mwan3helper/mwan3helper_status.htm
