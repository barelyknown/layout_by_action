# layout_by_action for Rails Controllers

You might want to specify layouts for individual actions in your controllers.

Add `gem "layout_by_action"` to your `Gemfile` to get this syntax:

    class ExampleController < ApplicationController
      layout_by_action new: "company", show: "example"
    end

You can set a default layout.

    layout_by_action "default", new: "company", show: "example"

You can also specify an array of actions for any layout.

    layout_by_action [:new, :edit] => "company", show: "example"

## About

Extracted from a Rails project by [@barelyknown](http://twitter.com/barelyknown) :)

This gem is an answer to a [popular question on Stack Overflow](http://stackoverflow.com/questions/3025784/rails-layouts-per-action/18454800).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
