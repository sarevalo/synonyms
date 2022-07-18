unless Word.exists?
  5.times do
    word = FactoryBot.create(:word)
    FactoryBot.create_list(:synonym, 2, word: word)
  end
end
