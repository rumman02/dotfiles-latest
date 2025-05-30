local jdtls = {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
}

local nvim_java = {
	"nvim-java/nvim-java",
	dependencies = {
        "mason-org/mason-lspconfig.nvim",
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"MunifTanjim/nui.nvim",
		"mfussenegger/nvim-dap",
		{
			"williamboman/mason.nvim",
			opts = {
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			},
		},
	},
	config = function()
		require("java").setup()
	end,
}

return {
	jdtls,
	-- nvim_java,
}
