RSpec.describe "Emailness.valid?" do
  include ValidityMacros

  context "valid (✔)" do
    valid "jon+tag@hey.com", reason: "Tag"
    valid "email.me@ejemplo.com.ar", reason: "2nd level TLD"
    valid "jon@xn--acestunbeaudomaine-6ub.qc.ca", reason: "IDN (xn--)"
    valid "johnson.o'jonathan@email.com", reason: "Single apostrophe"
    valid "fancytld@tld", reason: "Single TLD"
  end

  context "invalid (✘)" do
    invalid "double..dot@gmail.com", reason: "Double dot"
    invalid "local@trailing-hyphen-.com", reason: "Trailing hyphen in domain"
    invalid "leadingdigit@9domain.com", reason: "Leading digit in domain"
    invalid "white space@example.com", reason: "White space"
    invalid %["even_white_space\\ escaped"@example.com], reason: "Escaped white space"
    invalid "email@@veryat.com", reason: "Two at-signs"
  end

  context "no guarantees (✽)" do
    noguarantees "jon(is_very_smart)@email.com", reason: "Local comment"
    noguarantees "send.to.my.server@[::1]", reason: "IPv6 host"
    noguarantees "who-needs-dns@[172.16.11.222]", reason: "IPv4 host"
  end
end
