return {
	require("plugins.servers.mason"),
	require("plugins.servers.installer"),
	require("plugins.servers.cmps"),
	require("plugins.servers.lsp"),
	require("plugins.servers.dap"),
	require("plugins.servers.linter"),
	require("plugins.servers.format"),
	require("plugins.servers.treesitter"),
	-- require("plugins.servers.java"), -- only for java
}
