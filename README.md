# emby_sync_del_nt

### 请根据自己Scripter-X版本选择不同的nastool_plugin！
### 请根据自己Scripter-X版本选择不同的nastool_plugin！
### 请根据自己Scripter-X版本选择不同的nastool_plugin！

#### 配置不一样的原因是，3.*版本的Scripter-X传参不自带引号，而4.*版本的自带引号。不在nastool做兼容了，选择不同配置即可。


## 1.emby安装[ScripterX插件](https://github.com/AnthonyMusgrove/Emby-ScripterX)
<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">
插件市场没有的，自己手动安装
<img width="847" alt="image" src="https://user-images.githubusercontent.com/54088512/229109971-7e321835-c3af-4a40-af65-029bbceb383b.png">

## 2.emby容器挂载 /config:/mnt/user/appdata/emby
## 3.下载nastool_plugin放到宿主机/mnt/user/appdata/emby下

<img width="769" alt="image" src="https://user-images.githubusercontent.com/54088512/227707707-78edc0e6-6b11-4c52-8d12-de341b9fb63c.png">
群晖套件文件的路径是：/volume1/@appstore/ 用ssh登陆后cd到这个路径 下面就是你所有套件的文件夹。volume表示存储池，如果你装套件的时候选的是第二存储池，这里就是volume2，以此类推

威联通nas的共享文件在/share文件夹下。

自行研究
## 4.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增4个脚本
![image](https://user-images.githubusercontent.com/54088512/228715789-51a01a10-9dc6-40f2-b8cd-fd6ccb5f6b24.png)

1）删除电影配置

Run设置为你自己的nt地址http://192.168.31.184:3000/emby

using选择web:post

/config/nastool_plugin/movie_remove.json

2）删除整个电视剧配置（包含多季，一起删除）

Run设置为你自己的nt地址http://192.168.31.184:3000/emby

using选择web:post

/config/nastool_plugin/series_remove.json

3）删除电视剧某季配置（删除一整季，一起删除）

Run设置为你自己的nt地址http://192.168.31.184:3000/emby

using选择web:post

/config/nastool_plugin/season_remove.json

4）删除电视剧某季某集配置（删除单集）

Run设置为你自己的nt地址http://192.168.31.184:3000/emby

using选择web:post

/config/nastool_plugin/episode_remove.json

<img width="1223" alt="image" src="https://user-images.githubusercontent.com/54088512/227707540-4444d27b-d052-47b1-9ab5-fd70699fe362.png">

## 5.nastool开启 媒体库同步删除 插件

配置完成之后，emby上直接删除媒体后，nt会相应删除对应的历史记录、删除做种

nt插件上可设置是否要删除源文件，可设置排除路径（emby挂载网盘或者其他资源的话，nt没有历史记录，需要排除掉，这里填的是emby容器里的媒体路径）

## 6.注意事项及问题排查
#### （0）emby4.8.0.21及以下版本，ScripterX4.0.0.8在emby4.8.0.21以上版本疑似失效
#### （1）上述四个配置中要一一对应、颜色也要和图上一致！
#### （2）emby要能访问通nastool的接口，可以通过webhook测试
#### （3）nastool插件中要开启
#### （4）emby装完插件后要重启下emby
#### （5）可以看看emby日志有没有nastool接口的请求日志。
#### （6）注意容器内文件权限！chown -R uid:gid /config/nastool_plugin
#### （7）有位朋友不生效后重启了下nastool生效了……
#### （8）不生效的话，nastool基础设置日志调整为DEBUG，看容器日志
![b8bd19b9beeca6579b6d5238a4659a4](https://user-images.githubusercontent.com/54088512/228716464-964ca745-3a1f-47c4-ac9f-250306d11714.jpg)
