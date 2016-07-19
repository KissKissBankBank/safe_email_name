require 'spec_helper'
describe SafeEmailName do

  class SomeModel
    include SafeEmailName
  end

  let(:name) { "foo" }
  let(:email) { "foo@bar.com" }

  subject { SomeModel.new.safe_email_name('foo', 'foo@bar.com') }

  it { expect(subject).to eq("#{name} <#{email}>") }
end
