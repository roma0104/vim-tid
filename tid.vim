" Vim Syntax File
" Language: TiddlyWiki5 Tiddler
" Maintainer: Roma Hicks
" Revision Date: 2016-08-16

if exists ("b:current_syntax")
	finish
endif

" String
syntax region string start=/"/ end=/"/ skip=/\\"/
highlight link string Constant

" TW5 Tiddler Field
syntax match TW5syntax /^[a-zA-Z0-9_\-]\+:/

" TW5 macro definition
syntax region regularText matchgroup=TW5syntax start=/\\define/ end=/\\end/ contains=TW5macroName,TW5macroSig,XMLtag,XMLcomment
syntax match TW5syntax /\\end/
highlight link TW5syntax PreProc
highlight link regularText NONE

" TW5 macro definition name
syntax match TW5macroName /\s[a-zA-Z0-9\-]\+\ze\s*(/
highlight link TW5macroName Statement

" TW5 macro definition signature
syntax region TW5macroSig start=/(/ end=/)/ contained 
highlight link TW5macroSig PreProc

" TW5 macro call
syntax region TW5macroCall start=/<\{2}/ end=/>\{2}/ contains=string,TW5var
highlight link TW5macroCall PreProc

" TW5 variable
syntax match TW5var /\$[a-zA-Z0-9\-_]\+\$/
highlight link TW5var Constant

" TW5 transclusion
syntax region TW5transclusion start=/"$:/ end=/"/
syntax region TW5transclusion start=/{\{2}/ end=/}\{2}/
highlight link TW5transclusion Underlined

" XML tag
syntax region XMLtag start=/<\/\=/ end=/\/\=>/ skip=/>\{2}/ contains=XMLAttr,string,TW5macroCall,TW5transclusion
highlight link XMLtag Statement

" XML attributes
syntax match XMLAttr /[a-zA-Z0-9\-_]\+=/ contained
highlight link XMLAttr Identifier

" XML Comment
syntax region XMLcomment start=/<!--/ end=/-->/
highlight link XMLcomment Comment

let b:current_syntax = "tid"
