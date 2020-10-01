require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end
end