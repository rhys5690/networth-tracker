require_relative 'dog'

describe Dog do
  describe '#bark' do
    it 'returns the string woof!' do
      dog = Dog.new
      expect(dog.bark).to eql('Woof!')
    end
  end
end
