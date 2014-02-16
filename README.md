# Using the gpd-request gem with the Twitter Lists API

* 16-Feb-2014: The following example is out of date since Twitter no longer allows this type of API access, however it demonstrates how the gpd-request gem is used.*

    require 'gpd-request'

    gpd = GPDRequest.new 'drobertson', 'password'

    # -- Create the list --
    doc = gpd.post 'http://twitter.com/drobertson/lists.xml', 'name' => 'jrobertson4'

    # -- Rename the list --
    doc = gpd.post 'http://twitter.com/drobertson/lists/jrobertson4.xml', 'name' => 'edinburgh'

    # -- List the lists --
    doc = gpd.get 'http://twitter.com/drobertson/lists.xml'

    # -- List the lists the specified user has been added to --
    doc = gpd.get 'http://twitter.com/jrobertson/lists/memberships.xml'

    # -- Delete the list --
    doc = gpd.delete 'http://twitter.com/drobertson/lists/tbray.xml'

    # -- Show tweet timeline for members of the specified list --
    doc = gpd.get 'http://twitter.com/drobertson/lists/ruby/statuses.xml'

    # -- Show a specific list you can use the new resource --
    doc = gpd.get 'http://twitter.com/drobertson/lists/ruby.xml'

    # -- Add a member to a list --
    doc = gpd.post 'http://twitter.com/drobertson/edinburgh/members.xml', 'id' => '33493'

    # -- Members of the specified list --
    doc = gpd.get 'http://twitter.com/drobertson/ruby/members.xml'

    # -- Remove a member from the specified list --
    doc = gpd.delete 'http://twitter.com/drobertson/lists/edinburgh.xml', 'id' => '33493'

    # -- Check if a user is a member of the specified list --
    doc = gpd.get 'http://twitter.com/drobertson/ruby/members/13255932.xml'

    # -- Subscribe the authenticated user to the specified list --
    doc = gpd.post 'http://twitter.com/jrobertson/ruby/subscribers.xml'

    # -- List the users subscribed to the specified list --
    doc = gpd.get 'http://twitter.com/drobertson/ruby/subscribers.xml'

    # -- Unsubscribe the authenticated user from the specified list --
    doc = gpd.delete 'http://twitter.com/jrobertson/ruby/subscribers.xml'

    # -- Check if a user subscribes to the specified list --
    doc = gpd.get 'http://twitter.com/drobertson/ruby/subscribers/5656402.xml'

## Resources

* [jrobertson/gpd-request](https://github.com/jrobertson/gpd-request)

## See also

* [Fetching a short url from ur1.ca using httpclient](http://www.jamesrobertson.eu/snippets/2011/11/23/2139hrs.html)

gpdrequest post twitter gem
