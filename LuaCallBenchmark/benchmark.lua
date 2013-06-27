local callbenchmark = require("callbenchmark")
print("callbenchmark loaded,", callbenchmark);

function BenchmarkEmptyCall()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_emptyCall = callbenchmark.emptyCall
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_emptyCall()
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for emptycall with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for emptycall is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkReturnDouble()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_returnDouble = callbenchmark.returnDouble
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_returnDouble()
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for returnDouble with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for returnDouble is (ms) ", elapsed_gc_time) 
	return elapsed_time
end


function BenchmarkPassDouble()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passDouble = callbenchmark.passDouble
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_passDouble(1234.5)
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for passDouble with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for passDouble is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkPassAndReturnDouble()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passAndReturnDouble = callbenchmark.passAndReturnDouble
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_passAndReturnDouble(1234.5)
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for passAndReturnDouble with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for passAndReturnDouble is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkPass2Double()
	collectgarbage("collect")
	
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_pass2Double = callbenchmark.pass2Double
	--collectgarbage("stop")
	
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_pass2Double(1234.5, 1.0)
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time	
	print("Elapsed time for pass2Double with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for pass2Double is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

--function LuaEmptyCall()
--end

function BenchmarkLuaEmptyCall()
	collectgarbage("collect")
	local lua_empty_call = function() end
	local callbenchmark_getTicks = callbenchmark.getTicks
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		lua_empty_call()
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for lua_empty_call with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for lua_empty_call is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkLuaAddFunction()
	collectgarbage("collect")
	local lua_addFunction_call = function(a, b) return a+b end
	local callbenchmark_getTicks = callbenchmark.getTicks
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		lua_addFunction_call(i, 1)
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for lua_addFunction_call with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for lua_addFunction_call is (ms) ", elapsed_gc_time) 
	return elapsed_time
end





function BenchmarkReturnString()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_returnString = callbenchmark.returnString
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_returnString()
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for returnString with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for returnString is (ms) ", elapsed_gc_time) 
	return elapsed_time
end


function BenchmarkPassString()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passString = callbenchmark.passString
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_passString("Hello World")
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for passString with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for passString is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkPassAndReturnString()
	collectgarbage("collect")
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_passAndReturnString = callbenchmark.passAndReturnString
	--collectgarbage("stop")

	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		local val = callbenchmark_passAndReturnString("Hello World")
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time
	print("Elapsed time for passAndReturnString with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for passAndReturnString is (ms) ", elapsed_gc_time) 
	return elapsed_time
end

function BenchmarkPass2String()
	collectgarbage("collect")
	
	local callbenchmark_getTicks = callbenchmark.getTicks
	local callbenchmark_pass2String = callbenchmark.pass2String
	--collectgarbage("stop")
	
	local start_time = callbenchmark_getTicks()

	for i=1, 10000000 do
		callbenchmark_pass2String("Hello", "World")
	end

	local end_time = callbenchmark_getTicks()
	collectgarbage("collect")
	local gc_end_time = callbenchmark_getTicks()

	local elapsed_time = end_time - start_time
	local elapsed_gc_time = gc_end_time - end_time	
	print("Elapsed time for pass2String with 10000000 loops is (ms) ", elapsed_time) 
	print("Elapsed cleanup (gc) time for pass2String is (ms) ", elapsed_gc_time) 
	return elapsed_time
end



