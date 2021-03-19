require "emailness/version"
require "emailness/validator" if defined?(ActiveModel::EachValidator)

module Emailness
  def self.valid?(string)
    parts = string.split("@")
    return false if parts.length != 2

    local, domain = parts

    domain.split(".").each do |it|
      return false unless it =~ /^[a-z]([a-z0-9-])*[a-z0-9]$/i
    end

    return false if local.include?("..")
    return false unless local =~ /^[a-z0-9\-.!#$%&'*+\/=?^_`{|}~]*$/i

    true
  end

  def self.const_missing(name)
    return super unless name == :Validator
    require "emailness/validator"

    defined?(Emailness::Validator) ? Emailness::Validator : super
  end

  class Error < StandardError; end
end
