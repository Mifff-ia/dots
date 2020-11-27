class util
  unload_lua_namespace: (prefix) ->
    prefix_with_dot = prefix .. '.'
    for key, value in pairs(package.loaded) do
      if key == prefix or key\sub(1, #prefix_with_dot) == prefix_with_dot then
        package.loaded[key] = nil
