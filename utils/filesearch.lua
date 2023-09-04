local M = {}

function M.file_search_string(path, search)
  local file = io.open(path, "r")

  if file then
    local contents = file:read "*a"
    local finded = false

    if string.find(contents, search) then finded = true end

    file:close()
    return finded
  else
    return false
  end
end

return M
