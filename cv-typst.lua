-- Typst layout for the CV page's custom HTML classes (see cv.qmd).
-- Turns .cv-entry divs into a date/body grid, .cv-skills into a two-column
-- grid, and styles .cv-date, .cv-note and .cv-tag spans.

local accent = 'rgb("#2a6f97")'

local function raw(s) return pandoc.RawBlock('typst', s) end
local function rawi(s) return pandoc.RawInline('typst', s) end

local function wrap_inlines(prefix, inlines, suffix)
  local out = pandoc.List({ rawi(prefix) })
  out:extend(inlines)
  out:insert(rawi(suffix))
  return out
end

function Span(el)
  if el.classes:includes('cv-date') then
    return wrap_inlines('#text(size: 9pt, weight: "bold", fill: ' .. accent .. ')[', el.content, ']')
  elseif el.classes:includes('cv-note') then
    return wrap_inlines('#text(size: 9pt, fill: luma(90))[', el.content, ']')
  elseif el.classes:includes('cv-tag') then
    return wrap_inlines('#box(inset: (x: 5pt, y: 2pt), radius: 6pt, fill: rgb("#2a6f97").lighten(88%), stroke: 0.5pt + rgb("#2a6f97").lighten(60%))[#text(size: 8.5pt)[', el.content, ']] ')
  end
end

function Div(el)
  if el.classes:includes('cv-entry') then
    local date = el.content[1]
    local body = pandoc.List()
    for i = 2, #el.content do
      local b = el.content[i]
      if b.t == 'Div' and b.classes:includes('cv-body') then
        body:extend(b.content)
      else
        body:insert(b)
      end
    end
    local out = pandoc.List({ raw('#block(breakable: true, below: 0.9em)[#grid(columns: (6.5em, 1fr), column-gutter: 1em, [') })
    out:insert(pandoc.Plain(date.content))
    out:insert(raw('], ['))
    out:extend(body)
    out:insert(raw('])]'))
    return out
  elseif el.classes:includes('cv-skills') then
    local out = pandoc.List({ raw('#grid(columns: (1fr, 1fr), column-gutter: 1.5em, row-gutter: 1em,') })
    for _, group in ipairs(el.content) do
      out:insert(raw('[#set par(justify: false)'))
      out:extend(group.content)
      out:insert(raw('],'))
    end
    out:insert(raw(')'))
    return out
  elseif el.classes:includes('lead') then
    local out = pandoc.List({ raw('#text(size: 11.5pt)[') })
    out:extend(el.content)
    out:insert(raw(']'))
    return out
  end
end
