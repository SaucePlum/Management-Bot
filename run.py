#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run.py: 小念管家主程序
"""
import sys
import qqbot
from constant import config
from flow.handlers import msg_handler, member_handler
token = qqbot.Token(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
    # 运行机器人
    # 消息事件(正式环境>公域艾特: AT_MESSAGE_EVENT_HANDLER )/(测试环境>私域不艾特): MESSAGE_EVENT_HANDLER)
    channel_msg = qqbot.Handler(qqbot.HandlerType.MESSAGE_EVENT_HANDLER, msg_handler)
    # 成员事件
    guild_handler_handler = qqbot.Handler(qqbot.HandlerType.GUILD_MEMBER_EVENT_HANDLER, member_handler)
    # 事件监听
    qqbot.async_listen_events(token, True, channel_msg, guild_handler_handler)
