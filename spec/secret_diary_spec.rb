require_relative '../lib/secret_diary'

RSpec.describe SecretDiary do 
    it 'rises an error when its locked' do 
        diary = double :diary
        secret_diary = SecretDiary.new(diary)
        expect { secret_diary.read }.to raise_error "Go away!"
    end
    it 'reads the content when its unlocked' do 
        diary = double :diary, read: "my lovely contents"
        secret_diary = SecretDiary.new(diary)
        secret_diary.unlock
        expect(secret_diary.read).to eq ("my lovely contents")
    end
    it 'unlocks and locks the diary ' do
        diary = double :diary
        secret_diary = SecretDiary.new(diary)
        secret_diary.unlock
        secret_diary.lock
        expect { secret_diary.read }.to raise_error "Go away!"
    end
end