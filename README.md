# Pete Keen's Dotfiles

These are my dotfiles. That means primarily this is emacs with some bash thrown in with a tiny amount of other stuff. I've drawn heavily from the ideas put forth by [Zach Holman](https://github.com/holman)'s [dotfiles](https://github.com/holman/dotfiles). The core idea is that these files are organized by *topic*, not *software*. That means, for example, that all of the ruby things, both bash and emacs, belong in the same area.

I've changed a few little things:

* Each module can have it's own `bin/`
* I use `bash` instead of `zsh`
* The core `bash` config looks for `init.sh` in every module
* The core `emacs` config looks for `init.el` in every module
* Emacs uses [el-get](https://github.com/dimitri/el-get) to manage 3rd party dependencies.
* Modules are listed explicitly in `~/.modules`, one per line, and are loaded in the specified order. This lets me set up different configs for work and home while still sharing almost everything else.

To get started:

```
$ git clone https://github.com/peterkeen/dotfiles.git
$ cd dotfiles
$ rake setup_modules
$ <edit ~/.modules as appropriate>
$ rake install
```

Adding a new module is simple. Just make a directory, drop `init.sh` and/or `init.el` and/or `<something>.symlink` into it, and list it in your modules file.
