# Onceover::Hiera

Hiera lookup support for [Onceover](https://github.com/dylanratcliffe/onceover), _The gateway drug to automated infrastructure testing with Puppet_

## Installation

Onceover detects plugins in all gems named `onceover-*`.  Your plugin is then responsible for registering itself and setting up new commands, etc.

This example plugin can be installed by adding it to your `Gemfile` or by running the following command:

```shell
$ gem install onceover-hiera
```

## Usage
Onceover provides plugins with built-in support for help and argument processing.  Here's how to run this example:

**Built-in help**

```shell
$ onceover run hiera --help
```

**Default execution**

```shell
$ onceover run hiera lookup 
Error: Could not run: No keys were given to lookup.
```
_This is pass-through access to the `puppet lookup` command configured for Onceover_

**Option processing**

```shell
$ onceover run helloworld 
INFO   -> Hello, Wednesday!
```


## Development

PRs welcome :)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/declarativesystems/onceover-hiera
