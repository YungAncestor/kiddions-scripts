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

cph_menu_root = menu.add_submenu("佩里科岛抢劫任务")

-- 0: Tequila: 900K (Normal) | 990k (Hard)
-- 1: Ruby Necklace: 1M (Normal) | 1.1M (Hard)
-- 2: Bearer Bonds: 1.1M (Normal) | 1.21M (Hard)
-- 3: Pink Diamond: 1.3M (Normal) | 1.43M (Hard)
-- 4: Madrazo Files: 1.1M (Normal) | ??? (Hard)
-- 5: Sapphire Panther: 1.9M (Normal) | 2.09M (Hard)

cph_menu_root:add_array_item("主要目标", {"西西米托龙舌兰", "红宝石项链", "不记名债券", "粉钻", "玛德拉索文件", "猎豹雕像"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H4CNF_TARGET")+1
end, function(value)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_TARGET", value-1)
end)

cph_menu_side_target = cph_menu_root:add_submenu("次要目标")
cph_menu_side_target:add_action("设置全岛黄金", function()
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I", 16777215)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I_SCOPED", 16777215)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C", 255)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C_SCOPED", 255)
end)

cph_menu_side_target:add_action("设置豪宅全部位置有画", function()
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_PAINT", 127)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_PAINT_SCOPED", 127)
end)



cph_menu_root:add_action("一键跳过全部前置（先交钱开任务）", function()
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", 65535)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_WEAPONS", 2)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_WEP_DISRP", 3)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_ARM_DISRP", 3)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_HEL_DISRP", 3)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", 131071)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_ABIL", 63)
	-- 全部侦察
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_PAINT_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_PAINT"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C"))
end)

cph_menu_optional_preps = cph_menu_root:add_submenu("自定义")

cph_menu_optional_preps:add_action("一键侦查", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0] = 1
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", 131071)
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_PAINT_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_PAINT"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_CASH_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_CASH_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_COKE_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_COKE_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_WEED_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_WEED_C"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_I"))
	stats.set_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C_SCOPED", stats.get_int("MP"..get_last_mp_char().."_H4LOOT_GOLD_C"))
end)

