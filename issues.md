# Emby新入库直接触发同步删除问题

## 更新nastool3.1.4及以上版本

## POST方式：
### ScripterX3 在四个参数文件新增"item_isvirtual": "%item.isvirtual%"
### ScripterX4 在四个参数文件新增"item_isvirtual": %item.isvirtual%
### [手动配置](https://github.com/thsrite/emby_sync_del_nt/blob/main/ScripterX-POST.md)：ScripterX版本参数不同

### 注意参数自行添加逗号


## GET方式：
### URL后面拼接&item_isvirtual=%item.isvirtual%
### [手动配置](https://github.com/thsrite/emby_sync_del_nt/blob/main/ScripterX-GET.md)