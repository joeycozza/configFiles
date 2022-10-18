local function keymap( mode, lhs, rhs, opts )
  local options = { remap = false }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

local function printv(str)
  print(vim.inspect(str))
end

-- Split on / character:
--   local parts = utils.split(path, '([^/]+)')
local function split(inputStr, pattern)
  local parts = {}
  for part in string.gmatch(inputStr, pattern) do
    table.insert(parts, part)
  end
  return parts
end

local function splitOnSlash(inputStr)
  return split(inputStr, '([^/]+)')
end

local function smartTruncate(_, path)
  local pathLength = string.len(path)
  local maxLength = 115
  if pathLength > maxLength then
    local directoryNames = splitOnSlash(path)
    local fileName = directoryNames[#directoryNames]
    local letters = {}
    if string.len(fileName) > maxLength then
      return fileName
    end

    for index, dirName in ipairs(directoryNames) do
      local shifted = {unpack(directoryNames, index+1)}
      local short = table.concat(shifted, '/')
      table.insert(letters, string.sub(dirName, 1, 1))
      local smartShortPath = table.concat(letters, '/')..'/'..short
      if string.len(smartShortPath) < maxLength then
        return smartShortPath
      end
    end
  end
  return path
end

local function npmInfo()
  vim.api.nvim_exec('normal yi"', true)
  local packageName = vim.fn.getreg('"')
	local cmdString = "npm info " .. packageName
  require('FTerm').run(cmdString)
end


return {
  keymap = keymap,
  split = split,
  printv = printv,
  splitOnSlash = splitOnSlash,
  smartTruncate = smartTruncate,
  npmInfo = npmInfo,
}
