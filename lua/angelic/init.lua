vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.path:append({ "**" })
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c")
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 600
vim.opt.title = true
vim.opt.updatetime = 1000
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ruler = false
vim.opt.smarttab = true
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.equalalways = false
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.formatoptions:append({ "r" })
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.shell = "zsh"
vim.opt.belloff = "all"
vim.g.mapleader = " "

local colors = require("angelic.colors")
local config = require("angelic.config")
local utils = require("angelic.utils")
local bufferline = require("angelic.integrations.bufferline")
local cmp = require("angelic.integrations.cmp")
local theme = {} -- teste

local function set_terminal_colors()
	vim.g.terminal_color_0 = colors.bg
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_3 = colors.yellowDark
	vim.g.terminal_color_4 = colors.greenLight
	vim.g.terminal_color_5 = colors.purple
	vim.g.terminal_color_6 = colors.primary
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.fgInactive
	vim.g.terminal_color_9 = colors.redDark
	vim.g.terminal_color_10 = colors.orangeLight
	vim.g.terminal_color_11 = colors.orange
	vim.g.terminal_color_12 = colors.symbol
	vim.g.terminal_color_13 = colors.red
	vim.g.terminal_color_14 = colors.orangeLight
	vim.g.terminal_color_15 = colors.comment
	vim.g.terminal_color_background = colors.bg
	vim.g.terminal_color_foreground = colors.fg
end

