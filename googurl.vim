" Searches for a link set on Google for the word under cursor.
" This is mostly meant for adding links when editing Markdown files.
"
" The plugin ruby_focused_unit_test_vim located at
" https://github.com/drewolson/ruby_focused_unit_test_vim
" was used as a starting point.
" The notes at http://www.swaroopch.com/notes/Vim_en:Scripting were also
" useful.
" Accessing the word under cursor is discussed here: 
" http://vim.1045645.n5.nabble.com/Getting-word-under-cursor-td2739516.html

if !has("ruby")
  finish
end

command FindUrls :call <SID>FindUrlsWuc()

vnoremap u :call <SID>FindUrlsSelection()<cr>

function! s:FindUrlsWuc()
  ruby find_urls_wuc()
endfunction

function! s:FindUrlsSelection()
  ruby find_urls_vs()
endfunction

" This function taken from the lh-vim repository
function! s:GetVisualSelection()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

ruby << EOF
require "rubygems"
require "uri"
require "open-uri"
require "json"

GOOG_BASE_URL="http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q="

# Find urls for the word under cursor
def find_urls_wuc()
  find_urls(:word_under_cursor, :replace_word_under_cursor)
end

# Find urls for the visual selection
def find_urls_vs()
  find_urls(:selection, :replace_selection)
end

def find_urls(get_operand, replace_operand)
  search_term = send(get_operand)
  reply = JSON.parse(read_uri(make_google_query_url(search_term)))

  if reply["responseStatus"] != 200
    VIM::message("Error while querying Google")
    return
  end
  
  urls = filter_urls(reply["responseData"]["results"])
  index = VIM::evaluate("inputlist(#{vim_choice_list("Choose URL: ", urls)})")
  if index < 1 or index > urls.length
    return
  end
  corrected_index = index - 1

  send(replace_operand, "[#{search_term}](#{urls[corrected_index]})")
end

def word_under_cursor()
  return VIM::evaluate("expand(\"<cword>\")")
end

def selection()
  return VIM::evaluate("<SID>GetVisualSelection()")
end

def make_google_query_url(search_term)
  return URI.escape(GOOG_BASE_URL + search_term)
end

def read_uri(uri)
  return open(uri).read
end

def filter_urls(json_results)
  json_results.collect { |result| result["url"]}
end

def vim_choice_list(title, url_list)
  result = [title]
  url_list.each_with_index { |url, index| result << "#{index + 1}. #{url}" }
  return JSON.generate(result).gsub("\"", "'") #hack
end

def replace_word_under_cursor(new_str)
  VIM.command("norm ciw#{new_str}")
end

def replace_selection(new_str)
  VIM.command("norm gvc#{new_str}")
end

EOF
