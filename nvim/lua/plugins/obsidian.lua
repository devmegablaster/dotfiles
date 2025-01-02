require("obsidian").setup({
	workspaces = {
		{
			name = "Vault",
			path = "/Users/ojastyagi/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
		},
	},
	ui = {
		enable = false,
	},
	daily_notes = {
		folder = "dailies",
	},
	templates = {
		folder = "Templates",
		date_format = "%Y-%m-%d-%a",
		time_format = "%H:%M",
	},
	disable_frontmatter = false,
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return os.date("%d%m%Y-%H%M%S") .. "-" .. suffix
	end,
})
