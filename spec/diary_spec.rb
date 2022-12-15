require_relative '../lib/diary'

RSpec.describe Diary do 
    it 'initializes' do
        diary = Diary.new("my lovely contents")
        expect(diary.read).to eq ("my lovely contents")
    end
end