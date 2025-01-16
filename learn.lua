-- Two dashes start a one-line comment.
--[[
    Adding two ['s and ]'s makes it a
    multi-line comment.
]]
s = 'walternate'    -- Immutable strings like Python.
num = 42            -- Numbers can be integer or floating point.
t = "double-quotes are also fine"
u = [[ Double brackets
        start and end
        multi line strings.]]
t = nil -- Undefines t; Lua has garbage collection

-- Blocks are denoted with keywords like do/end

if num > 40 then
    print('over 40')
elseif s ~= 'walternate' then -- ~= is not equals.
    -- Equality check is == like Python; ok for strs.
    io.write('not over 40\n') -- Defaults to stdout.
else
    -- variables are global by default.
    thisIsGlobal = 5 -- Camel case is common.

    -- How to make a variable local:
    local line = io.read() -- Reads next stdin line.

    -- String concatenation uses the .. operator:
    print('Winter is comming, ' .. line)
end

foo = anUnknownVariable -- Now foo = nil
aBoolValue = false

if not aBoolValue then
    print('it was false')
end

ans = aBoolValue and 'yes' or 'no'

karlSum = 0
for i = 1, 100 do
    karlSum = karlSum + i
end

fredSum = 0
for j = 100, 1, -1 do
    fredSum = fredSum + j
end

repeat
    print('the way of the future')
    num = num - 1
until num == 0

function fib(n)
    if n < 2 then
        return 1
    end
    return fib(n - 2) + fib(n - 1)
end

function adder(x)
    return function(y)
        return x + y
    end
end

a1 = adder(9)
a2 = adder(36)
print(a1(16))
print(a2(64))

x, y, z = 1, 2, 3, 4

function bar(a, b, c)
    print(a, b, c)
    return 4, 8, 15, 16, 23, 42
end

x, y = bar('zaphod')

function f(x)
    return x * x
end

f = function(x)
    return x * x
end

local function g(x)
    return math.sin(x)
end
local g;
g = function(x)
    return math.sin(x)
end

print 'hello'

t = {
    key1 = 'value1',
    key2 = false
}

print(t.key1)
t.newKey = {}
t.key2 = nil
u = {
    ['@!#'] = 'qbert',
    [{}] = 1729,
    [6.28] = 'tau'
}
print(u[6.28])
a = u['@!#']
b = u[{}]

function h(x)
    print(x.key1)
end

h {
    key1 = 'Sonmi~451'
}
for key, val in pairs(u) do
    print(key, val)
end

print(_G['_G'] == _G)

v = { 'value1', 'value2', 1.21, 'gigawatts' }
for i = 1, #v do
    print(v[i])
end

f1 = {
    a = 1,
    b = 2
}
f2 = {
    a = 2,
    b = 3
}
metafraction = {}
function metafraction.__add(f1, f2)
    sum = {}
    sum.b = f1.b * f2.b
    sum.a = f1.a * f2.b + f2.a * f1.b
    return sum
end

setmetatable(f1, metafraction)
setmetatable(f2, metafraction)
s = f1 + f2

defaultFavs = {
    animal = 'gru',
    food = 'donuts'
}
myFavs = {
    food = 'pizza'
}
setmetatable(myFavs, {
    __index = defaultFavs
})
eatenBy = myFavs.animal

Dog = {}
function Dog:new()
    newObj = {
        sound = 'woof'
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Dog:makeSound()
    print('I say ' .. self.sound)
end

mrDog = Dog:new()
mrDog:makeSound()
LoudDog = Dog:new()
function LoudDog:makeSound()
    s = self.sound .. ' '
    print(s .. s .. s)
end

seymour = LoudDog:new()
seymour:makeSound()

function LoudDog:new()
    newObj = {}
    self.__index = self
    return setmetatable(newObj, self)
end

-- local M = {}

-- local function sayMyName()
--     print('Hrunker')

-- end
-- function M.sayHello()
--    print('Why hello there')
--     sayMyName()
-- end

-- return M

-- local mod = require('mod')

-- local mod = (function ()
-- <contents of mod.lua>
-- end)()

-- mod.sayHello

-- local a = require('mod2')
-- local b = require('mod2')

-- dotfile('mod2.lua')
-- dotfile('mod2.lua')

-- f = loadfile('mod2.lua')
-- g = load('print(343)')
-- g()

for i = 1, 11,2 do
    x = x + 1
    print(x)
end