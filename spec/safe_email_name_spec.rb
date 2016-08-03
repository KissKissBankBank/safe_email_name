require 'spec_helper'
describe SafeEmailName do

  class SomeModel
    include SafeEmailName
  end

  let(:name) { "foo" }
  let(:email) { "foo@bar.com" }

  subject { SomeModel.safe_email_name(name, email) }

  it { expect(subject).to eq("foo <foo@bar.com>") }

  context "when the name and email contain unauthorized characters" do
    let(:name) { 'f<o>"o' }
    let(:email) { 'f<o>"o@bar.com' }

    it { expect(subject).to eq('foo <foo@bar.com>') }
  end
end
