#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
发送消息和消息模板
"""
import qqbot
from qqbot import MessageArk, MessageArkKv, MessageArkObj, MessageArkObjKv

from constant import config

token = qqbot.Token(config["token"]["appid"], config["token"]["token"])

async def send_reply_msg(channel_id: str = None, msg_id: str =None, content: str = None):
    """
    发送普通消息
    :param channel_id: 子频道id
    :param msg_id: 消息id
    :param content: 内容
    """
    msg_api = qqbot.AsyncMessageAPI(token, False, timeout=5)
    send = qqbot.MessageSendRequest(content=content, msg_id=msg_id)

    # 通过api发送回复消息
    await msg_api.post_message(channel_id, send)
    qqbot.logger.info("普通消息发送成功")
    return

async def send_ark23_msg(channel_id, msg_id, title, desc_dict):
    """
    发送模版消息
    :param channel_id: 子频道id
    :param msg_id: 消息id
    :param title: 标题
    :param desc_dict: 内容
    """
    # 构造消息发送请求数据对象
    msg_api = qqbot.AsyncMessageAPI(token, False, timeout=5)
    ark = MessageArk()
    # 模版ID=24
    ark.template_id = 23
    desc = [MessageArkObj(obj_kv=[MessageArkObjKv(key="desc", value=desc)]) for desc in desc_dict]
    ark.kv = [MessageArkKv(key="#DESC#", value=title),
              MessageArkKv(key="#PROMPT#", value=title),
              MessageArkKv(key="#LIST#", obj=desc)]
    # 通过api发送模版消息
    send = qqbot.MessageSendRequest(content="", ark=ark, msg_id=msg_id)
    await msg_api.post_message(channel_id, send)
    return


async def send_ark24_msg(channel_id, msg_id, title, desc, prompt, image: str = None):
    """
    发送模版消息
    :param channel_id: 子频道id
    :param msg_id: 消息id
    :param title: 标题
    :param desc: 内容
    :param prompt: 弹窗
    :param image: 图片
    """
    # 构造消息发送请求数据对象
    msg_api = qqbot.AsyncMessageAPI(token, False, timeout=5)
    ark = MessageArk()
    # 模版ID=24
    ark.template_id = 24
    ark.kv = [MessageArkKv(key="#TITLE#", value=title),
              MessageArkKv(key="#DESC#", value=desc),
              MessageArkKv(key="#METADESC#", value=desc),
              MessageArkKv(key="#IMG#", value=image),
              MessageArkKv(key="#PROMPT#", value=prompt)]
    # 通过api发送模版消息
    send = qqbot.MessageSendRequest(content="", ark=ark, msg_id=msg_id)
    await msg_api.post_message(channel_id, send)
    return

