local info = debug.getinfo(1, "S");
local path = info.short_src;
local dir = string.match(path, "^.*[/\\]");

if dir then
    package.path = package.path .. ";" .. dir .. "?.lua";
end

serpent = require("serpent");

modules = {
    --"test.bisect",          --bisection method for solving non-linear equations
    --"test.cf",              --temperature conversion table (celsius to farenheit)
    --"test.echo",            --echo command line arguments
    --"test.env",             --environment variables as automatic global variables
    --"test.factorial",       --factorial without recursion
    --"test.fib",             --fibonacci function with cache
    --"test.fibfor",          --fibonacci numbers with coroutines and generators
    --"test.globals",         --report global variable usage
    --"test.hello",           --the first program in every languag
    --"test.life",            --Conway's Game of Life
    --"test.luac",            --bare-bones luac
    --"test.printf",          --an implementation of printf
    --"test.readonly",        --make global variables readonly
    --"test.sieve",           --the sieve of of Eratosthenes programmed with coroutines
    --"test.sort",            --two implementations of a sort function
    --"test.table",           --make table, grouping all data for the same item
    --"test.trace-calls",     --trace calls
    --"test.trace-globals",   --trace assigments to global variables
    --"test.xd",              --hex dump
    --"cwd",                  --an implementation of printf
    --"tables",                --table test
    "vargs",                --variable arguments
}

for i, v in ipairs(modules) do
    require(v);
end