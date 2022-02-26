-- 校验用户请求body中携带的人名参数
ngx.req.read_body()
-- 构建一个数组
local args, err = ngx.req.get_post_args()
--通过for循环遍历key,val
for key, val in pairs(args) do
    --找到是username的key
    if key == "username" then
        if val ~= nil then
            -- 将username的key传递给bash2.sh
            local cmd2 = ("sh base2.sh " .. val)
            --拼接执行命令
            local t = io.popen(cmd2)
            -- 读取返回结果
            local result = t:read("*all")
            --将返回数值转换成为数字格式
            local num = tonumber(result)
            --进行判断对比
            if num ~= 200 then
                -- 不符合白名单要求返回403
                ngx.exit(ngx.HTTP_FORBIDDEN)
            end
            --关闭io流
            t:close()
        end
    end
end
