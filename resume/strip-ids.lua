-- strip-ids.lua
-- Removes identifier/bookmark from all headings so pandoc doesn't
-- generate Word bookmarks for every section heading.
function Header(el)
  el.identifier = ""
  return el
end
