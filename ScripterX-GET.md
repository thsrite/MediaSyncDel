# emby_sync_del_nt

###使用get方式，省略了post方式的参数文件，理论上没啥问题。不排除媒体文件有什么乱七八糟字符……胜在配置简单了。

## 1.emby安装[ScripterX插件](https://github.com/AnthonyMusgrove/Emby-ScripterX)
<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">
插件市场没有的，自己手动安装
<img width="847" alt="image" src="https://user-images.githubusercontent.com/54088512/229109971-7e321835-c3af-4a40-af65-029bbceb383b.png">

## 2.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增4个脚本
![image](https://user-images.githubusercontent.com/54088512/228715789-51a01a10-9dc6-40f2-b8cd-fd6ccb5f6b24.png)

1）删除电影配置

Run设置为你自己的nt地址http://192.168.31.184:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%item.name%&media_path=%item.path%&tmdb_id=%item.meta.tmdb%

using选择web:get

2）删除整个电视剧配置（包含多季，一起删除）

Run设置为你自己的nt地址http://192.168.31.103:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%item.name%&media_path=%item.path%&tmdb_id=%item.meta.tmdb%

using选择web:get

3）删除电视剧某季配置（删除一整季，一起删除）

Run设置为你自己的nt地址http://192.168.31.103:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%series.name%&media_path=%item.path%&tmdb_id=%series.meta.tmdb%&season_num=%season.number%

using选择web:get

4）删除电视剧某季某集配置（删除单集）

Run设置为你自己的nt地址http://192.168.31.103:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%series.name%&media_path=%item.path%&tmdb_id=%series.meta.tmdb%&season_num=%season.number%&episode_num=%episode.number%

using选择web:get

## 3.nastool开启 媒体库同步删除 插件

配置完成之后，emby上直接删除媒体后，nt会相应删除对应的历史记录、删除做种

nt插件上可设置是否要删除源文件，可设置排除路径（emby挂载网盘或者其他资源的话，nt没有历史记录，需要排除掉，这里填的是emby容器里的媒体路径）

## 4.注意事项及问题排查
#### （0）建议emby4.8.0.21及以下版本，ScripterX4.0.0.8在emby4.8.0.21以上版本疑似失效
#### （1）上述四个配置中要一一对应、颜色也要和图上一致！
#### （2）emby要能访问通nastool的接口，可以通过webhook测试
#### （3）nastool插件中要开启
#### （4）emby装完插件后要重启下emby
#### （5）可以看看emby日志有没有nastool接口的请求日志。
#### （6）注意容器内文件权限！chown -R uid:gid /config/nastool_plugin
#### （7）有位朋友不生效后重启了下nastool生效了……
#### （8）不生效的话，nastool基础设置日志调整为DEBUG，看容器日志
![b8bd19b9beeca6579b6d5238a4659a4](https://user-images.githubusercontent.com/54088512/228716464-964ca745-3a1f-47c4-ac9f-250306d11714.jpg)
