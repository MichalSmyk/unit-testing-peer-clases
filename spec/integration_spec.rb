require_relative '../lib/diary'
require_relative '../lib/secret_diary'

RSpec.describe 'integrates' do 
    context 'initially' do 
        it 'does not read the content cuz its locked' do
            diary = Diary.new("my lovely contents")
            secret_diary = SecretDiary.new(diary)
            expect { secret_diary.read }.to raise_error "Go away!"
        end
    end
    context 'when it is unlocked' do
        it ' returns diary contents' do 
            diary = Diary.new("my lovely contents")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            expect(secret_diary.read).to eq "my lovely contents"
        end
    end
    context 'locks diary again ' do
        it 'does not read the diary because its locked' do 
            diary = Diary.new("my lovely contents")
            secret_diary = SecretDiary.new(diary)
            secret_diary.lock
            expect { secret_diary.read }.to raise_error "Go away!"
        end
    end
end