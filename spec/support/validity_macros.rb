require "active_support/core_ext/module"

module ValidityMacros
  extend ActiveSupport::Concern

  # Colors `noguarantees` with cyan and reports results
  module FormatterExt
    def passed_output(example)
      return super unless example.metadata[:advisory] &&
        !example.metadata[:advisory_result].nil?

      result = example.metadata[:advisory_result]
      dingbat = result ? "✔" : "✘"

      RSpec::Core::Formatters::ConsoleCodes
        .wrap("#{current_indentation}#{example.description.strip} #{dingbat}", :detail)
    end
  end

  included do
    RSpec::Core::Formatters::DocumentationFormatter.prepend FormatterExt
  end

  class_methods do
    def valid(email, reason: nil)
      it "#{email} ✔", caller: caller do
        expect(Emailness.valid?(email)).to be true
      end
    end

    def invalid(email, reason: nil)
      it "#{email} ✘", caller: caller do |ex|
        expect(Emailness.valid?(email)).to be false
      end
    end

    def noguarantees(email, reason: nil)
      it "#{email}", :advisory, caller: caller do |ex|
        expect{ @result = Emailness.valid?(email) }.not_to raise_error
        ex.metadata[:advisory_result] = @result
      end
    end
  end
end
