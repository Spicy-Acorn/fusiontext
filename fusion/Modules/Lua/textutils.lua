-- module table
textutils = {}

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

function textutils.format(format_str, values)
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

        :param s: Start position of the substring. Defaults to 1.
        :type s: number

        :param e: End position of the substring. Defaults to -1.
        :type e: number

        :rtype: string
    ]]
    local start_ = s or 1
    local end_ = e or -1
    local substring = string.sub(text, start_, end_)
    return substring
end

function textutils.replace(text, pattern, repl)
    --[[
        Replaces a substring of a string with given text.

        More info about patterns: http://lua-users.org/wiki/PatternsTutorial

        :param text: Text to replace substring of.
        :type text: string

        :param pattern: Pattern capturing the substring to replace.
        :type pattern: string

        :param repl: Text to replace the substring with.
        :type repl: string

        :rtype: string
    ]]
    local replaced = string.gsub(text, pattern, repl)
    return replaced
end

function textutils.lstrip(text, strip)
    --[[
        Removes the leading substring of a string.

        :param text: Text to strip from.
        :type text: string

        :param strip: Substring to strip.
        :type strip: string

        :rtype: string
    ]]
    local pattern = string.format("^%s", strip)
    local stripped = textutils.replace(text, pattern, "")
    return stripped
end

function textutils.rstrip(text, strip)
    --[[
        Removes the trailing substring of a string.

        :param text: Text to strip from.
        :type text: string

        :param strip: Substring to strip.
        :type strip: string

        :rtype: string
    ]]
    local pattern = string.format("%s$", strip)
    local stripped = textutils.replace(text, pattern, "")
    return stripped
end

-- return module table
return textutils
