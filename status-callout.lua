-- status-callout.lua
-- Quarto Lua filter to insert a callout at the top of the document based on 'status' metadata
-- luacheck: globals pandoc

function Pandoc(doc)
    local status = doc.meta.status and pandoc.utils.stringify(doc.meta.status) or nil
    local callout = nil

    if status == "WIP" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[WIP] Work In Progress") } } },
            pandoc.Attr("", { "callout", "callout-warning" })
        )
    elseif status == "Done" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Done] Complete") } } },
            pandoc.Attr("", { "callout", "callout-success" })
        )
    elseif status == "Stale" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Stale] Needs Review") } } },
            pandoc.Attr("", { "callout", "callout-note" })
        )
    elseif status == "Dropped" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Dropped] No Longer Maintained") } } },
            pandoc.Attr("", { "callout", "callout-important" })
        )
    elseif status == "Draft" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Draft] Incomplete Notes") } } },
            pandoc.Attr("", { "callout", "callout-warning" })
        )
    elseif status == "Review" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Review] Needs Feedback") } } },
            pandoc.Attr("", { "callout", "callout-note" })
        )
    elseif status == "Archived" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Archived] Old Reference") } } },
            pandoc.Attr("", { "callout", "callout-note" })
        )
    elseif status == "Experimental" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Experimental] Unstable/Untested") } } },
            pandoc.Attr("", { "callout", "callout-warning" })
        )
    elseif status == "Reference" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Reference] Canonical Info") } } },
            pandoc.Attr("", { "callout", "callout-success" })
        )
    elseif status == "Deprecated" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Deprecated] Superseded") } } },
            pandoc.Attr("", { "callout", "callout-important" })
        )
    elseif status == "Private" then
        callout = pandoc.Div(
            { pandoc.Para { pandoc.Strong { pandoc.Str("[Private] Not for Public Use") } } },
            pandoc.Attr("", { "callout", "callout-warning" })
        )
    end

    if callout then
        -- Find position after Quarto title-block so callout is retained
        local pos = 1
        for i, block in ipairs(doc.blocks) do
            if block.t == 'Div' and block.attr and block.attr.classes then
                for _, cls in ipairs(block.attr.classes) do
                    if cls == 'quarto-title-block' then
                        pos = i + 1
                        break
                    end
                end
                if pos > 1 then break end
            end
        end
        table.insert(doc.blocks, pos, callout)
    end
    return doc
end
