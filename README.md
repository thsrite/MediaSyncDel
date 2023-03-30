# emby_sync_del_nt

### 请根据自己emby和Scripter-X版本选择不同的nastool_plugin！
### 请根据自己emby和Scripter-X版本选择不同的nastool_plugin！
### 请根据自己emby和Scripter-X版本选择不同的nastool_plugin！

#### 配置不一样的原因是，3.*版本的Scripter-X传参不自带引号，而4.*版本的自带引号。不在nastool做兼容了，选择不同配置即可。

emby4.7以下版本可以用emby4.7版本试下

## 1.emby安装[ScripterX插件](https://github.com/AnthonyMusgrove/Emby-ScripterX)
<img width="271" alt="image" src="https://user-images.githubusercontent.com/54088512/227704280-0238b261-c0f4-4676-8acb-71c586ad4695.png">

## 2.emby容器挂载 /config:/mnt/user/appdata/emby
## 3.下载nastool_plugin放到宿主机/mnt/user/appdata/emby下

<img width="769" alt="image" src="https://user-images.githubusercontent.com/54088512/227707707-78edc0e6-6b11-4c52-8d12-de341b9fb63c.png">

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
#### （1）上述四个配置中要一一对应、颜色也要和图上一致！
#### （2）emby要能访问通nastool的接口，可以通过webhook测试
#### （3）nastool插件中要开启
#### （4）emby装完插件后最好重启下emby
#### （5）可以看看emby日志有没有nastool接口的请求日志。
#### （6）注意容器内文件权限！chown -R uid:gid /config/nastool_plugin
#### （7）有位朋友不生效后重启了下nastool生效了……
#### （8）不生效的话，nastool基础设置日志调整为DEBUG，看容器日志
![b8bd19b9beeca6579b6d5238a4659a4](https://user-images.githubusercontent.com/54088512/228716464-964ca745-3a1f-47c4-ac9f-250306d11714.jpg)
