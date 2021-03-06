require 'mkmf'

# :stopdoc:

dir_config 'libffi'

pkg_config("libffi")
unless have_header('ffi.h')
  if have_header('ffi/ffi.h')
    $defs.push(format('-DUSE_HEADER_HACKS'))
  else
    abort "ffi.h is missing. Please install libffi."
  end
end

unless have_library('ffi') || have_library('libffi')
  abort "libffi is missing. Please install libffi."
end

have_header 'sys/mman.h'
have_header 'windows.h'

create_makefile 'fiddle'

# :startdoc:
