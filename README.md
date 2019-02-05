# About this Repo

This is the Citizens Advice Ruby base docker image
It uses the official docker ruby image as it's base

## Using this image

Create a Dockerfile in your ruby project

```dockerfile
FROM citizensadvice/ruby
```

The Dockerfile should go into the root of your app directory.

You can build and run the image:

```console
$ docker build -t ruby-app . 
$ docker run --name my-ruby-app ruby-app
```

### Generating a Gemfile.lock file

Run the following command to generate a Gemfile.lock in the root of your app directory:

```console
$ docker run --rm -v "$PWD":/ruby -w /ruby citizensadvice/ruby bundle install
```
