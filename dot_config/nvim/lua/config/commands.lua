vim.api.nvim_create_user_command("CopyPath", function()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local file_path = vim.fn.expand("%:p")
  local path_to_copy = file_path

  if vim.v.shell_error == 0 then
    path_to_copy = file_path:sub(#git_root + 2)
  end

  vim.fn.setreg("+", path_to_copy)
  print("Copied: " .. path_to_copy)
end, {})

vim.api.nvim_create_user_command("EditProjects", function()
  vim.cmd("edit " .. vim.fn.expand("~/.local/share/nvim/project_nvim/project_history"))
end, {})

vim.api.nvim_create_user_command("WslView", function()
  local file_folder = vim.fn.expand("%:p:h")
  vim.fn.system("wslview " .. file_folder)
end, {})

vim.api.nvim_create_user_command("SyncLazyVimJson", function()
  vim.fn.system("cp ~/.config/nvim/lazyvim.json ~/.local/share/chezmoi/dot_config/nvim/lazyvim.json")
end, {})

vim.api.nvim_create_user_command("SwitchIMSFileType", function()
  local file_dir = vim.fn.expand("%:p:h")
  local file_name = vim.fn.expand("%:t")
  local file_ext = vim.fn.expand("%:e")

  local types = { "js2", "html2", "css2" }
  local ext_map = {
    js2 = { ".es6.js", ".mjs", ".js" },
    html2 = { ".html" },
    css2 = { ".css", ".scss" },
  }

  local ims_type = string.match(file_dir, "/webapp/(js2)/")
    or string.match(file_dir, "/webapp/(html2)/")
    or string.match(file_dir, "/webapp/(css2)/")

  if ims_type then
    local index = -1
    for i, t in ipairs(types) do
      if t == ims_type then
        index = i
        break
      end
    end
    if index == -1 then
      print("Unknown IMS type")
      return
    end
    local next_index = index % 3 + 1
    local next_type = types[next_index]
    local new_path = string.gsub(file_dir, "/" .. ims_type .. "/", "/" .. next_type .. "/")
    local exts = ext_map[next_type]
    for _, ext in ipairs(exts) do
      local target_file = new_path .. "/" .. string.gsub(file_name, "%." .. file_ext .. "$", ext)
      if vim.fn.filereadable(target_file) == 1 then
        vim.cmd("edit " .. target_file)
        return
      end
    end
    print("No matching file found for " .. next_type)
  else
    print("File not supported")
  end
end, {})

vim.api.nvim_create_user_command("CreateIMSPage", function()
  local dir = vim.fn.input("Enter page directory (slash creates sub directory):")

  if dir == "" then
    print("No directory provided. Aborting.")
    return
  end

  local page_name = vim.fn.input("Enter page name (without extension):")

  if page_name == "" then
    print("No page name provided. Aborting.")
    return
  end

  local ims_root = "~/develop/repos/mis/sw/ims/ims4/Web/src/main/webapp"

  local css2_path = vim.fn.expand(ims_root .. "/css2/fragments/" .. dir .. "/" .. page_name .. ".scss")
  local html2_path = vim.fn.expand(ims_root .. "/html2/fragments/" .. dir .. "/" .. page_name .. ".html")
  local js2_path = vim.fn.expand(ims_root .. "/js2/fragments/" .. dir .. "/" .. page_name .. ".mjs")

  vim.fn.mkdir(vim.fn.fnamemodify(css2_path, ":h"), "p")
  vim.fn.mkdir(vim.fn.fnamemodify(html2_path, ":h"), "p")
  vim.fn.mkdir(vim.fn.fnamemodify(js2_path, ":h"), "p")

  vim.fn.writefile({ "// SCSS fragment for " .. page_name }, css2_path)
  vim.fn.writefile({ "<!-- HTML fragment for " .. page_name .. " -->" }, html2_path)
  vim.fn.writefile({ "// JS fragment for " .. page_name }, js2_path)
end, {})
