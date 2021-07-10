describe ActiverecordTranslationCache::Name do
  context 'enabled' do
    around do |example|
      ActiverecordTranslationCache.enable do
        example.run
      end
    end

    context 'active record' do
      it 'translates' do
        expect(Item.model_name.human).to eq('アイテム')
        expect(ActiverecordTranslationCache.cache).not_to eq({})
      end
    end

    context 'active model' do
      it 'translates' do
        expect(ItemModel.model_name.human).to eq('アイテム')
        expect(ActiverecordTranslationCache.cache).not_to eq({})
      end
    end
  end

  context 'disabled' do
    context 'active record' do
      it 'translates' do
        expect(Item.model_name.human).to eq('アイテム')
        expect(ActiverecordTranslationCache.cache).to eq(nil)
      end
    end

    context 'active model' do
      it 'translates' do
        expect(ItemModel.model_name.human).to eq('アイテム')
        expect(ActiverecordTranslationCache.cache).to eq(nil)
      end
    end
  end
end
