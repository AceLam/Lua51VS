local foo1 = {
    [1] = 'a',
    [2] = 'b',
    [3] = 'c',
    [4] = 'd',
    [5] = 'e',
}

local foo2 = {
    'a',
    'b',
    'c',
    'd',
    'e',
}

local foo3 = {
    [1] = 'a',
    [2] = 'b',
    [4] = 'c',
    [8] = 'c',
    [16] = 'c',
}

local foo4 = {
    'a',
    'b',
    'c',
    nil,
    'd',
    'e',
}

print(#foo1);
print(#foo2);
print(#foo3);
print(#foo4);

for i, v in ipairs(foo4) do
    print(i, v);
end