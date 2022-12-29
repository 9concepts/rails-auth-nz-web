# README

## Troubleshoot

### `ffi` install failed

```bash
Installing ffi 1.15.5 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    current directory: /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5/ext/ffi_c
/Users/9sako6/.rbenv/versions/3.1.3/bin/ruby -I /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0 extconf.rb
checking for ffi_prep_closure_loc() in -lffi... no
checking for ffi_prep_closure_loc() in -llibffi... no
checking for ffi_prep_closure_loc() in -llibffi-8... no
checking for whether -Wl,--exclude-libs,ALL is accepted as LDFLAGS... no
checking for whether -pthread is accepted as LDFLAGS... yes
creating extconf.h
creating Makefile

current directory: /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5/ext/ffi_c
make DESTDIR\= sitearchdir\=./.gem.20221229-42654-iibupu sitelibdir\=./.gem.20221229-42654-iibupu clean

current directory: /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5/ext/ffi_c
make DESTDIR\= sitearchdir\=./.gem.20221229-42654-iibupu sitelibdir\=./.gem.20221229-42654-iibupu
Configuring libffi
configure: error: in `/Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5/ext/ffi_c/libffi-x86_64-darwin21':
configure: error: C++ preprocessor "/lib/cpp" fails sanity check
See `config.log' for more details
make: *** ["/Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5/ext/ffi_c/libffi-x86_64-darwin21"/.libs/libffi_convenience.a] Error 1

make failed, exit code 2

Gem files will remain installed in /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/gems/ffi-1.15.5 for inspection.
Results logged to /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0/extensions/x86_64-darwin-21/3.1.0/ffi-1.15.5/gem_make.out

  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:102:in `run'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:51:in `block in make'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:43:in `each'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:43:in `make'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/ext_conf_builder.rb:42:in `build'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:171:in `build_extension'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:205:in `block in build_extensions'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:202:in `each'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/ext/builder.rb:202:in `build_extensions'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/rubygems/installer.rb:843:in `build_extensions'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/rubygems_gem_installer.rb:72:in `build_extensions'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/rubygems_gem_installer.rb:28:in `install'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/source/rubygems.rb:207:in `install'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/installer/gem_installer.rb:54:in `install'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/installer/gem_installer.rb:16:in `install_from_spec'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/installer/parallel_installer.rb:186:in `do_install'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/installer/parallel_installer.rb:177:in `block in worker_pool'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/worker.rb:62:in `apply_func'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/worker.rb:57:in `block in process_queue'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/worker.rb:54:in `loop'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/worker.rb:54:in `process_queue'
  /Users/9sako6/.rbenv/versions/3.1.3/lib/ruby/3.1.0/bundler/worker.rb:91:in `block (2 levels) in create_threads'

An error occurred while installing ffi (1.15.5), and Bundler cannot continue.

In Gemfile:
  elastic-apm was resolved to 4.5.1, which depends on
    http was resolved to 5.1.1, which depends on
      llhttp-ffi was resolved to 0.4.0, which depends on
        ffi-compiler was resolved to 1.0.1, which depends on
          ffi
```

これでなおった。

```bash
LDFLAGS="-L/usr/local/opt/libffi/lib" PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig" bundle
```

https://github.com/ffi/ffi/issues/828#issuecomment-713527256
