# ScripterX-GET方式

###使用get方式，省略了post方式的参数文件，理论上没啥问题。不排除媒体文件有什么乱七八糟字符……胜在配置简单了。

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