require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "verifies a category with a name will save" do
      @category = Category.new({
        name: "Test Category"
      })
      @category.save!
      expect(@category.id).to be_present
    end

    it "verifies a product created with name, price, quantity and category will save" do
      @category = Category.new(name: "Test Category")
      @category.save!
      @product = Product.new({
        name: "Big Expensive Tree",
        category_id: @category.id, 
        quantity: 240,
        price: 2999})
      @product.save!
      expect(@product.id).to be_present
    end

    it "verifies a product created witout a name will not save" do
      @category = Category.new(name: "Test Category")
      @category.save!
      @product = Product.new({
        name: nil,
        category_id: @category.id, 
        quantity: 240,
        price: 2999})
      @product.save!
      expect(@product.name).to_not be_present
    end
    
    it "verifies a product created witout a category_id will not save" do
      @category = Category.new(name: "Test Category")
      @category.save!
      @product = Product.new({
        name: "Big Expensive Tree",
        category_id: nil, 
        quantity: 240,
        price: 2999})
      @product.save!
      expect(@product.category_id).to_not be_present
    end
  
    it "verifies a product created witout a quantity will not save" do
      @category = Category.new(name: "Test Category")
      @category.save!
      @product = Product.new({
        name: "Big Expensive Tree",
        category_id: @category.id, 
        quantity: nil,
        price: 2999})
      @product.save!
      expect(@product.quantity).to_not be_present
    end

    it "verifies a product created witout a price will not save" do
      @category = Category.new(name: "Test Category")
      @category.save!
      @product = Product.new({
        name: "Big Expensive Tree",
        category_id: @category.id, 
        quantity: 240,
        price: nil})
      @product.save!
      expect(@product.price).to_not be_present
    end
  
  end


end

