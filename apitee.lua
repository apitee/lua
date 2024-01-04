local lyaml = require('lyaml')
local posix = require('posix')

-- Read YAML file into a string
local function read_yaml_file(file_path)
    local file = io.open(file_path, "r")
    assert(file, "Could not open the YAML file.")
    local yaml_content = file:read("*all")
    file:close()
    return yaml_content
end

-- Parse YAML string to a Lua table
local function parse_yaml(yaml_content)
    return lyaml.load(yaml_content)
end

-- Execute shell command
local function execute_command(command)
    print("Executing command: " .. command)
    posix.system(command)
end

-- Execute the commands from a list
local function execute_command_list(commands)
    for _, command in ipairs(commands) do
        execute_command(command)
    end
end


-- Reads the contents from the specified file path
local function read_file_content(file_path)
    local file = io.open(file_path, "r")
    if not file then
        error("Cannot read file: " .. file_path)
    end
    local content = file:read("*all")
    file:close()
    return content
end

-- Main execution function
local function main()
        -- Get the file path from the command-line argument
    local yaml_file_path = arg[1]
    
    -- Check if the file path was provided
    if not yaml_file_path then
        print("Usage: lua your_script.lua <path-to-yaml-file>")
        os.exit(1)  -- Exit the script with an error code
    end

    -- Read and parse the YAML file
    local yaml_string = read_file_content(yaml_file_path)
    local yaml_data = lyaml.load(yaml_string)
    
    -- Process the loaded YAML data as needed
    local yaml_content = read_yaml_file(yaml_file_path)
    local yaml_table = parse_yaml(yaml_content)

    if yaml_table.RUN then
        for context, command_lists in pairs(yaml_table.RUN) do
            print("Executing context: " .. context)
            for section, commands in pairs(command_lists) do
                if type(commands) == 'table' then
                    print("Section: " .. section)
                    execute_command_list(commands)
                else
                    execute_command(commands)
                end
            end
        end
    else
        error("Invalid YAML format: 'RUN' key expected.")
    end
end


main()
