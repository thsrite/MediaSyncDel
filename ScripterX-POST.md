# ScripterX-POST方式

### 请根据自己Scripter-X版本选择不同的nastool_plugin！
### 请根据自己Scripter-X版本选择不同的nastool_plugin！
### 请根据自己Scripter-X版本选择不同的nastool_plugin！

#### 配置不一样的原因是，3.*版本的Scripter-X传参不自带引号，而4.*版本的自带引号。不在nastool做兼容了，选择不同配置即可。

## 1.emby容器挂载 /config:/mnt/user/appdata/emby
## 2.下载nastool_plugin放到宿主机/mnt/user/appdata/emby下

<img width="769" alt="image" src="https://user-images.githubusercontent.com/54088512/227707707-78edc0e6-6b11-4c52-8d12-de341b9fb63c.png">
群晖套件文件的路径是：/volume1/@appstore/ 用ssh登陆后cd到这个路径 下面就是你所有套件的文件夹。volume表示存储池，如果你装套件的时候选的是第二存储池，这里就是volume2，以此类推

威联通nas的共享文件在/share文件夹下。

自行研究
## 3.设置emby ScripterX插件,找到onMediaItemRemoved，点左侧新增4个脚本
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