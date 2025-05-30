local navic = require("nvim-navic")
local kind = require("rumman.lib.icons").kind
local type = require("rumman.lib.icons").type
local ui = require("rumman.lib.icons").ui

navic.setup({
	icons = {
        File          = kind.File,
        Module        = kind.Module,
        Namespace     = kind.Namespace,
        Package       = ui.Package,
        Class         = kind.Class,
        Method        = kind.Method,
        Property      = kind.Property,
        Field         = kind.Field,
        Constructor   = kind.Constructor,
        Enum          = kind.Enum,
        Interface     = kind.Interface,
        Function      = kind.Function,
        Variable      = kind.Variable,
        Constant      = kind.Constant,
        String        = type.String,
        Number        = type.Number,
        Boolean       = type.Boolean,
        Array         = type.Array,
        Object        = type.Object,
        Key           = kind.Keyword,
        Null          = type.Null,
        EnumMember    = kind.EnumMember,
        Struct        = kind.Struct,
        Event         = kind.Event,
        Operator      = kind.Operator,
        TypeParameter = kind.TypeParameter,
	},
	lsp = {
		auto_attach = true,
	},
	separator = ui.ArrowBoldRight,
})

