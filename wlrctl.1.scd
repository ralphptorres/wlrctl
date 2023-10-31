wlrctl(1)

# NAME

wlrctl - A command line utility for miscellaneous wlroots extensions

# SYNOPSIS

wlrctl [options...] [command]

# OPTIONS

*-h, --help*
	Show a help message and quit.

*-v, --version*
	Show the wlrctl version and quit.

# COMMANDS

*keyboard* <action>
	Use a virtual keyboard.

*pointer* <action>
	Use a virtual pointer device.

*window|toplevel* <action>
	Use the foreign toplevel interface.

*output* { <action> | <identifier> [config_action] }
	Use the output management interface.

# KEYBOARD ACTIONS

*type* <string> [modifiers ...]
	Send a string to be typed into the focused client

	*modifiers* <SHIFT,CTRL,ALT,SUPER>
	Comma-separated list of modifiers that will be depressed on the
	virtual keyboard while string is being typed.

# POINTER ACTIONS

*click* [button]
	Click a mouse button. If unspecified, clicks the default (left) button.

*move* <dx> <dy>
	Move the cursor. _dx_ is the displacement in positive-right direction,
	_dy_ is the displacement in the positive-downward direction. Negative
	numbers are allowed. Units are pixels.

*scroll* <dy> <dx>
	Scroll the cursor. _dy_ is the amount of vertical scroll, _dx_ is the
	amount of horizontal scroll. Negative numbers are allowed.

# TOPLEVEL ACTIONS

*minimize* [matches...]
	Instruct the compositor to minimize matching windows.

*maximize* [matches...]
	Instruct the compositor to maximize matching windows.

*fullscreen* [matches...]
	Instruct the compositor to fullscreen matching windows.

*focus* [matches...]
	Instruct the compositor to focus matching windows.

*close* [matches...]
	Instruct the compositor to close matching windows.

*find* [matches...]
	Exit with a successful return code iff there is at least one window
	matching the provided criteria.

*wait* [matches...]
	Wait to return a successful return code until all the matching windows
	have closed. If there are no matches, exit with a failing return code
	immediately.

*waitfor* [matches...]
	Wait to return a successful return code until there is at least one
	window that matches the requested criteria.

# OUTPUT ACTIONS

*list*
	List the names of all known outputs

# TOPLEVEL MATCHSPEC

A match is a colon separated attribute/value pair. e.g. To match a firefox
window, a suitable match value is _app\_id:firefox_. You may give any number of
match specifiers, and a window must match all of them to be considered. If the
app\_id or title keys are specified more than once, a window may match any of
the given values. Otherwise later key value pairs override previous ones. A
match without a key is assumed to be an app_id, so just _firefox_ works in the
example above.

Currently supported attributes are: _app_id_, _title_, and _state_.

Supported state values are: _maximized_, _minimized_, _active_, and
_fullscreen_, and their negations: _unmaximized_, _unminimized_, _inactive_,
and _unfullscreen_.  You can also use a '-' prefix, for example
_state:-fullscreen_.

# AUTHOR

Written by Ronan Pigott <rpigott@berkeley.edu>
