return {
	"gerazov/toggle-bool.nvim",
	-- version = "*",
	-- event = { "BufReadPre", "BufReadPost" },
	keys = {
		{ "<leader>tt" },
	},
	config = function()
		require("toggle-bool").setup({
			mapping = "<leader>tt",
			additional_toggles = {
				left = "right",
				Yes = "No",
				On = "Off",
				["0"] = "1",
				Enable = "Disable",
				Enabled = "Disabled",
				First = "Last",
				Before = "After",
				Persistent = "Ephemeral",
				Internal = "External",
				Start = "Stop",
				In = "Out",
				Open = "Close",
				Enter = "Exit",
				Lock = "Unlock",
				Connect = "Disconnect",
				Mount = "Dismount",
				Import = "Export",
				Ingress = "Egress",
				Allow = "Deny",
				All = "None",
			},
		})
	end,
}
