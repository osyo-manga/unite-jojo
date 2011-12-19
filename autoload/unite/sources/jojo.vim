scriptencoding utf-8

function! unite#sources#jojo#define()
  return s:source
endfunction

let s:source = {
\	"name" : "jojo",
\	"description" : "-",
\	"counter" : 0,
\	"text" : ""
\}

function! s:source.async_gather_candidates(args, context)
	if len(a:args) >= 1
		let self.text = a:args[0]
	endif
	let a:context.source.unite__cached_candidates = []
	let self.counter +=1
	let width = join(map(range(winwidth("%")/4-2), "'..'"), "")."\\zs"
	let result = split(join(map(range(self.counter), "self.text"), ""), width)
	return map(result, '{ "word" : v:val }')
endfunction


