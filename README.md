# Emailness
**Care very little about email validation**

Email validation with sensible defaults so you can go care about more important things.

***TODO: The Rails validator isn't finished yet.***

* Strives to be trivially easy to choose and use
* Meant to match HTML5 email validation, happily deviates from RFC 5322
* Email tags with '+' are allowed
* Two consecutive dots ('..') are not
* Cares very little about most other things


Add the gem:

```
bundle add emailness
```

Add it to your model:

```
validates_emailness_of :email
```

And have a great day.

*This gem is meant to be trivially easy to choose, install, and use. If that could be improved any way, please let me know!*

---

## Test cases
The [spec file](https://github.com/joallard/emailness/blob/master/spec/emailness_spec.rb) strives to be simple on purpose.

```
$ rspec

Emailness::Validator
  valid (✔)
    jon+tag@hey.com ✔
    email.me@ejemplo.com.ar ✔
    jon@xn--acestunbeaudomaine-6ub.qc.ca ✔
    johnson.o'jonathan@email.com ✔
    fancytld@tld ✔
  invalid (✘)
    double..dot@gmail.com ✘
    local@trailing-hyphen-.com ✘
    leadingdigit@9domain.com ✘
    white space@example.com ✘
    "even_white_space\ escaped"@example.com ✘
    email@@veryat.com ✘
  no guarantees (✽)
    jon(is_very_smart)@email.com ✘
    send.to.my.server@[::1] ✘
    who-needs-dns@[172.16.11.222] ✘
```

*TODO: Update this automatically*

If you would like to add a case, simply open an issue or PR.

## Usage

Either use it in Rails, or vanilla:

```
Emailness.valid?(email)  # true/false
```

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
