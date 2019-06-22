require 'spec_helper'

describe SafeEmailName do
  class SomeModel
    include SafeEmailName
  end

  let(:name) { 'foo' }
  let(:email) { 'foo@bar.com' }

  subject { SomeModel.safe_email_name(name, email) }

  it { expect(subject).to eq('foo <foo@bar.com>') }

  context 'when the name contains unauthorized characters' do
    let(:name) { 'f<o>"o' }

    it 'escapes them' do
      expect(subject).to eq('"f<o>\"o" <foo@bar.com>')
    end
  end

  context 'when the name contains whitespace' do
    let(:name) { "\t fo \n o \t " }

    it 'squishes it' do
      expect(subject).to eq('fo o <foo@bar.com>')
    end
  end

  context 'when the email contains unauthorized characters' do
    let(:email) { 'f<o>"o@bar.com' }

    it 'removes them' do
      expect(subject).to eq('foo <foo@bar.com>')
    end
  end

  context 'when the name is blank' do
    let(:name) { " \n \t" }

    it 'ignores it' do
      expect(subject).to eq('foo@bar.com')
    end
  end

  context 'when the name is nil' do
    let(:name) { nil }

    it 'ignores it' do
      expect(subject).to eq('foo@bar.com')
    end
  end
end
