#!/bin/bash

# 拉取 Docker 镜像
docker pull xuthics/clover-trader:v0.1

# 创建配置目录
mkdir -p config

# 创建默认配置文件
cat <<EOL > config/default.json
{
    "gate": {
      "api-key": "",
      "api-secret": ""
    },
    "clover": {
        "api-key": "",
        "total-usdt-per-symbol": 100,
        "c-amount": 300,
        "fuli": {
            "auto": true,
            "start": true
        },
        "huazhaun": {
            "auto": true
        }
    },
    "telegram": {
        "use": false,
        "bot-token": "",
        "chat-id": ""
    }
}
EOL

# 运行 Docker 容器
docker run -v $(pwd)/config:/app/config -d xuthics/clover-trader:v0.1

echo "Clover Trader 已成功安装并运行。"
