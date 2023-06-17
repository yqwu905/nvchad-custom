local utils = {}

utils.runner = {
    c = function()
        return "clang -o a.exe " .. vim.fn.expand "%" .. " && .\\a.exe"
    end,
    cpp = function()
        return "clang++ -std=c++11 -o a.exe " .. vim.fn.expand "%" .. " && .\\a.exe"
    end,
    python = function()
        return "python " .. vim.fn.expand "%"
    end,
    tcl = function()
        return "tclsh " .. vim.fn.expand "%"
    end,
    rust = function()
        return "cargo run"
    end,
    sh = function()
        return "bash " .. vim.fn.expand "%"
    end,
}

function utils.async_run_code()
    local function is_run_script(path)
        return string.match(path, "_nvim_run_?.*%.ps1")
    end
    local run_scripts = {}
    for file in vim.fs.dir(vim.fn.getcwd()) do
        if is_run_script(file) then
            table.insert(run_scripts, file)
        end
    end
    if #run_scripts > 0 then
        if #run_scripts == 1 then
            require("toggleterm").exec(".\\" .. run_scripts[1] .. " " .. vim.fn.expand "%:t")
        else
            vim.ui.select(run_scripts, {
                prompt = "Choose run script",
                format_item = function(item)
                    local name = string.match(item, "_nvim_run_?(.*)%.ps1")
                    if #name == 0 then
                        return "Default"
                    end
                    return name
                end,
            }, function(choice)
                if choice == nil then
                    vim.notify "Abort run"
                    return
                end
                require("toggleterm").exec(".\\" .. choice .. " " .. vim.fn.expand "%:t")
            end)
        end
    elseif utils.runner[vim.bo.filetype] ~= nil then
        require("toggleterm").exec(utils.runner[vim.bo.filetype]())
    else
        vim.notify("No nvim_run script and no default runner", vim.log.levels.ERROR)
    end
end

return utils
