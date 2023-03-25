#!/bin/sh
BASE_ROOT=$(cd "$(dirname "$0")";pwd)

MEDIA_TYPE=$1
MEDIA_NAME=$2
MEDIA_PATH=$3
TMDB_ID=$4
SEASON_NUM=$5
EPISODE_NUM=$6

# nastools地址
NASTOOL_WEBHOOK_URL=http://192.168.31.184:3000/emby


# 发送请求同步删除NASTOOL历史记录
if [ ${MEDIA_TYPE} = "Movie" ]; then
    data='data={"event_type":"media_del","media_type":"'${MEDIA_TYPE}'","media_name":"'${MEDIA_NAME}'","media_path":"'${MEDIA_PATH}'","tmdb_id":"'${TMDB_ID}'"}'
elif [ ${MEDIA_TYPE} = "Series" ]; then
    data='data={"event_type":"media_del","media_type":"'${MEDIA_TYPE}'","media_name":"'${MEDIA_NAME}'","media_path":"'${MEDIA_PATH}'","tmdb_id":"'${TMDB_ID}'"}'
elif [ ${MEDIA_TYPE} = "Season" ]; then
    data='data={"event_type":"media_del","media_type":"'${MEDIA_TYPE}'","media_name":"'${MEDIA_NAME}'","media_path":"'${MEDIA_PATH}'","tmdb_id":"'${TMDB_ID}'","season_num":"'${SEASON_NUM}'"}'
elif [ ${MEDIA_TYPE} = "Episode" ]; then
    data='data={"event_type":"media_del","media_type":"'${MEDIA_TYPE}'","media_name":"'${MEDIA_NAME}'","media_path":"'${MEDIA_PATH}'","tmdb_id":"'${TMDB_ID}'","season_num":"'${SEASON_NUM}'","episode_num":"'${EPISODE_NUM}'"}'
fi

"${BASE_ROOT}"/curl -X POST -d "$data" /emby_webhook "${NASTOOL_WEBHOOK_URL}"


#Movie 茅山僵尸拳（1979） /data/aliyun/movies/国产电影/茅山僵尸拳.The.Shadow.Boxing.1979.JPN.BluRay.720p.x264.FLAC.2Audios-CMCT.mkv 161017
#Episode 刑事侦缉档案 /data/series/国产剧/刑事侦缉档案 (1995)/Season 1/刑事侦缉档案 - S01E01 - 第1集.mkv 71971 1 1
#Season 刑事侦缉档案 /data/series/国产剧/刑事侦缉档案 (1995)/Season 1 71971 1
#Series 刑事侦缉档案 /data/series/国产剧/刑事侦缉档案 (1995) 71971