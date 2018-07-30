require 'rails_helper'

RSpec.describe DatabaseSeeder::Users do
    it "generates records succesfully" do
        expect(DatabaseSeeder::Users.seed.empty?).to be false
    end
end
