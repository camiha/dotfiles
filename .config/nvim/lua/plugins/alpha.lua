local alpha = {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		-- ascii art by https://medium.com/@shaikzahid0713/alpha-start-up-screen-8e4a6e95804d
		dashboard.section.header.val = {
			[[]],
			[[]],
			[[]],
			[[          ▀████▀▄▄              ▄█ ]],
			[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
			[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
			[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
			[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
			[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
			[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
			[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
			[[   █   █  █      ▄▄           ▄▀   ]],
		}

		local function footer()
			return {
				[[         Don't feel as if the key to         ]],
				[[ successful computing is only in your hands. ]],
				[[]],
				[[                           -- Alan J. Perlis ]],
			}
		end

		dashboard.section.footer.val = footer()

		alpha.setup(dashboard.opts)
	end,
}

return { alpha }
