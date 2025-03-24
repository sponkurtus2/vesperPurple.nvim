local config = require("vesper.config")
local mix = require("vesper.utils").mix

local colors = {
	-- background colors
	white = "#FFFFFF",
	black = "#0A0A0A",
	bg = "#0A0A0A", -- editor.background
	bgDark = "#0A0A0A", -- titleBar.activeBackground
	bgDarker = "#222222", -- list.activeSelectionBackground
	bgFloat = "#0A0A0A", -- editorWidget.background
	bgOption = "#222222", -- input.background

	-- foreground colors
	fg = "#DBD7CA", -- editor.foreground (sin alpha)
	fgAlt = "#BFBAAA", -- titleBar.activeForeground
	fgCommand = "#C391E6", -- focusBorder
	fgInactive = "#DEDCD5", -- activityBar.inactiveForeground (sin alpha)
	fgDisabled = "#DEDCD5", -- gitDecoration.ignoredResourceForeground
	fgLineNr = "#DEDCD5", -- editorLineNumber.foreground
	fgSelection = "#404040", -- editor.selectionBackground
	fgSelectionInactive = "#262626", -- editor.inactiveSelectionBackground

	-- border colors
	border = "#222222", -- dropdown.border
	borderFocus = "#C391E6", -- focusBorder
	borderDarker = "#222222", -- editorGroupHeader.tabsBorder

	-- ui colors
	greenLight = "#16A34A", -- terminal.ansiGreen
	red = "#FCA5A5", -- errorForeground
	purple = "#C391E6", -- button.background
	redDark = "#FCA5A5", -- terminal.ansiRed
	orange = "#EAB308", -- terminal.ansiYellow
	primary = "#C391E6", -- focusBorder (main accent color)
	comment = "#DEDCD5", -- descriptionForeground (sin alpha)
	orangeLight = "#F59E0B", -- terminal.ansiBrightYellow
	green = "#16A34A", -- gitDecoration.addedResourceForeground
	yellowDark = "#EAB308", -- terminal.ansiYellow
	purpleDark = "#C391E6", -- textLink.foreground
	symbol = "#06B6D4", -- terminal.ansiBrightCyan
	secondary = "#BFBAAA", -- statusBar.foreground
	terminalbrightblack = "#323232", -- terminal.ansiBlack

	-- diagnostic colors
	error = "#FCA5A5", -- editorError.foreground
	warn = "#F59E0B", -- editorWarning.foreground
	info = "#0369A1", -- editorInfo.foreground
	hint = "#16A34A", -- editorHint.foreground
}

return colors
