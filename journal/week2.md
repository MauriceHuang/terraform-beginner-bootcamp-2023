# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby
### Bundler 

Bundler is a package panager for buby. It is the primary way to install ruby packages (known as gems) for ruby. 
#### Install Gems

You need to create a GEMfile and define your gems in that file.

```rb
source 'https://rubygems.org'

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activereacord'

```
Then you need to run the `bundle inistall` command 

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)
A Gemfile.lock will be created to lock down the gem versions used in the projec. 

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

#### Sinatra

Sinatra is a micro-web-framework for ruby to build web-apps.

It is great for mock ordevelopment servers or for very simple project. Your can create a web-server with just 1 file.

https://sinatrarb.com/