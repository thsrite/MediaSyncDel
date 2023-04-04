# emby_sync_del_nt

## 1.emby安装[ScripterX插件](https://github.com/AnthonyMusgrove/Emby-ScripterX)
推荐手动安装 [3.0.5.5插件防自动升级版本下载（dmdy123提供）](https://github.com/thsrite/emby_sync_del_nt/raw/main/EmbyScripterX3.0.5.5.zip)

<img width="847" alt="image" src="https://user-images.githubusercontent.com/54088512/229109971-7e321835-c3af-4a40-af65-029bbceb383b.png">

<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">

## 2.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增4个脚本
### get和post方式自行选择
[ScripterX-POST方式](https://github.com/thsrite/emby_sync_del_nt/blob/main/ScripterX-POST.md)：ScripterX版本参数不同

[ScripterX-GET方式(nt代码未上线，暂无法使用)](https://github.com/thsrite/emby_sync_del_nt/blob/main/ScripterX-GET.md)：配置简单

## 3.nastool开启 媒体库同步删除 插件

配置完成之后，emby上直接删除媒体后，nt会相应删除对应的历史记录、删除做种

nt插件上可设置是否要删除源文件，可设置排除路径（emby挂载网盘或者其他资源的话，nt没有历史记录，需要排除掉，这里填的是emby容器里的媒体路径）

## 4.注意事项及问题排查
#### （0）建议emby使用4.8.0.21及以下版本，ScripterX4.0.0.8在emby4.8.0.21以上版本疑似失效。[4.8.0.21以上版本可用ScripterX3.0.5.5版本，防止插件自动升级（dmdy123提供）](https://github.com/thsrite/emby_sync_del_nt/raw/main/EmbyScripterX3.0.5.5.zip)
#### （1）上述四个配置中要一一对应、颜色也要和图上一致！
#### （2）emby要能访问通nastool的接口，可以通过webhook测试
#### （3）nastool插件中要开启
#### （4）emby装完插件后要重启下emby
#### （5）可以看看emby日志有没有nastool接口的请求日志。
#### （6）注意容器内文件权限！chown -R uid:gid /config/nastool_plugin
#### （7）有位朋友不生效后重启了下nastool生效了……
#### （8）看硬链接所在目录是否多了几个空格。。。  例如 /data/Movie          /喜剧电影
#### （9）不生效的话，nastool基础设置日志调整为DEBUG，看容器日志
![b8bd19b9beeca6579b6d5238a4659a4](https://user-images.githubusercontent.com/54088512/228716464-964ca745-3a1f-47c4-ac9f-250306d11714.jpg)
