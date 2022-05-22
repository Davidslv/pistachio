# Postcode.io Service

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

## Setup application

```
$ rails db:prepare
$ rails db:seed
```

## Start server

```
$ rails server
```

Open browser on `http://localhost:3000/`

## Admin

You will need the following for basic authentication:

Username: SH24
password: SH24PASS

### To manage postcodes

Open browser on `http://localhost:3000/admin/allowed_postcodes`

### To manage areas (LSOA)

Open browser on `http://localhost:3000/admin/allowed_areas`

## Testing

This project uses rspec for testing.

```bash
$ bin/rails db:environment:set RAILS_ENV=test
$ bundle exec rspec
```

## Linting

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

$ rails console

> cache = PostcodesCache.new
> service = PostcodesIo.new(base_url: "http://postcodes.io", cache: cache)
> service.find("SE1 7QA")

=> {:status=>200, :lsoa=>"Lambeth 036B", :postcode=>"SE17QA"}

> service.find("SE1 7QA")
=> {:status=>200, :lsoa=>"Lambeth 036B", :postcode=>"SE17QA", :expire_at=>2022-05-20 22:57:40.446862 +0100}
```

## Requirements

We are using the Postcodes.io REST API as our source for data. The service area is described by the following rules:

1. Postcodes are grouped into larger blocks called LSOAs. This is returned from the API when we query a postcode. We want to allow any postcode in an LSOA starting "Southwark" or "Lambeth". Example postcodes for these LSOAs are SE1 7QD and SE1 7QA respectively.
2. Some postcodes are unknown by the API or may be served despite being outside of the allowed LSOAs. We need to be able to allow these anyway, even though the API does not recognise them. SH24 1AA and SH24 1AB are both examples of unknown postcodes that we want to serve.
3. Any postcode not in the LSOA allowed list or the Postcode allowed list is not servable.


## Video

https://user-images.githubusercontent.com/136777/169700653-0879a901-f7fd-42df-a0a1-2dc545498a0e.mov
