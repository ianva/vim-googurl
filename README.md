vim-googurl
===========

## Description

A [vim](http://www.vim.org/) plugin to easily create [Markdown](http://daringfireball.net/projects/markdown/) links from a [Google](http://www.google.com/) query. I wrote this script because I used to toggle back and forth between vim and my [web browser](http://en.wikipedia.org/wiki/Web_browser) when inserting [links](http://en.wikipedia.org/wiki/Link) into text.

## Install

Just drop the file `googurl.vim` into your `~/.vim/plugin` directory.
vim-googurl needs ruby support compiled in vim, and the following gems:

- json

## Use

The plugin will define a `FindUrls` command. Put your cursor over a word, call `:FindUrls` and you will be offered a set of choices drawn from Google.

For instance, suppose that you want to link to [Github](https://github.com/), put the word `Github` under your cursor, and invoke `:FindUrls`. You will be prompted to choose the URL among several Google matches. Make a choice, and the link will appear as `[Github](https://github.com/)` in your markdown file.

You may also query [urls](http://en.wikipedia.org/wiki/Uniform_resource_locator) for the current visual selection by pressing 'u'.

## Todo

Nice features would be:

- Make a [Wikipedia](http://www.wikipedia.org/)-specific version
- Extend to other markup formats e.g. [AsciiDoc](http://www.methods.co.nz/asciidoc/)

## License

    Copyright (c) 2011 Roma1n
   
    Permission is hereby granted, free of charge, to any 
    person obtaining a copy of this software and associated documentation 
    files (the "Software"), to deal in the Software without restriction, 
    including without limitation the rights to use, copy, modify, merge,
    publish, distribute, sublicense, and/or sell copies of the Software, 
    and to permit persons to whom the Software is furnished to do so, 
    subject to the following conditions:
    
    The above copyright notice and this permission notice shall be 
    included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
    OF MERCHANTABILITY, SANITY, FITNESS FOR A PARTICULAR PURPOSE 
    AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
    THE USE OR OTHER DEALINGS IN THE SOFTWARE.

