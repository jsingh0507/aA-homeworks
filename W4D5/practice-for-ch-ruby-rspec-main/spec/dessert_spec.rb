require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:oat) { Dessert.new("oat", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(oat.type).to eq("oat")
    end
    it "sets a quantity" do
      expect(oat.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(oat.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      oat.add_ingredient("chocolate")
      expect(oat.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        oat.add_ingredient(ingredient)
      end

      expect(oat.ingredients).to eq(ingredients)
      oat.mix!
      expect(oat.ingredients).not_to eq(ingredients)
      expect(oat.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      oat.eat(2)
      expect(oat.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {oat.eat(15)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jass the Great Baker")
      expect(oat.serve).to eq("Chef Jass the Great Baker has made 10 oats!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(oat)
      oat.make_more
    end
  end
end