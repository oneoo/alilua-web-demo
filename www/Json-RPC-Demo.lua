local apis = {
	demo = { -- json-rpc v2.0
		hello = function(a, b)
			return a+b
		end,
	},
	hello = function(a, b) -- json-rpc v1.0
		return a+b
	end,
}

jsonrpc_handle(json_decode(get_post_body()), apis)