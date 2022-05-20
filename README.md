# Postcode.io Service


TBD


## Dependencies

This project was created using ruby 2.7.1 (see .ruby-version).

I use rbenv to install different ruby versions, you may need to install [homebrew](https://brew.sh).


In case you need to install everything you can simply do:


```bash
$ ./install-dependencies.sh
```

Otherwise you can proceed with the following:

```bash
$ brew bundle

$ rbenv install
$ gem install bundler
$ bundle install
```

## Testing

This project uses rspec for testing.

```bash
$ bundle exec rspec
```

## Linting

This project uses rubocop for linting.

```bash
$ bundle exec rubocop
```

## Default rake task

This project uses rake and it has been configured to run by default
both rubocop and rspec.

```bash
$ bundle exec rake
```

## Console

In case you need access to the console, here's an example of usage.

Whenever there's a successful request to postcodes.io it becomes cached,
if there are further requests for the same postcode the service will return
the cached request and will expose the `expire_at` attribute.

```bash

$ irb -r ./lib/services/postcodes_io.rb

> cache = Services::PostcodesCache.new
> service = Services::PostcodesIo.new(base_url: "http://postcodes.io", cache: cache)
> service.find("SE1 7QA")

=> {:status=>200, :lsoa=>"Lambeth 036B", :postcode=>"SE17QA"}

> service.find("SE1 7QA")
=> {:status=>200, :lsoa=>"Lambeth 036B", :postcode=>"SE17QA", :expire_at=>2022-05-20 22:57:40.446862 +0100}
```

## Objective

TBD
