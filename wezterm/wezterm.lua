local wezterm = require("wezterm")
local config = wezterm.config_builder()

local config_directory = os.getenv("HOME") .. "/.config/wezterm/"

config.scrollback_lines = 65536

config.font_size = 18.2
config.color_scheme = "Gruvbox dark, medium (base16)"

config.initial_rows = 12
config.window_padding = {
	left = 5,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.font = wezterm.font("SauceCodePro NF", { weight = "Regular", italic = false })

-- config.window_background_opacity = 0.5

config.enable_scroll_bar = true
config.min_scroll_bar_height = "1cell"

config.background = {
	{
		source = {
			File = config_directory .. "/background.png",
		},
		hsb = {
			brightness = 0.15,
		},
	},
}

-- this is a really janky way of doing this
--
-- when a fullscreen app is open, like nvim or btop or something, disable the
-- scrollbar

local fullscreen_apps = {
	"nvim",
	"btop",
	"less",
	"lazygit",
	"cmatrix",
	"tmux", -- the scrollbar doesn't work in tmux

	-- man registers as bash
	-- "man",
}

wezterm.on("update-status", function(window, pane)
	local process_name = pane:get_foreground_process_name() or ""
	-- Extract just the process name (ignore full path)
	process_name = process_name:match("([^/]+)$") or process_name

	local is_fullscreen_app = false

	for i = 1, #fullscreen_apps do
		if fullscreen_apps[i] == process_name then
			is_fullscreen_app = true
			break
		end
	end

	window:set_config_overrides({
		enable_scroll_bar = not is_fullscreen_app,
	})
end)

--config.hide_tab_bar_if_only_one_tab = true

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	position = "top",
	modules = {
		workspace = {
			enabled = false,
		},
		leader = {
			enabled = false,
		},
		-- hostname = {
		-- 	enabled = false,
		-- },
		clock = {
			enabled = false,
		},
		cwd = {
			enabled = false,
		},
	},
})

config.window_decorations = "RESIZE"

return config
