local M = {}

function M.convertKeys(keyTable, parentKey, inheritedOpts)
	local result = {}
	inheritedOpts = inheritedOpts or {}

	-- Special handling for root-level group description
	if not parentKey then
		for key, spec in pairs(keyTable) do
			if type(spec) == "table" and spec.desc then
				local group_keymap = {
					key,
					"",
					desc = spec.desc,
				}
				-- -- Include other root-level options
				-- for opt, val in pairs(spec) do
				-- 	if opt ~= "desc" and opt ~= "cmd" then
				-- 		group_keymap[opt] = val
				-- 	end
				-- end
				table.insert(result, group_keymap)
			end
		end
	end

	for key, spec in pairs(keyTable) do
		if type(spec) == "table" then
			-- Merge options with inheritance
			local opts = vim.tbl_extend("keep", {
				desc = spec.desc,
				mode = spec.mode,
				buffer = spec.buffer,
				noremap = spec.noremap,
				silent = spec.silent,
				expr = spec.expr,
				nowait = spec.nowait,
				script = spec.script,
				unique = spec.unique,
				replace_keycodes = spec.replace_keycodes,
				callback = spec.callback,
				ft = spec.ft,
			}, inheritedOpts)

			-- Clean nil values
			for k, v in pairs(opts) do
				if v == nil then
					opts[k] = nil
				end
			end

			if spec.cmd then
				-- Leaf node - create flat keymap entry
				local keymap = {
					parentKey and (parentKey .. key) or key,
					spec.cmd,
				}
				-- Add all options as top-level fields
				for opt, val in pairs(opts) do
					keymap[opt] = val
				end
				table.insert(result, keymap)
			else
				-- Group node - process recursively
				vim.list_extend(result, M.convertKeys(spec, parentKey and (parentKey .. key) or key, opts))

				-- Add group description as flat keymap
				if spec.desc and parentKey then
					local group_keymap = {
						parentKey and (parentKey .. key) or key,
						"",
					}
					for opt, val in pairs(opts) do
						group_keymap[opt] = (opt == "desc") and spec.desc or val
					end
					table.insert(result, group_keymap)
				end
			end
		end
	end

	return result
end

return M
