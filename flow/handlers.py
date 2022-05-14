#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
事件监听
"""
import qqbot
from qqbot.model.member import MemberWithGuildID
from qqbot.model.ws_context import WsContext

from flow.reply import send_ark24_msg


async def msg_handler(context:WsContext, msg:qqbot.Message):
    """
    消息事件
    :param context: 事件类型/事件id
    :param msg: 消息体
    """
    return


async def member_handler(context:WsContext, guild_member: MemberWithGuildID):
    """
    频道成员事件
    :param context: 事件类型
    :param guild_member: 频道成员事件对象
    """
    return