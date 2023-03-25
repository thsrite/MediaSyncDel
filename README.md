# emby_sync_del_nt

### 1.emby安装ScripterX插件https://github.com/AnthonyMusgrove/Emby-ScripterX
<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">

### 2.emby容器挂载 /config:/mnt/user/appdata/emby
### 3.下载nastool_plugin放到宿主机/mnt/user/appdata/emby下
### 4.修改nastool_plugin/nt.sh脚本里面NASTOOL_WEBHOOK_URL为自己的nastool链接
### 5.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增4个脚本
1）删除电影配置

Run设置为你容器里面脚本所在路径/config/nastool_plugin/nt.sh Movie

using选择/bin/sh

"%series.name%" "%item.path%" "%series.meta.tmdb%" "%season.number%" "%episode.number%"

<img width="1225" alt="image" src="https://user-images.githubusercontent.com/54088512/227704712-19bde916-d242-4ab0-856d-7092d646c9ae.png">

2）删除整个电视剧配置（包含多季，一起删除）

Run设置为你容器里面脚本所在路径/config/nastool_plugin/nt.sh Series

using选择/bin/sh

"%item.name%"  "%item.path%"  "%item.meta.tmdb%"

3）删除电视剧某季配置（删除一整季，一起删除）

Run设置为你容器里面脚本所在路径/config/nastool_plugin/nt.sh Season

using选择/bin/sh

"%series.name%" "%item.path%" "%series.meta.tmdb%"  "%season.number%"

4）删除电视剧某季某集配置（删除单集）

Run设置为你容器里面脚本所在路径/config/nastool_plugin/nt.sh Episode

using选择/bin/sh

"%series.name%" "%item.path%" "%series.meta.tmdb%" "%season.number%" "%episode.number%"

<img width="1201" alt="image" src="https://user-images.githubusercontent.com/54088512/227704886-d7845371-8016-4da5-9e64-d1c4807f0c24.png">

### 6.nastool开启 媒体库同步删除 插件

配置完成之后，emby上直接删除媒体后，nt会相应删除对应的历史记录

nt插件上可设置是否要删除源文件，可设置排除路径（emby挂载网盘或者其他资源的话，nt没有历史记录，需要排除掉，这里填的是emby容器里的媒体路径）