cph_menu_optional_preps:add_toggle("困难模式", function()
	local H4_PROGRESS = stats.get_int("MP"..get_last_mp_char().."_H4_PROGRESS")
	local BITSET0 = int_to_bitset(H4_PROGRESS)
	return (BITSET0[#BITSET0-12] == 1)
end, function(value)
	local H4_PROGRESS = stats.get_int("MP"..get_last_mp_char().."_H4_PROGRESS")
	local BITSET0 = int_to_bitset(H4_PROGRESS)
	BITSET0[#BITSET0-12] = value and 1 or 0
	H4_PROGRESS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_PROGRESS", H4_PROGRESS)
end)

cph_menu_optional_preps:add_toggle("虎鲸", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-1] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-1] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("阿尔科诺斯特", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-2] == 1) 
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-2] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("梅杜莎", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-3] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-3] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("隐形歼灭者", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-4] == 1) 
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-4] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("巡逻艇", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-5] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-5] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("长崎", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-6] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-6] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("飞行员", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-7] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-7] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("爆破弹", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-8] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-8] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("指纹复制器", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-9] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-9] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("等离子切割器（或保险箱密码）", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-10] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-10] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("割炬", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-11] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-11] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_array_item("选择武器", {"未选择", "侵略者", "阴谋者", "神枪手", "破坏者", "神射手"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H4CNF_WEAPONS")+1
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_WEAPONS", value-1)
	if value==1 then
		BITSET0[#BITSET0-12] = 0
	else
		BITSET0[#BITSET0-12] = 1
	end
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("消音器", function()
	local H4CNF_BS_GEN = stats.get_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN")
	local BITSET0 = int_to_bitset(H4CNF_BS_GEN)
	return (BITSET0[#BITSET0-12] == 1)
end, function(value)
	local H4CNF_BS_GEN = stats.get_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN")
	local BITSET0 = int_to_bitset(H4CNF_BS_GEN)
	BITSET0[#BITSET0-12] = value and 1 or 0
	H4CNF_BS_GEN = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", H4CNF_BS_GEN)
end)

cph_menu_optional_preps:add_toggle("武器干扰", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-13] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-13] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("防弹衣干扰", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-14] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-14] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("空中支援干扰", function()
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	return (BITSET0[#BITSET0-15] == 1)
end, function(value)
	local H4_MISSIONS = stats.get_int("MP"..get_last_mp_char().."_H4_MISSIONS")
	local BITSET0 = int_to_bitset(H4_MISSIONS)
	BITSET0[#BITSET0-15] = value and 1 or 0
	H4_MISSIONS = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", H4_MISSIONS)
end)

cph_menu_optional_preps:add_toggle("混合粉", function()
	local H4CNF_BS_GEN = stats.get_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN")
	local BITSET0 = int_to_bitset(H4CNF_BS_GEN)
	return (BITSET0[#BITSET0-13] == 1)
end, function(value)
	local H4CNF_BS_GEN = stats.get_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN")
	local BITSET0 = int_to_bitset(H4CNF_BS_GEN)
	BITSET0[#BITSET0-13] = value and 1 or 0
	H4CNF_BS_GEN = bitset_to_int(BITSET0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", H4CNF_BS_GEN)
end)

cph_menu_optional_preps:add_array_item("运货卡车位置", {"未设置", "小机场", "北码头", "主码头东", "主码头西", "豪宅"}, function()
	return stats.get_int("MP"..get_last_mp_char().."_H4CNF_TROJAN")+1
end, function(value)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_TROJAN", value-1)
end)

cph_menu_reset_prep = cph_menu_root:add_submenu("重置前置任务")
cph_menu_reset_prep:add_int_range("你是否确定要为角色重置前置任务？", 1, 0, 1, function()
	return get_last_mp_char()
end, function(value) end)

cph_menu_reset_all = cph_menu_root:add_submenu("重置佩里科岛抢劫任务")
cph_menu_reset_all:add_int_range("你是否确定要为角色重置佩里科岛抢劫任务？", 1, 0, 1, function()
	return get_last_mp_char()
end, function(value) end)

for i=1, 6, 1 do
	cph_menu_reset_prep:add_action("否", function() end)
	cph_menu_reset_all:add_action("否", function() end)
end

cph_menu_reset_prep:add_action("是 - 重置前置任务", function()
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_WEAPONS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_ABIL", 0)
end)

cph_menu_reset_all:add_action("是 - 重置佩里科岛抢劫任务", function()
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_ABIL", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_WEAPONS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4_MISSIONS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4_PROGRESS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4_PLAYTHROUGH_STATUS", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_APPROACH", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_ENTR", 0)
	stats.set_int("MP"..get_last_mp_char().."_H4CNF_BS_GEN", 0)
end)

for i=1, 3, 1 do
	cph_menu_reset_prep:add_action("否", function() end)
	cph_menu_reset_all:add_action("否", function() end)
end

-- from beholdmystuff/perico-stattext-maker

-- $MPx_H4CNF_BS_GEN
-- grappling hooks
-- (bits are left shift value)
-- int 1, bit 0 https://i.imgur.com/i9PpBqb.jpeg
-- int 2, bit 1 https://i.imgur.com/XnTJNZ0.jpeg
-- int 4, bit 2 https://i.imgur.com/mD1CnIH.jpg
-- int 8, bit 3 https://i.imgur.com/DIRqJeO.jpeg

-- guard clothes
-- int 16, bit 4 https://i.imgur.com/TOToYmD.jpg
-- int 32, bit 5 https://i.imgur.com/F5QICaa.jpg
-- int 64, bit 6 https://i.imgur.com/o7ybn3e.jpeg
-- int 128, bit 7 https://i.imgur.com/TnmehzB.jpeg

-- bolt cutters
-- int 256, bit 8 https://i.imgur.com/vp2dZ8h.jpg
-- int 512, bit 9 https://i.imgur.com/uDVoRVY.jpg
-- int 1024, bit 10 https://i.imgur.com/nRQUIAb.jpg
-- int 2048, bit 11 https://i.imgur.com/quloOFA.jpg

-- suppressors
-- int 4096, bit 12

-- cutting powder
-- int 8192, bit 13

-- power station
-- int 16384, bit 14 https://i.imgur.com/BwTegxb.jpg

-- supply truck
-- int 32768, bit 15 https://i.imgur.com/vScO6P8.jpg

-- control tower
-- int 65536, bit 16 https://i.imgur.com/XZ6WiHV.jpg

-- /* COMPOUND BITS
-- blank map https://i.imgur.com/IVqpjU3.jpg

-- secondary loot
-- int 1, bin 0, north a https://i.imgur.com/zANJYuc.jpg
-- int 2, bin 1, north b https://i.imgur.com/hnKHMbi.jpeg
-- int 4, bin 2, central a https://i.imgur.com/Q01PQfz.jpg
-- int 8, bin 3, central b https://i.imgur.com/4nYIRQ3.jpg
-- int 16, bin 4, south a https://i.imgur.com/p081Qi6.jpeg
-- int 32, bin 5, south b https://i.imgur.com/B6l1wwj.jpg
-- int 64, bin 6, basement a https://i.imgur.com/RqN3oUG.jpg
-- int 128, bin 7, basement b https://i.imgur.com/dfzSX6o.jpg

-- painting
-- int 1, bin 0, north https://i.imgur.com/IIHw0t9.jpeg
-- int 2, bin 1, central https://i.imgur.com/kxM1IX2.jpg
-- int 3, bin 2, south https://i.imgur.com/eGCAnx6.jpg
-- int 4, bin 3, office a https://i.imgur.com/8iYo4y5.jpg
-- int 5, bin 4, office b https://i.imgur.com/UPMedAW.jpeg
-- int 6, bin 5, basement a https://i.imgur.com/Lg06n2R.jpg
-- int 7, bin 6, basement b https://i.imgur.com/Qdbk18Y.jpg
-- */


-- /* ISLAND BITS
-- ref https://i.imgur.com/ccAahxj.jpg
-- hangar
-- int 1, bin 0, https://i.imgur.com/jPs2gQs.jpg
-- int 2, bin 1, https://i.imgur.com/nKRx1lp.jpeg
-- int 4, bin 2, https://i.imgur.com/e2qPz3q.jpeg
-- int 8, bin 3, https://i.imgur.com/mFkJmLm.jpeg

-- airstrip
-- int 16, bin 4 https://i.imgur.com/iFkXVzB.jpeg
-- int 32, bin 5, https://i.imgur.com/huQWq9L.jpeg

-- north dock
-- int 64, bin 6, https://i.imgur.com/JTWhO37.jpeg
-- int 128, bin 7, https://i.imgur.com/gSgPWzL.jpg

-- int 256, bin 8, https://i.imgur.com/jqzNjhY.jpg
-- int 512, bin 9, https://i.imgur.com/HMKaDGd.jpeg
-- int 1024, bin 10 https://i.imgur.com/i5aVuuR.jpg

-- int 2048, bin 11 https://i.imgur.com/Wwadzhm.jpeg
-- int 4096, bin 12 https://i.imgur.com/UkHrpkP.jpeg

-- weed farm
-- int 8192, bin 13 https://i.imgur.com/zgfeofw.jpg
-- int 16384, bin 14 https://i.imgur.com/c3wgI6J.jpeg

-- central shed
-- int 32768, bin 15, https://i.imgur.com/RDTQruY.jpeg
-- int 65536, bin 16, https://i.imgur.com/fX08CoH.jpeg

-- main dock east shed
-- int 131072, bin 17, https://i.imgur.com/jys5OaO.jpg
-- int 262144, bin 18, https://i.imgur.com/uiIYmOS.jpg

-- main dock large shed
-- 524288, bin 19, https://i.imgur.com/L8NW8QC.jpg
-- 1048576, bin 20, https://i.imgur.com/AoCoRQ0.jpeg
-- 2097152, bin 21, https://i.imgur.com/qGcwBvn.jpg

-- main dock west shed
-- 4194304, bin 22, https://i.imgur.com/ivsNPQH.jpg
-- 8388608, bin 23, https://i.imgur.com/9sqxEql.jpg
-- */


