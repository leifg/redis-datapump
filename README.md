# Redis::Datapump

[![Build Status](https://travis-ci.org/leifg/redis-datapump.png?branch=master)](https://travis-ci.org/leifg/redis-datapump) [![Coverage Status](https://coveralls.io/repos/leifg/redis-datapump/badge.png?branch=master)](https://coveralls.io/r/leifg/redis-datapump) [![Code Climate](https://codeclimate.com/github/leifg/redis-datapump.png)](https://codeclimate.com/github/leifg/redis-datapump) [![Dependency Status](https://gemnasium.com/leifg/redis-datapump.png)](https://gemnasium.com/leifg/redis-datapump) [![Gem Version](https://badge.fury.io/rb/redis-datapump.png)](http://badge.fury.io/rb/executrix)

This tool lets you export and import redis database into a json format.

It is loosely based on [redis-dump](http://github.com/delano/redis-dump).

**CAUTION**: This is a pre-pre-alpha build. Don't use it for critical backups (you are however welcome to contribute)

## Installation

Add this line to your application's Gemfile:

    gem 'redis-datapump'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis-datapump

## Usage

There are 2 tools that are shipped with this gem:

    redis-export -d 0

will ouput the keys to the console.

You can output it to a file or pipe it to another process.

With

  cat backup.json | redis-import -d 0

you'll import the database again


## Format

The format of the dump looks as following:

    {
      "ttl": -1,
      "value": "b",
      "type": "string",
      "key": "a"
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
