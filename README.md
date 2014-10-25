# ruPocket

Current phase: PocketTags - Stats for Pocket Tags

We use [Pocket](http://getpocket.com), we need stats for our Tags on Pocket.

## Gems

As you could see in [Gemfile](https://github.com/HartasCuerdas/ruPocket/blob/master/Gemfile), we use:

### [pocket-ruby](https://github.com/turadg/pocket-ruby)

Thanks to [alexchee](https://github.com/alexchee), author of [pocket-api](https://github.com/alexchee/pocket_api). He advise me about **pocket-ruby**.

**app.rb** is based on demo-server.rb from **pocket-ruby**.

### [pocket-class](https://rubygems.org/gems/pocket-console)

This gem provides methods to output stats about Pocket tags.

### [pocket-classes](https://rubygems.org/gems/pocket-classes)

Classes to work with Pocket.

## Run script

    ruby app.rb

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
