-- 十进制整数转换为 二进制 存放于table中
function int_to_bitset(n)
	local t = {}
	for i=31, 0, -1 do
		t[#t+1] = math.floor(n / 2^i)
		n = n % 2^i
	end
	return t
end
-- 二进制 table 转换为十进制整数
function bitset_to_int(t)
	local n = 0
	for k,v in ipairs(t) do
		n = n + v * 2^(#t-k)
	end
	return n
end
-- 获取当前角色
function get_last_mp_char()
	return stats.get_int("MPPLY_LAST_MP_CHAR")
end

dch_menu_root = menu.add_submenu("名钻赌场豪劫")

-- $MP0_H3OPT_APPROACH = 1, 2 or 3
-- 1 Stealth | 2 trickery | 3 Loud

dch_menu_root:add_array_item("当前方式", {"未设置", "隐迹潜踪", "兵不厌诈", "气势汹汹"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")+1
end, function(value)
	local H3_LAST_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3_LAST_APPROACH")
	if not ((H3_LAST_APPROACH > 0) and (value == H3_LAST_APPROACH + 1)) then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_APPROACH", value-1)
	end
end)

dch_menu_root:add_array_item("困难方式", {"未设置", "隐迹潜踪", "兵不厌诈", "气势汹汹"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3_HARD_APPROACH")+1
end, function(value)
	local H3_LAST_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3_LAST_APPROACH")
	if not ((H3_LAST_APPROACH > 0) and (value == H3_LAST_APPROACH + 1)) then
		stats.set_int("MP"..get_last_mp_char().."_H3_HARD_APPROACH", value-1)
	end
end)

dch_menu_root:add_array_item("禁用方式", {"未设置", "隐迹潜踪", "兵不厌诈", "气势汹汹"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3_LAST_APPROACH")+1
end, function(value)
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local H3_HARD_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3_HARD_APPROACH")
	if (value==1) or not ( (value == H3OPT_APPROACH+1) or (value == H3_HARD_APPROACH+1)) then
		stats.set_int("MP"..get_last_mp_char().."_H3_LAST_APPROACH", value-1)
	end
end)

-- $MP0_H3OPT_TARGET = 0, 1, 2 or 3
-- 0 = Money | 1 = Gold | 2 = Art | 3 = Diamonds

dch_menu_root:add_array_item("主要目标", {"现金", "黄金", "艺术作品", "钻石"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_TARGET")+1
end, function(value)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_TARGET", value-1)
end)

dch_menu_root:add_array_item("选择枪手", {"未选择", "1", "2", "3", "4", "5"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_CREWWEAP")+1
end, function(value)
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWWEAP", value-1)
	end
end)

dch_menu_root:add_array_item("选择车手", {"未选择", "1", "2", "3", "4", "5"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_CREWDRIVER")+1
end, function(value)
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWDRIVER", value-1)
	end
end)

dch_menu_root:add_array_item("选择黑客", {"未选择", "1", "2", "3", "4", "5"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_CREWHACKER")+1
end, function(value)
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWHACKER", value-1)
	end
end)

dch_menu_root:add_int_range("选择武器", 1, 0, 1, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_WEAPS")
end, function(value)
	local H3OPT_CREWDRIVER = stats.get_int("MP"..get_last_mp_char().."_H3OPT_CREWWEAP")
	if H3OPT_CREWDRIVER > 0 then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_WEAPS", value)
	end
end)

dch_menu_root:add_int_range("选择脱身载具", 1, 0, 3, function()
	return stats.get_int("MP"..get_last_mp_char().."_H3OPT_VEHS")
end, function(value)
	local H3OPT_CREWDRIVER = stats.get_int("MP"..get_last_mp_char().."_H3OPT_CREWDRIVER")
	if H3OPT_CREWDRIVER > 0 then
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_VEHS", value)
	end
end)

dch_menu_root:add_action("一键完成必需前置", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	-- 判断选择的方式
	if H3OPT_APPROACH == 1 then
		-- 隐迹潜踪
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET1", 127) -- 0000 0111 1111
		AWD_PREPARATION = AWD_PREPARATION + 7
	elseif H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET1", 159) -- 0000 1001 1111
		AWD_PREPARATION = AWD_PREPARATION + 6
	elseif H3OPT_APPROACH == 3 then
		-- 气势汹汹
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET1", 799) -- 0011 0001 1111
		AWD_PREPARATION = AWD_PREPARATION + 7
	end
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		-- 2级门禁卡
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_KEYLEVELS", 2)
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps = dch_menu_root:add_submenu("可选前置")

dch_menu_optional_preps:add_action("【通用】一键设置常用方案", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 1 then
		-- 隐迹潜踪
		-- 0000 0_00 0000 0000 0010 101_
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-3] = 1
		BITSET0[#BITSET0-5] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
	elseif H3OPT_APPROACH == 2 then
		-- 兵不厌诈（默认古倍）
		-- 0000 0_00 0011 0000 0000 001_ 
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-12] = 1
		BITSET0[#BITSET0-13] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
	elseif H3OPT_APPROACH == 3 then
		-- 气势汹汹
		-- 0001 1_00 0000 0000 0000 010_
		BITSET0[#BITSET0-2] = 1
		BITSET0[#BITSET0-19] = 1
		BITSET0[#BITSET0-20] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
		-- 杜根货物
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_DISRUPTSHIP", 3)
	end
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
end)

dch_menu_optional_preps:add_action("【兵不厌诈】古倍科技", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_00 0011 0000 0000 001_ 
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-12] = 1
		BITSET0[#BITSET0-13] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【兵不厌诈】除虫大师", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_00 0000 0011 0000 001_
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-8] = 1
		BITSET0[#BITSET0-9] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【兵不厌诈】维修工", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_00 0000 1100 0000 001_
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-10] = 1
		BITSET0[#BITSET0-11] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【兵不厌诈】名人", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_00 1100 0000 0000 001_ 
		BITSET0[#BITSET0-1] = 1
		BITSET0[#BITSET0-14] = 1
		BITSET0[#BITSET0-15] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 3
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【兵不厌诈】获得国安局套装", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_01 0000 0000 0000 000_ 
		BITSET0[#BITSET0-16] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【兵不厌诈】获得消防员套装", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	-- 判断选择的方式
	if H3OPT_APPROACH == 2 then
		-- 兵不厌诈
		-- 0000 0_10 0000 0000 0000 000_ 
		BITSET0[#BITSET0-17] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【通用】获得电钻", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		-- 0001 1_00 0000 0000 0001 000_
		BITSET0[#BITSET0-4] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【通用】获得枪手诱饵", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		-- 0001 1_00 0000 0000 0100 000_
		BITSET0[#BITSET0-6] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【通用】获得更换载具", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		-- 0001 1_00 0000 0000 1000 000_
		BITSET0[#BITSET0-7] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_optional_preps:add_action("【通用】完成杜根货物", function()
	local H3OPT_APPROACH = stats.get_int("MP"..get_last_mp_char().."_H3OPT_APPROACH")
	local AWD_PREPARATION = stats.get_int("MP"..get_last_mp_char().."_AWD_PREPARATION")
	local H3OPT_BITSET0 = stats.get_int("MP"..get_last_mp_char().."_H3OPT_BITSET0")
	local BITSET0 = int_to_bitset(H3OPT_BITSET0)
	if (H3OPT_APPROACH > 0) and (H3OPT_APPROACH < 4) then
		-- 0001 1_00 0000 0000 0000 010_
		BITSET0[#BITSET0-2] = 1
		H3OPT_BITSET0 = bitset_to_int(BITSET0)
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", H3OPT_BITSET0)
		AWD_PREPARATION = AWD_PREPARATION + 1
		-- 杜根货物
		stats.set_int("MP"..get_last_mp_char().."_H3OPT_DISRUPTSHIP", 3)
		-- 修改赌场前置奖章进度
		--stats.set_int("MP"..get_last_mp_char().."_AWD_PREPARATION", AWD_PREPARATION)
	end
end)

dch_menu_reset_preps = dch_menu_root:add_submenu("重置白板")
dch_menu_reset_all = dch_menu_root:add_submenu("重置赌场豪劫")
dch_menu_reset_preps:add_int_range("你是否确定要为角色重置白板？", 1, 0, 1, function()
	return get_last_mp_char()
end, function(value) end)
dch_menu_reset_all:add_int_range("你是否确定要为角色重置赌场豪劫？", 1, 0, 1, function()
	return get_last_mp_char()
end, function(value) end)

for i=1, 6, 1 do
	dch_menu_reset_preps:add_action("否", function() end)
	dch_menu_reset_all:add_action("否", function() end)
end

dch_menu_reset_preps:add_action("是 - 重置白板", function()
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET1", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWHACKER", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWDRIVER", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWWEAP", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_APPROACH", 0)
end)

dch_menu_reset_all:add_action("是 - 重置赌场豪劫", function()
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET1", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_BITSET0", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWHACKER", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWDRIVER", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_CREWWEAP", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_APPROACH", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_POI", 0)
	stats.set_int("MP"..get_last_mp_char().."_H3OPT_ACCESSPOINTS", 0)
	stats.set_int("MP"..get_last_mp_char().."_CAS_HEIST_FLOW", 0)
end)

for i=1, 3, 1 do
	dch_menu_reset_preps:add_action("否", function() end)
	dch_menu_reset_all:add_action("否", function() end)
end

-- MP0_H3OPT_BITSET1
-- VaultContents = 0x00000001,
-- VaultKeys = 0x00000002,
-- WeaponsMissionFinished = 0x00000004,
-- VehicleMissionFinished = 0x00000008,
-- HackingDevice = 0x00000010,
-- NanoDrone = 0x00000020,
-- VaultLaser = 0x00000040,
-- VaultDrill = 0x00000080,
-- VaultExplosives = 0x00000100,
-- ThermalCharges = 0x00000200

-- MP0_H3OPT_BITSET0
-- PatrolRoutes = 0x00000002, Set bitset to -2 to complete all except patrol route's !?
-- DugganShipments = 0x00000004,
-- InfiltrationSuits = 0x00000008,
-- PowerDrills = 0x00000010,
-- EMP = 0x00000020,
-- GunmanDecoy = 0x00000040,
-- CleanVehicle = 0x00000080,
-- BugstarsPartOne = 0x00000100,
-- BugstarsPartTwo = 0x00000200,
-- MaintenancePartOne = 0x00000400,
-- MaintenancePartTwo = 0x00000800,
-- GruppeSechsPartOne = 0x00001000,
-- GruppeSechsPartTwo = 0x00002000,
-- YungAncestorPartOne = 0x00004000,
-- YungAncestorPartTwo = 0x00008000,
-- NOOSEGearExitDisguise = 0x00010000,
-- FirefighterGearExitDisguise = 0x00020000,
-- HighRollerExitDisguise = 0x00040000,
-- ReinforcedArmor = 0x00100000,
-- BoringMachine = 0x00280000

-- $MP0_H3OPT_DISRUPTSHIP = 3 /remove heavy armed guards
-- $MP0_H3OPT_KEYLEVELS = 2 / value is valid up to 2 scan card value
-- $MP0_H3OPT_CREWWEAP = 5 / Patrick Mcreary
-- $MP0_H3OPT_CREWDRIVER = 5 / Chester Mccoy
-- $MP0_H3OPT_CREWHACKER = 4 Avi / 5 Page Harris
-- $MP0_H3OPT_VEHS = 0, 1, 2, 3 Change the type of car your member has
-- $MP0_H3OPT_WEAPS = 0,1 changes weapons selection
