-- module table
textutils = {}

function textutils.to_fusion_text(text)
    --[[
        Casts a string to a Fusion builtin/supported Text type.

        :param text: Text to cast to Fusion text.
        :type text: string

        :rtype: Text
    ]]
    local fu_text = Text(text)
    return fu_text
end

function textutils.join(values, separator)
    --[[
        Joins an array of text with given separation character.

        :param values: String array to join.
        :type values: table[string]

        :param separator: Optional separation character, defaults to empty string.
        :type separator: string

        :rtype: string
    ]]
    local sep = separator or ""
    local joined = table.concat(values, sep)
    return joined
end

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

function textutils.len(text)
    --[[
        Returns the lenght of a string.

        :param text: Text to get length for.
        :type text: str

        :rtype: number
    ]]
    local length = string.len(text)
    return length
end

function textutils.sub(text, s, e)
    --[[
        Returns a substring of a string.

        :param text: String to take substring from.
        :type text: string

        :param s: Start position of the substring.
        :type s: number

        :param e: End position of the substring.
        :type e: number

        :rtype: string
    ]]
    local start_ = s or 1
    local end_ = e or -1
    local substring = string.sub(text, start_, end_)
    return substring
end

-- return module table
return textutils
