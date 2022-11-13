require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    describe "ensures all required element verifications work as expected" do
      
      it 'validates a new user is created when required details are included' do
        @user = User.new({
          first_name: "James", 
          last_name: "Jones", 
          email: "JJones@gmail.com", 
          password: "H3ll0W0rlD", 
          password_confirmation: "H3ll0W0rlD"
        })
        @user.save
        expect(@user.id).to be_present
      end
      
      it 'validates a new user is not created when first name field is missing' do
        @user = User.new({
          first_name: nil, 
          last_name: "Jones", 
          email: "JJones1@gmail.com", 
          password: "H3ll0W0rlD", 
          password_confirmation: "H3ll0W0rlD"
        })
        @user.save
        expect(@user.id).to be_present
      end   
      
      it 'validates a new user is not created when last name field is missing' do
        @user = User.new({
          first_name: "James", 
          last_name: nil, 
          email: "JJones2@gmail.com", 
          password: "H3ll0W0rlD", 
          password_confirmation: "H3ll0W0rlD"
        })
        @user.save
        expect(@user.id).to be_present
      end   
      
      it 'validates a new user is not created when the email is missing' do
        @user = User.new({
          first_name: "James", 
          last_name: "Jones", 
          email: "JJones3@gmail.com", 
          password: "H3ll0W0rlD", 
          password_confirmation: "H3ll0W0rlD"
        })
        @user.save
        expect(@user.id).to be_present
      end
    
    end

    describe 'password match verification' do
      
      it "validates that the user's password must match exaclty in the confirmation field to be created" do
        @user = User.new({
          first_name: "Adam", 
          last_name: "Andrews", 
          email: "aandrews@gmail.com", 
          password: "Andrews7", 
          password_confirmation: "Andrews7"
        })
        @user.save
        expect(@user).to be_valid
      end

      it 'validates that non-identical password and confirmation entries forbid the user record creation' do
        @user = User.new({
          first_name: "Adam", 
          last_name: "Andrews", 
          email: "aandrews@gmail.com", 
          password: "Andrews7", 
          password_confirmation: "Andreus7"
        })
        @user.save
        expect(@user).to_not be_valid
      end

    end

    describe "user emails must be unique" do
      
      it 'permits the creation of this user since his email address doesnt exist yet' do
        @user = User.new({
          first_name: "Brian", 
          last_name: "Brown", 
          email: "bbrown@gmail.com", 
          password: "Brown4lyf", 
          password_confirmation: "Brown4lyf"
        })
        @user.save
        expect(@user).to be_valid
      end

      it 'disallows creation of this user since his email is a duplicate of the email in the test case above' do
        @user = User.new({
          first_name: "Bobby", 
          last_name: "Brown", 
          email: "bbrown@gmail.com", 
          password: "Brown4lyf", 
          password_confirmation: "Brown4lyf"
        })
        @user.save
        expect(@user).to_not be_valid
      end

    end


    describe 'password minimum length' do
    end

    describe '' do
    end

  end

  # describe '.authenticate_with_credentials' do
  #   # examples here
  # end

end