#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
加载数据常量
"""

import os

from qqbot.core.util.yaml_util import YamlUtil

# 加载数据库配置文件
config = YamlUtil.read(os.path.join(os.path.dirname(__file__), "config.yaml"))


