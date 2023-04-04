# ScripterX-GET方式

### 使用get方式，基本所有版本都可用

![image](https://user-images.githubusercontent.com/54088512/228715789-51a01a10-9dc6-40f2-b8cd-fd6ccb5f6b24.png)

#### 1）删除电影或者整个剧集配置

Run设置为你自己的nt地址:

http://localhost:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%item.name%&media_path=%item.path%&tmdb_id=%item.meta.tmdb%

using选择web:get

![img_1.png](image/img.png)

#### 2）删除剧集单季或者某集配置

Run设置为你自己的nt地址:

http://localhost:3000/emby?event_type=media_del&media_type=%item.type%&media_name=%series.name%&media_path=%item.path%&tmdb_id=%series.meta.tmdb%&season_num=%season.number%&episode_num=%episode.number%

using选择web:get

![img.png](image/img2.png)

### 如开启了apikey校验，自行在上述地址末尾添加&apikey=