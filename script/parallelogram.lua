local function ccp(x, y)
    local p = {}
    p.x = x
    p.y = y
    return p
end

local p1 = ccp(0, 100)
local p2 = ccp(50, 150)
local p3 = ccp(100, 0)
local p4 = ccp(150, 50)

-- y = x + 100
-- y = x - 100
-- y = -x + 100
-- y = -x + 200

-- 斜率 = (y2 - y1) / (x2 - x1)
local k1 = (p2.y -p1.y) / (p2.x - p1.x)
local k2 = (p3.y -p1.y) / (p3.x - p1.x)

-- 在 y 轴上的截距 = (x2 * y1 - x1 * y2) / (x2 - x1)
local b1 = (p2.x * p1.y - p1.x * p2.y) / (p2.x -p1.x)
local b2 = (p4.x * p3.y - p3.x * p4.y) / (p4.x -p3.x)
local b3 = (p3.x * p1.y - p1.x * p3.y) / (p3.x -p1.x)
local b4 = (p4.x * p2.y - p2.x * p4.y) / (p4.x -p2.x)

-- 截距范围
-- b1 、b2 分别为线 p1p2 和线 p3p4 在 y 轴上的截距
local bRange1 = {b1, b2}
-- b3 、b4 分别为线 p1p3 和线 p2p4 在 y 轴上的截距
local bRange2 = {b3, b4}
table.sort(bRange1)
table.sort(bRange2)

--[[
原理：
现有平行四边形 p1p2p3p4 ，
b1 、b2 分别为线 p1p2 和线 p3p4 在 y 轴上的截距，
b3 、b4 分别为线 p1p3 和线 p2p4 在 y 轴上的截距。
若有点 p 位于平行四边形 p1p2p3p4 内，
则有平行于线 p1p2 且穿过点 p 的线 l1 , l1 在 y 轴上的截距必定介于 b1 和 b2 之间，
同理有平行于线 p1p3 且穿过点 p 的线 l2 , l2 在 y 轴上的截距必定介于 b3 和 b4 之间。

若要随机出位于平行四边形 p1p2p3p4 内的点 p ，可先随机出 l1 和 l2 的截距，
根据平行线斜率相等的特性推导出 l1 和 l2 的直线方程，
解 l1 和 l2 的二元一次方程，求出 l1 和 l2 的交点，则为点 p 。


解以下二元一次方程：
a * x + b * y = m
c * x + d * y = n
通解：
x = (b * n - d * m) / (b * c - a * d)
y = (a * n - c * m) / (a * d - b * c)

推导：
-k1 * x + y = b1
-k2 * x + y = b2
得：
x = (b2 - b1) / (k1 - k2)
y = (k2 * b1 - k1 * b2) / (k2 - k1)
]]
local function randomPoint()
    local delta1 = bRange1[2] - bRange1[1]
    local delta2 = bRange2[2] - bRange2[1]

    local bDeltaRandom1 = math.random(delta1)
    local bDeltaRandom2 = math.random(delta2)

    local bRandom1 = bDeltaRandom1 + bRange1[1]
    local bRandom2 = bDeltaRandom2 + bRange2[1]

    local x = (bRandom2 - bRandom1) / (k1 - k2)
    local y = (k2 * bRandom1 - k1 * bRandom2) / (k2 - k1)

    print(x..","..y)
end

for i = 1, 999 do
    randomPoint()
end