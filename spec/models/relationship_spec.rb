require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe '#preload_test' do
    let!(:instance) { Relationship.new }
    before do
    end
    context '全てのデータが正しいとき' do
      it '登録できること' do
        evaluation_log_ids = instance.send(:aisatsu)
        instance.instance_variable_set(:@evaluation_log_ids, evaluation_log_ids)
        instance.send(:messi)
      end
    end
  end
end
