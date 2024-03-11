local utils = require("utils")
local key = require("keys")
local ui = require("ui")

local other_opts = {
	use_ime = true,
	check_for_updates_interval_seconds = 30 * 24 * 60 * 60,
}
return utils.merge({ other_opts, key, ui })
