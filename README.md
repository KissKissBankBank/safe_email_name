SafeEmailName
=============

Format the "From" and "To" fields in emails, correctly escaped.


Usage
-----

```rb
gem 'safe_email_name'
```

Call `bundle`, then, in your Rails app you can use it like this:

```rb
class UserMailer < ActionMailer::Base
  include SafeEmailName

  default from: safe_email_name('Example Corp', 'hello@example.com')

  def contact(user)
    mail to: safe_email_name(user.name, user.email)
  end
def
```


Tests
-----

```rb
bundle exec rspec
```


Release
-------

Update the version number in the gemspec, then:

```
gem build safe_email_name.gemspec
gem push safe_email_name-*.gem
```


Future
------

This has been proposed as a Rails patch: [#36454](https://github.com/rails/rails/pull/36454).
