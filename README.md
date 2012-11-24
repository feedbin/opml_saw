# OPML Saw

Parse OPML into a flat hash. OPML Saw supports nesting (folders) through the tag attribute. the most immediate parent of the outline will become the tag.

## Installation

Add this line to your application's Gemfile:

    gem 'opml_saw'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opml_saw

## Usage

`subscriptions.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<opml version="1.0">
    <head>
        <title>Subscriptions</title>
    </head>
    <body>
        <outline text="Riding Rails - home" title="Riding Rails - home" type="rss" xmlUrl="http://feeds.feedburner.com/RidingRails" htmlUrl="http://weblog.rubyonrails.org/"/>
    </body>
</opml>
```

```ruby

file = File.open('subscriptions.xml', 'r')
contents = file.read
opml = OpmlSaw::Parser.new(contents)
opml.parse
pp opml.feeds
#=>
[{
  :text     => "Riding Rails - home",
  :title    => "Riding Rails - home",
  :type     => "rss",
  :xml_url  => "http://feeds.feedburner.com/RidingRails",
  :html_url => "http://weblog.rubyonrails.org/",
  :tag      => nil
}]
```
