RSpec.describe "Model.validates_email_format_of" do
  class Hooman
    include ActiveModel::Model
    attr_accessor :email
  end

  before(:all) do
    # since Bundler loaded our gem before activemodel, we need to
    # require it ourselves
    require "emailness/validator"

    Hooman.validates_email_format_of :email
  end

  it "can then return valid" do
    thing = Hooman.new(email: "jon@domain.com")
    expect(thing.valid?).to be true
  end

  it "can then return invalid" do
    thing = Hooman.new(email: "jon@domain..com")
    expect(thing.valid?).to be false
    binding.pry
  end
end
