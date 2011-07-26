vim-googurl
===========

## Description

A vim plugin to easily create [Markdown](http://daringfireball.net/projects/markdown/) links from a [Google](http://www.google.com/) query. I wrote this script because I used to toggle back and forth between vim and my web browser when inserting links into text.

## Install

Just drop the file `googurl.vim` into your `~/.vim/plugin` directory.
vim-googurl needs ruby support compiled in vim, and the following gems:

- json

## Use

The plugin will define a `FindUrls` command. Put your cursor over a word, call `:FindUrls` and you will be offered a set of choices drawn from Google.
