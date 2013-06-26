local callbenchmark = require("callbenchmark")
--print("callbenchmark loaded", callbenchmark);

function BenchmarkEmptyCall()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_emptyCall = callbenchmark.emptyCall
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_emptyCall()
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
--	print("Elapsed time for emptycall with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end

function BenchmarkReturnDouble()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_returnDouble = callbenchmark.returnDouble
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_returnDouble()
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
--	print("Elapsed time for returnDouble with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end


function BenchmarkPassDouble()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passDouble = callbenchmark.passDouble
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_passDouble(1234.5)
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
--	print("Elapsed time for passDouble with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end

function BenchmarkPassAndReturnDouble()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passAndReturnDouble = callbenchmark.passAndReturnDouble
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_passAndReturnDouble(1234.5)
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
--	print("Elapsed time for passAndReturnDouble with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end

function BenchmarkPass2Double()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_pass2Double = callbenchmark.pass2Double
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_pass2Double(1234.5, 1.0)
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
--	print("Elapsed time for pass2Double with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end

--function LuaEmptyCall()
--end

function BenchmarkLuaEmptyCall()
	local callbenchmark_getTicks = callbenchmark.getTicks
	local start_time = callbenchmark_getTicks()
	local lua_empty_call = function() end

	for i=1, 10000000 do
		lua_empty_call()
	end

	local end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	print("Elapsed time for lua_empty_call with 10000000 loops is (ms) ", elapsed_time) 
	return elapsed_time
end


