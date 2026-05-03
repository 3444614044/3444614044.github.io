# 腾讯云COS配置指南

为了完成游戏上传，需要配置腾讯云COS凭证：

## 需要的凭证信息

1. **SecretId** — 腾讯云API密钥ID
2. **SecretKey** — 腾讯云API密钥Key  
3. **Region** — 存储桶区域（如 ap-guangzhou、ap-shanghai）
4. **Bucket** — 存储桶名称（格式 name-appid，如 mybucket-1250000000）
5. **DatasetName**（可选） — 数据万象数据集名称（仅智能搜索需要）
6. **Domain**（可选） — 自定义域名，用于替换默认的COS访问域名
7. **ServiceDomain**（可选） — 自定义服务域名
8. **Protocol**（可选） — 协议，如 https 或 http

## 如何获取凭证

1. **登录腾讯云控制台**：https://console.cloud.tencent.com/cam/capi
   - 进入"访问管理" → "API密钥管理"
   - 获取 SecretId 和 SecretKey

2. **查看存储桶信息**：https://console.cloud.tencent.com/cos/bucket
   - 进入COS控制台
   - 选择你的存储桶
   - 查看Region和Bucket名称

## 配置命令

提供凭证后，运行以下命令配置COS：

```bash
cd /root/.openclaw/workspace/skills/tencent-cos-skill

./scripts/setup.sh \
  --secret-id "你的SecretId" \
  --secret-key "你的SecretKey" \
  --region "你的Region" \
  --bucket "你的Bucket"
```

如果需要数据集：
```bash
./scripts/setup.sh \
  --secret-id "你的SecretId" \
  --secret-key "你的SecretKey" \
  --region "你的Region" \
  --bucket "你的Bucket" \
  --dataset "你的DatasetName"
```

如果需要自定义域名：
```bash
./scripts/setup.sh \
  --secret-id "你的SecretId" \
  --secret-key "你的SecretKey" \
  --region "你的Region" \
  --bucket "你的Bucket" \
  --domain "你的自定义域名" \
  --service-domain "服务域名" \
  --protocol "https或http"
```

## 临时上传方案

在配置COS之前，可以使用以下临时方案上传游戏：

### 方案1：本地测试
游戏已经在本地构建完成，可以直接测试运行：
```bash
./git-escape.sh start
```

### 方案2：GitHub Releases
可以使用GitHub的发布功能：
```bash
# 将游戏发布到GitHub
# 需要配置GitHub凭据
```

### 方案3：简单HTTP服务器
创建一个简单的HTTP服务器分发游戏：
```bash
# 在本地启动HTTP服务器
python3 -m http.server 8000
```

## 配置完成后

COS配置完成后，可以修改upload.sh脚本实现真正的上传：

```bash
# 在upload.sh中添加COS上传代码
cos_upload "$LAST_BUILD" "games/git-escape/$LAST_BUILD"
```

## 立即尝试

如果你有腾讯云COS凭证，请提供：
- SecretId
- SecretKey
- Region
- Bucket

我可以立即配置并上传游戏到云端！