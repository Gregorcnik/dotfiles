local function natural_sort(opts)
  -- Define the delimiters (add any others you want to support)
  local delimiters = "[,;|%s]+" -- Matches commas, semicolons, pipes, or spaces

  -- Determine the range: if no range is given, sort the whole file
  local start_line, end_line
  if opts.range == 0 then
    start_line = 1
    end_line = vim.api.nvim_buf_line_count(0)
  else
    start_line = vim.fn.line("'<")
    end_line = vim.fn.line("'>")
  end

  -- Get the lines from the buffer
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  -- Sort the lines using a custom sorting function
  table.sort(lines, function(a, b)
    local function split_to_numbers(line)
      local parts = {}
      for part in line:gmatch("[^" .. delimiters .. "]+") do
        table.insert(parts, tonumber(part) or math.huge)
      end
      return parts
    end

    local a_parts = split_to_numbers(a)
    local b_parts = split_to_numbers(b)

    -- Compare each column
    for i = 1, math.max(#a_parts, #b_parts) do
      local a_val = a_parts[i] or math.huge
      local b_val = b_parts[i] or math.huge
      if a_val ~= b_val then
        return a_val < b_val
      end
    end
    return false
  end)

  -- Replace the lines in the buffer with the sorted lines
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

-- Create a user command :naturalsort
vim.api.nvim_create_user_command("Naturalsort", natural_sort, { range = true })
