-- module table
textutils = {}

function textutils.format_text(format_str, values)
    --[[
        Formats a template string with values.

        :param format_str: Format template with {%d+} placeholders.
                           Example: {1}-{2}x{3}
        :type format_str: string

        :param values: Table/vector containing values to format by index.
                       Example: {1="foo", 2="bar", 3="man", 4="chu"}
        :type values: table

        :rtype: string
    ]]
    local formatted_string = format_str

    for part in string.gmatch(format_str, "{%d}+") do

        -- get part to format from index
        local index = string.match(part, "%d+")
        local repl = values[tonumber(index)]

        -- replace format by part
        if repl ~= nil then
            formatted_string = string.gsub(formatted_string, part, repl)
        end
    end

    return formatted_string
end

-- return module table
return textutils
