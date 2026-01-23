local ok, autosave = pcall(require, "auto-save")
if not ok then return end

autosave.setup({
	execution_message = {
		message = function()
			return ""
		end,
		dim = 0.18,
		cleaning_interval = 1250,
	},
})
