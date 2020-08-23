# Propane

## A simple project starter.

Propane is a quick project bootstrap.
It aims on starting off new Python projects with ease, especially when
working with [Pyenv](https://github.com/pyenv/pyenv) and
[Pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv).
Written in zsh and ready to work on MacOS.

Though Propane currently supports only setting up Python projects,
the goal is to extend its functionality into other languages as well.
The same applies to zsh shell. Author is not against Bash or Fish, and
plans to implement support for them as soon as possible.

### Installation

Currently the only tested way of installing Propane is through git submodules,
though a simple git clone should work as well without a doubt.

In order to install Propane, type in your zsh-powered terminal:

```zsh
git clone --recurse-submodules https://github.com/filipgodlewski/propane.git

# alternatively, if you are using git submodules in your files
git submodule add https://github.com/filipgodlewski/propane.git
git submodule update --init --recursive
```

Secondly, you will have to source Propane into your .zshrc file by,
for example, creating an alias:

```zsh
propane="zsh $HOME/.local/share/zsh/plugins/propane/propane.zsh"
```

Note that recursive Installation is required, because Propane relies on
[gitignore](https://github.com/github/gitignore) and
[Pytomata](https://github.com/filipgodlewski/pytomata).

### Usage

In order to create new Python project, simply place your prompt at
the directory and type:
```zsh
# cd target_parent_directory
# if you wish to create your new Python project
# inside target_parent_directory/

propane
```

Propane will prompt you with couple of questions which will setup
the basic file structure up for you, including:

* git repository and .gitignore file
* pyenv-virtualenv of the same name as your project with up-to-date packages

pip packages that are being installed by default are: pip, setuptools, wheel.

### Development

The Propane source code is
[hosted on GitHub](https://github.com/filipgodlewski/propane).
It is meant to be clean, simple and easily hackable.

#### Contributing

If you wish to contribute, don't hesitate to do that! I am open for proposals.
If you have a great idea that you'd like to merge into Propane,
either fork and create a pull request pointing to that repository, or
write an issue.

#### Version History

See [CHANGELOG.md](CHANGELOG.md)

#### License

[The MIT License](LICENSE)
