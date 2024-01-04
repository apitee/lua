# [lua](http://lua.apitee.com)

## About Lua

Lua is powerful, lightweight interpreted scripting language with a small footprint. It supports multi-paradigm programming: procedural, object-oriented, functional, data-driven and data-description. Lua is rarely used as a stand-alone language. Instead Lua focuses on scripting, as “secondary” language which integrated into other software written in mainly C/C++.

Some examples of Lua’s usage areas: network software, video games, user graphical interfaces, graphics/text processing software, etc. Lua also is good for beginners to create simple video games.

Lua interpreter is written in ANSI C and it is extremely small, both interpreter and source code is only about 1Mb. Lua is considered one of the fastest interpreted languages.
Checking Lua

## Start

Some distributions already have Lua pre-installed. Open your terminal and type:
```shell
lua
```

If the output is be something like:

```shell
Lua 5.4.3  Copyright (C) 1994-2021 Lua.org, PUC-Rio
>
```


install the required Lua libraries using Luarocks (if not installed already):

```sh
luarocks install luaposix
```


1. Run the installation command with `sudo` to gain elevated privileges:

```bash
sudo luarocks install lyaml
```

2. Install the Lua module locally for your user by using the `--local` option:

```bash
luarocks install --local lyaml
```

When you install the module locally, you need to ensure that Lua can find it by setting up the `LUA_PATH` and `LUA_CPATH` environment variables appropriately. The `luarocks path` command will output the correct settings; you can add them to your shell configuration file (e.g., `.bashrc`, `.bash_profile`, `.zshrc`, etc.) to apply them permanently:

```bash
eval $(luarocks path --bin)
```

After running `luarocks install --local lyaml`, execute the above `eval` command or restart your shell to apply the settings. Then, try running your script again.


clone
```bash
git clone https://github.com/apitee/lua.git
```

```bash
lua apitee.lua git.yaml
```

Hint! To exit Lua’s interpreter press Ctrl + D.
