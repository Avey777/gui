#!/usr/bin/env -S v

import term

dir_files := ls('.') or { [] }
files := dir_files.filter(file_ext(it) == '.v').sorted()
if files.len == 0 {
	println('no .v files found')
	return
}
for file in files {
	p := 'v -check ${file} '
	print('${p:-30}')
	flush()
	result := execute('v -check ${file}')
	if result.exit_code == 0 {
		println(term.green('✓'))
	} else {
		println('')
		println(result.output)
		return
	}
}
