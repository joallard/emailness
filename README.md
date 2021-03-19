# Emailness
Nothing to configure, no arcane standard to patch around.

Email validation with reasonable defaults so you can **go care about more important things**. It just checks the "emailness" of the string, that's it.

**Current status: Beta**

[Test Cases](#test-cases) · [Usage](#usage)

### Goals
* Be trivially easy to use (and choose)
* Catch most common entry errors without being too strict
* Meant to match **HTML5 email validation**, *happily deviates* from RFC 5322

### Highlights of what is allowed/not allowed
* Allowed
    * **Email tags** with '+'
* Not allowed
    * Two consecutive dots: '..'
    * Two at signs: '@@'

See the other [test cases &rarr;](#test-cases)

## Usage
### Install
Add the gem:

```sh
bundle add emailness
```

### Use
In **Rails**, add it to your model:

```ruby
# class Thing < ApplicationRecord

validates_email_format_of :email

```

Or, in **plain Ruby**, just use the module:

```ruby
Emailness.valid?("emailness@rubygems.org") # => true|false
```

### Commit
```sh
git commit [--all] -m "$MODEL: Validate email address"
```

And have a great day.

## Test Cases

### Should be valid
| Case                       | Example                                  | Result    |
|----------------------------|------------------------------------------|-----------|
| Tag                        | `jon+tag@hey.com`                        | ✔ valid   |
| 2nd level TLD              | `email.me@ejemplo.com.ar`                | ✔ valid   |
| IDN (xn--)                 | `jon@xn--acestunbeaudomaine-6ub.qc.ca`   | ✔ valid   |
| Single apostrophe          | `johnson.o'jonathan@email.com`           | ✔ valid   |
| Single TLD                 | `fancytld@tld`                           | ✔ valid   |

### Should be invalid
| Case                       | Example                                  | Result    |
|----------------------------|------------------------------------------|-----------|
| Double dot                 | `double..dot@gmail.com`                  | ✘ invalid |
| Trailing hyphen in domain  | `local@trailing-hyphen-.com`             | ✘ invalid |
| Leading digit in domain    | `leadingdigit@9domain.com`               | ✘ invalid |
| White space                | `white space@example.com`                | ✘ invalid |
| Escaped white space        | `"even_white_space escaped"@example.com` | ✘ invalid |
| Two at-signs               | `email@@veryat.com`                      | ✘ invalid |

### No guarantees (undefined)
| Case          | Example                          | Current   |
|---------------|----------------------------------|-----------|
| Local comment | `jon(is_very_smart)@email.com`   | ✘ invalid |
| IPv6 host     | `send.to.my.server@[::1]`        | ✘ invalid |
| IPv4 host     | `who-needs-dns@[172.16.11.222]"` | ✘ invalid |

Those examples correspond to the
[spec file](https://github.com/joallard/emailness/blob/master/spec/emailness_spec.rb), which is simple on purpose.

*TODO: Update the tables automatically*

If you would like to add a case, simply open an issue or PR.


## Contributing
Are welcome:

* Contributions about making it easier to use this gem
* Improving the present documentation
* "Forgotten" email address cases that follow the spirit of this gem

I also gladly welcome suggestions about merging this code elsewhere and making it obsolete entirely.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/joallard/emailness/blob/master/CODE_OF_CONDUCT.md).

Everyone interacting in the Emailness project's codebases, issue trackers, chat rooms and mailing lists is expected to follow it.