local function set_groups()
	for color, hex in pairs(config.palette_overrides) do
		colors[color] = hex
	end

	local bg = config.transparent and "NONE" or colors.bg
	local diff_add = utils.shade(colors.green, 0.5, colors.bg)
	local diff_delete = utils.shade(colors.red, 0.5, colors.bg)
	local diff_change = utils.shade(colors.orange, 0.5, colors.bg)
	local diff_text = utils.shade(colors.symbol, 0.5, colors.bg)

	local groups = {
		-- base
		LineNr = { fg = colors.fgLineNr },
		ColorColumn = { bg = utils.shade(colors.primary, 0.5, colors.bg) },
		Conceal = {},
		Cursor = { fg = colors.bg, bg = colors.fg },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = colors.bgOption },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = colors.green },
		DiffAdd = { bg = bg, fg = diff_add },
		DiffChange = { bg = bg, fg = diff_change },
		DiffDelete = { bg = bg, fg = diff_delete },
		DiffText = { bg = bg, fg = diff_text },
		EndOfBuffer = { fg = colors.purple },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = colors.error },
		SignColumn = { link = "Normal" },
		Folded = { fg = colors.fg, bg = colors.bgDarker },
		FoldColumn = { link = "SignColumn" },
		IncSearch = { bg = utils.shade(colors.orange, 0.90, colors.bg), fg = colors.bgDarker },
		Substitute = { link = "IncSearch" },
		CursorLineNr = { fg = colors.white },
		MatchParen = { fg = colors.primary, bg = bg },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		-- MsgSeparator = {},
		MoreMsg = { fg = colors.greenLight },
		NonText = { fg = utils.shade(colors.bg, 0.30) },
		NormalNC = { link = "Normal" },
		PmenuSel = { bg = colors.bgOption },
		PmenuSbar = { bg = utils.shade(colors.greenLight, 0.5, colors.bg) },
		PmenuThumb = { bg = utils.shade(colors.bg, 0.20) },
		Question = { fg = colors.greenLight },
		QuickFixLine = { fg = colors.greenLight },
		SpecialKey = { fg = colors.symbol },
		StatusLine = { fg = colors.fg, bg = bg },
		StatusLineNC = { fg = colors.fgInactive, bg = colors.bgDark },
		TabLine = { bg = colors.bgDark, fg = colors.fgInactive },
		TabLineFill = { link = "TabLine" },
		TabLineSel = { bg = colors.bg, fg = colors.fgAlt },
		Search = { link = "IncSearch" },
		SpellBad = { undercurl = true, sp = colors.primary },
		SpellCap = { undercurl = true, sp = colors.greenLight },
		SpellLocal = { undercurl = true, sp = colors.purple },
		SpellRare = { undercurl = true, sp = colors.orange },
		Title = { fg = colors.greenLight },
		Visual = { bg = utils.shade(colors.bgDarker, 0.70) },
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = colors.warn },
		Whitespace = { fg = colors.symbol },
		WildMenu = { bg = colors.bgOption },
		Comment = { fg = colors.comment, italic = config.italics.comments or false },

		Constant = { fg = colors.white },
		String = { fg = colors.green, italic = config.italics.strings or false },
		Character = { fg = colors.green },
		Number = { fg = colors.secondary, bold = true },
		Boolean = { fg = colors.greenLight },
		Float = { link = "Number" },

		Identifier = { fg = colors.fg },
		Function = { fg = colors.purple },
		Method = { fg = colors.purple },
		Property = { fg = colors.greenLight },
		Field = { link = "Property" },
		Parameter = { fg = colors.fg },
		Statement = { fg = colors.primary },
		Conditional = { fg = colors.primary },
		-- Repeat = {},
		Label = { fg = colors.greenLight },
		Operator = { fg = colors.primary },
		Keyword = { link = "Statement", italic = config.italics.keywords or false },
		Exception = { fg = colors.purple },

		PreProc = { link = "Keyword" },
		-- Include = {},
		Define = { fg = colors.purple },
		Macro = { link = "Define" },
		PreCondit = { fg = colors.primary },

		Type = { fg = colors.fg },
		Struct = { link = "Type" },
		Class = { link = "Type" },

		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Attribute = { fg = colors.primary },
		Punctuation = { fg = colors.symbol },
		Special = { fg = colors.symbol },

		SpecialChar = { fg = colors.orangeLight },
		Tag = { fg = colors.orange },
		Delimiter = { fg = colors.symbol },
		-- SpecialComment = {},
		Debug = { fg = colors.purpleDark },

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = colors.bg },
		Error = { link = "ErrorMsg" },
		Todo = { fg = colors.orange, bold = true },

		-- LspReferenceText = {},
		-- LspReferenceRead = {},
		-- LspReferenceWrite = {},
		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		-- LspSignatureActiveParameter = {},

		DiagnosticError = { link = "Error" },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticErrorLn = { fg = colors.error, bg = utils.shade(colors.error, 0.5, colors.bg) },
		DiagnosticWarnLn = { fg = colors.warn, bg = utils.shade(colors.warn, 0.5, colors.bg) },
		DiagnosticInfoLn = { fg = colors.info, bg = utils.shade(colors.info, 0.5, colors.bg) },
		DiagnosticHintLn = { fg = colors.hint, bg = utils.shade(colors.hint, 0.5, colors.bg) },
		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
		DiagnosticUnderlineError = { undercurl = true, link = "DiagnosticError" },
		DiagnosticUnderlineWarn = { undercurl = true, link = "DiagnosticWarn" },
		DiagnosticUnderlineInfo = { undercurl = true, link = "DiagnosticInfo" },
		DiagnosticUnderlineHint = { undercurl = true, link = "DiagnosticHint" },
		-- DiagnosticFloatingError = {},
		-- DiagnosticFloatingWarn = {},
		-- DiagnosticFloatingInfo = {},
		-- DiagnosticFloatingHint = {},
		-- DiagnosticSignError = {},
		-- DiagnosticSignWarn = {},
		-- DiagnosticSignInfo = {},
		-- DiagnosticSignHint = {},

		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		["@text"] = { fg = colors.fg },
		["@texcolors.literal"] = { link = "Property" },
		-- ["@texcolors.reference"] = {},
		["@texcolors.strong"] = { link = "Bold" },
		["@texcolors.italic"] = { link = "Italic" },
		["@texcolors.title"] = { link = "Keyword" },
		["@texcolors.uri"] = { fg = colors.green, sp = colors.green, underline = true },
		["@texcolors.underline"] = { link = "Underlined" },
		["@symbol"] = { fg = colors.symbol },
		["@texcolors.todo"] = { link = "Todo" },
		["@comment"] = { link = "Comment" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = colors.primary },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.separator.keyvalue"] = { fg = colors.primary },

		["@texcolors.diff.add"] = { fg = colors.green },
		["@texcolors.diff.delete"] = { fg = colors.redDark },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constancolors.builtin"] = { link = "Keyword" },
		-- ["@constancolors.macro"] = {},
		-- ["@define"] = {},
		-- ["@macro"] = {},
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = utils.shade(colors.yellowDark, 0.45) },
		["@string.special"] = { fg = utils.shade(colors.yellowDark, 0.45) },
		["@string.special.url"] = { underline = true },
		-- ["@character"] = {},
		-- ["@character.special"] = {},
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		-- ["@float"] = {},
		["@function"] = { link = "Function", italic = config.italics.functions or false },
		["@function.call"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		-- ["@function.macro"] = {},
		["@parameter"] = { link = "Parameter" },
		["@method"] = { link = "Function" },
		["@field"] = { link = "Property" },
		["@property"] = { fg = colors.orange },
		["@constructor"] = { fg = colors.primary },
		-- ["@conditional"] = {},
		-- ["@repeat"] = {},
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = { fg = colors.white, italic = config.italics.variables or false },
		["@variable.builtin"] = { fg = colors.white, italic = config.italics.variables or false },
		["@type"] = { fg = colors.orange },
		["@type.definition"] = { fg = colors.fg },
		["@type.builtin"] = { fg = colors.orange },
		["@type.qualifier"] = { fg = colors.orange },
		["@keyword"] = { link = "Keyword" },
		-- ["@storageclass"] = {},
		-- ["@structure"] = {},
		["@namespace"] = { link = "Type" },
		["@annotation"] = { link = "Label" },
		-- ["@include"] = {},
		-- ["@preproc"] = {},
		["@debug"] = { fg = colors.purpleDark },
		["@tag"] = { link = "Tag" },
		["@_tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.primary },
		["@tag.attribute"] = { fg = colors.primary },
		["@attribute"] = { link = "Attribute" },
		["@error"] = { link = "Error" },
		["@warning"] = { link = "WarningMsg" },
		["@info"] = { fg = colors.green },
		["@markup.link.label"] = { underline = false },
		["@none"] = { fg = colors.white },

		-- Specific languages
		-- overrides
		["@label.json"] = { fg = colors.property }, -- For json
		["@label.help"] = { link = "@texcolors.uri" }, -- For help files
		["@texcolors.uri.html"] = { underline = true }, -- For html

		-- semantic highlighting
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@text" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@label" },
		["@lsp.type.decorator"] = { link = "@label" },
		["@lsp.typemod.function.declaration"] = { link = "@function" },
		["@lsp.typemod.function.readonly"] = { link = "@function" },

		-- PHP/Laravel específico
		["@constructor.php"] = { fg = "#FF79C6", italic = false }, -- Rosa suave para clases
		["@method.php"] = { fg = colors.greenLight, italic = true }, -- Métodos (definition)
		["@function.builtin.php"] = { fg = colors.orange }, -- fake()
		["@property.php"] = { fg = colors.symbol }, -- $password
		["@string.php"] = { fg = colors.string }, -- Strings
		["@operator.php"] = { fg = colors.operator }, -- // =>
		["@comment.php"] = { fg = colors.comment, italic = true }, -- Comentarios
		["@keyword.php"] = { fg = "#FF79C6", italic = true }, -- Palabras reservadas en rosa
		["@type.php"] = { fg = "#BD93F9" }, -- Morado para tipos (Factory)
		["@type.qualifier.php"] = { fg = colors.type_purple }, -- Para 'extends'
		["@punctuation.bracket.php"] = { fg = colors.fg }, -- Color normal para { }

		-- Fondo más oscuro para áreas de código
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { bg = "#1A1A1A" }, -- Ventanas flotantes
		Pmenu = { bg = "#1A1A1A" }, -- Menú de autocompletado
	}

	-- integrations
	groups = vim.tbl_extend("force", groups, cmp.highlights())

	-- overrides
	groups =
		vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

