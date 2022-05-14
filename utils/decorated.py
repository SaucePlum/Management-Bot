#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
装饰器封装
"""

import qqbot
from functools import wraps

from constant import config
from flow.reply import send_reply_msg

ROLE_MANAGER = "2"
ROLE_CREATOR = "4"
NAME_MANAGER = "管理员"

class Command:
    """
    指令命令
    """

    def __init__(self, command):
        self.command = command

    def __call__(self, func):
        @wraps(func)
        async def decorated(*args, **kwargs):
            message: qqbot.Message = kwargs["message"]
            if self.command in message.content:
                qqbot.logger.debug("command %s match" % self.command)
                # 分割指令后面的指令参数
                params = message.content.split(self.command)[1].strip()
                return await func(message=message, params=params, event=kwargs["event"])
            else:
                qqbot.logger.debug("command %s not match, skip!" % self.command)
                return False

        return decorated


class Role:
    """
    指令使用角色
    """

    def __init__(self, role):
        self.role = role

    def __call__(self, func):
        async def authority_manager(message):
            # 管理员判断
            member_api = qqbot.AsyncGuildMemberAPI(
                qqbot.Token(config["token"]["appid"], config["token"]["token"]), False
            )
            member = await member_api.get_guild_member(
                message.guild_id, message.author.id
            )
            if ROLE_MANAGER in member.roles or ROLE_CREATOR in member.roles:
                return True
            else:
                return False

        @wraps(func)
        async def decorated(*args, **kwargs):
            message: qqbot.Message = kwargs["message"]
            if NAME_MANAGER in self.role and await authority_manager(message):
                return await func(*args, **kwargs)
            await send_reply_msg(message.channel_id, message.id, '权限不足，无法执行你的指令！')
            return True

        return decorated
