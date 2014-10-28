# ruPocket [![Dependency Status](https://gemnasium.com/HartasCuerdas/ruPocket.svg)](https://gemnasium.com/HartasCuerdas/ruPocket)

[![Code Climate](https://codeclimate.com/github/HartasCuerdas/ruPocket/badges/gpa.svg)](https://codeclimate.com/github/HartasCuerdas/ruPocket) [![Inline docs](http://inch-ci.org/github/HartasCuerdas/ruPocket.svg?branch=master&style=flat)](http://inch-ci.org/github/HartasCuerdas/ruPocket)

Current phase: PocketTags - Stats for Pocket Tags

We use [Pocket](http://getpocket.com), we need stats for our Tags on Pocket.

## Gems

As you could see in [Gemfile](https://github.com/HartasCuerdas/ruPocket/blob/master/Gemfile), we use:

### pocket-ruby

Thanks to [alexchee](https://github.com/alexchee), author of [pocket-api](https://github.com/alexchee/pocket_api). He advise me about **pocket-ruby**.

- [Gem in RubyGems](https://rubygems.org/gems/pocket-ruby)
- [source code in github](https://github.com/turadg/pocket-ruby)

**app.rb** is based on demo-server.rb from **pocket-ruby**.

### pocket-console

This gem provides methods to output stats about Pocket tags.

- [Gem in RubyGems](https://rubygems.org/gems/pocket-console)
- [source code in github](https://github.com/HartasCuerdas/pocket-console)

### pocket-classes

Classes to work with Pocket.

- [Gem in RubyGems](https://rubygems.org/gems/pocket-classes)
- [source code in github](https://github.com/HartasCuerdas/pocket-classes)

## Use your Consumer Key

Use your consumer key in [app.rb file](https://github.com/HartasCuerdas/ruPocket/blob/master/app.rb#L17)

    Pocket.configure do |config|
      config.consumer_key = 'YOUR-CONSUMER_KEY'
    end

## Run script

    ruby app.rb

## Get a valid access token

    open http://localhost:4567/oauth/connect
    #authorize your Pocket app

## Generate stats

    open http://localhost:4567/tags

## Use cached data to generate stats

    open http://localhost:4567/tags-cache

## Where my stats are?

    Stats are printed to the console

## In console you will get your stats, like this...

![Pocket Tagging Stats](./README-src/pocket-tagging-stats.png)

## I think that stats are wrong

    # Try to process more saved items.
    # Increment count parameter to 100, for instance.
    # :count => 100
    info = client.retrieve(:detailType => :complete, :count => 100)