function theme.setup(user_config)
	-- 1. Crea copia profunda de los defaults para evitar modificaciones accidentales
	local defaults = vim.deepcopy(config.defaults)

	-- 2. Mezcla segura de configuraciones (maneja nil y tablas anidadas)
	config = setmetatable({}, {
		__index = vim.tbl_deep_extend("force", defaults, user_config or {}),
	})

	-- 3. Configuración de bufferline (con validación)
	theme.bufferline = {
		highlights = bufferline.highlights(config),
	}
end

function theme.colorscheme()
	if vim.version().minor < 8 then
		vim.notify("Neovim 0.8+ is required for angelic colorscheme", vim.log.levels.ERROR, { title = "Min Theme" })
		return
	end

	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
	vim.o.termguicolors = true
	vim.g.colors_name = "angelic"

	set_terminal_colors()
	set_groups()
end

vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1A1A1A" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#7F7F7F", bg = colors.bg })
vim.api.nvim_set_hl(0, "@type.definition.php", { fg = "#FF79C6" })
vim.api.nvim_set_hl(0, "@type.class.php", { fg = "#FF79C6" })
vim.api.nvim_set_hl(0, "phpRegion", { fg = "#FF79C6", bold = false }) -- Rosa suave para clases

local lazypath = vim.fn.stdpath("data") .. "/development/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>gg", ":Neogit<Return>", { noremap = true, silent = true })

-- Configuración del tema
theme.setup({
	transparent = false,
	italics = {
		comments = false,
		keywords = true,
		functions = true,
		strings = false,
		variables = true,
	},
})

-- Aplicar el tema
theme.colorscheme()

-- Configuración de Treesitter (debe ir después de cargar el tema)
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		custom_captures = {
			["constructor.php"] = "@constructor.php",
			["type.php"] = "@type.php",
		},
	},
})

return theme
