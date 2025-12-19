local M = {}

local utils = require("orgmode.utils")
local api = require("orgmode.api")
local orgmode = require("orgmode")

local function cycle_lite()
	local org = orgmode.instance()
	if not org or not org.files then
		return
	end

	local file = org.files:get_current_file()
	if not file then
		return
	end

	local line = vim.fn.line(".")

	-- ensure folding is enabled
	if not vim.wo.foldenable then
		vim.wo.foldenable = true
		vim.cmd([[silent! norm! zx]])
	end

	local text = vim.fn.getline(line)

	-- handle drawers (:PROPERTIES: etc.)
	if text:match("^%s*:[^:]*:%s*$") then
		return vim.cmd([[silent! norm! za]])
	end

	local section = file:get_closest_headline_or_nil({ line, 0 })

	-- if no headline, just toggle the fold if it exists
	if not section then
		if vim.fn.foldlevel(line) > 0 then
			vim.cmd([[silent! norm! za]])
		else
			utils.echo_info("No fold")
		end
		return
	end

	-- headline exists
	if vim.fn.foldclosed(line) == -1 then
		-- line is open → close it
		vim.cmd([[silent! norm! zc]])
	else
		-- line is closed → open it
		vim.cmd([[silent! norm! zo]])
	end
end

function M.setup(opts)
	opts = opts or {}
	local key = opts.keymap or "<TAB>"

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "org",
		callback = function()
			vim.keymap.set("n", key, function()
				require("org-cycle-lite").cycle()
			end, { buffer = true, silent = true })
		end,
	})
end

M.cycle = cycle_lite
return M
