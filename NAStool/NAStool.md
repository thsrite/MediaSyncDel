# NAStool配置

## 2.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增脚本
### ScripterX-GET方式
[手动配置](https://github.com/thsrite/MediaSyncDel/blob/main/NAStool/ScripterX_config_GET/ScripterX-GET.md)：配置非常简单，不需要添加任何文件。

懒人配置，下载[GET配置文件](https://github.com/thsrite/MediaSyncDel/raw/main/NAStool/ScripterX_config_GET/EmbyScripterX.xml)直接覆盖/plugins/configurations/EmbyScripterX.xml，需手动修改ip端口为自己nastools相应参数（需要重启emby生效！）

### ScripterX-POST方式
[手动配置](https://github.com/thsrite/MediaSyncDel/blob/main/NAStool/ScripterX_config_POST/ScripterX-POST.md)：ScripterX版本参数不同

懒人配置，下载[POST配置文件](https://github.com/thsrite/MediaSyncDel/raw/main/NAStool/ScripterX_config_POST/EmbyScripterX.xml)直接覆盖/plugins/configurations/EmbyScripterX.xml，需手动修改配置文件参数、ip端口为自己nastools相应参数（需要重启emby生效！需要下载手动配置中的参数文件！）

## 3.nastool开启 媒体库同步删除 插件

配置完成之后，emby上直接删除媒体后，nt会相应删除对应的历史记录，同时开启下载任务清理插件可删除做种

nt插件上可设置是否要删除源文件，可设置排除路径（emby挂载网盘或者其他资源的话，nt没有历史记录，需要排除掉，这里填的是emby容器里的媒体路径）

