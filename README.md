# nginx-lua-post
## 关于校验nginx+lua中的post请求
```bash
校验post请求中的body中携带的用户名 检查用户名是否在白名单中
如果是非白名单用户 则返回403错误
和nginx+lua-get请求可以写在一起 判断请求类型是if get ==requst.请求方式 就走get请求 如果是post就走post请求
```
