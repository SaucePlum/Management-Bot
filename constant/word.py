#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
常量封装
"""
import datetime

class DateTime:
    # 格式化日期时间
    @classmethod
    @property
    def today_date(_) -> datetime.date:
        return datetime.date.today()

    @classmethod
    @property
    def tomorrow_date(_) -> datetime.date:
        return datetime.date.today() + datetime.timedelta(days=+1)

    @classmethod
    @property
    def yesterday_date(_) -> datetime.date:
        return datetime.date.today() + datetime.timedelta(days=-1)

    @classmethod
    @property
    def now_date_time(_) -> str:
        return datetime.datetime.today().strftime("%Y-%m-%d %H:%M:%S")


class ArkMsg:
    logger_model = '频道实时数据日志\n' \
                   '——————————————————\n' \
                   '新增成员人数：{}位\n' \
                   '流失成员人数：{}位\n' \
                   '移出成员人数：{}位\n' \
                   '净增成员人数：{}位\n' \
                   '违规成员人数：{}位\n' \
                   '活跃成员人数：{}位\n' \
                   '净增成员占比：{}\n' \
                   '活跃成员占比：{}'