# MediaSyncDel

## [路径映射](https://github.com/thsrite/MediaSyncDel/blob/main/path.md)

## [高级玩法](https://github.com/thsrite/MediaSyncDel/blob/main/advanced.md)

## [入库直接触发删除问题](https://github.com/thsrite/MediaSyncDel/blob/main/issues.md)

## 1.emby安装[ScripterX插件](https://github.com/AnthonyMusgrove/Emby-ScripterX)

<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">

### 插件手动下载，放入/plugins/重启emby
[3.0.5.5插件防自动升级版本下载（dmdy123提供）](https://github.com/thsrite/MediaSyncDel/raw/main/NAStool/ScripterX3/EmbyScripterX.dll)

[4.0.0.8插件下载](https://github.com/thsrite/MediaSyncDel/raw/main/NAStool/ScripterX4/EmbyScripterX.dll)


## 2.插件配置
### [NAStool](https://github.com/thsrite/MediaSyncDel/blob/main/NAStool/NAStool.md)
### [MoviePilot](https://github.com/thsrite/MediaSyncDel/blob/main/MoviePilot/MoviePilot.md)
### 可用版本（其他自行测试，欢迎补充）
| Emby                 | Scripter X | GET OR POST |
|----------------------|------------|-------------|
| emby4.8.0.21以上版本 | 4          | GET         |
| emby4.8.0.21以上版本 | 3          | GET or POST |
| emby4.8-4.8.0.21     | 3 or 4     | GET or POST |
| emby4.7              | 4          | GET  |

## 3.注意事项及问题排查
#### （0）请按照上述可用版本及请求方式是否对应，如有问题可提issues补充。
#### （1）上述配置中要一一对应、颜色也要和图上一致！
#### （2）emby要能访问通nastool的接口，可以通过webhook测试
#### （3）nastools插件中要开启
#### （4）emby装完插件后要重启下emby
#### （5）可以看看emby日志有没有nastools接口的请求日志。
#### （6）注意容器内文件权限！chown -R uid:gid /config/nastool_plugin
#### （7）有位朋友不生效后重启了下nastools生效了……
#### （8）看硬链接所在目录是否多了几个空格。。。  例如 /data/Movie          /喜剧电影
#### （9）注意是Movie Series Season Episode，注意大小写。。
#### （10）nastools日志提示“Emby同步删除-%series.name%同步删除失败，未获取到TMDB ID”，看上面可用版本换版本或者emby要刮削媒体！！emby要识别到媒体才能获取到tmdbid！！
#### （11）使用懒人配置不生效的，请重启emby。post懒人配置也需要手动下载参数文件放于指定位置
#### （12）为防止误删除，新增item_isvirtual参数，请按照配置添加
#### （13）不生效的话，nastools基础设置日志调整为DEBUG，看容器日志(docker logs -f -n 50 nt容器名称) 
![b8bd19b9beeca6579b6d5238a4659a4](https://user-images.githubusercontent.com/54088512/228716464-964ca745-3a1f-47c4-ac9f-250306d11714.jpg)
