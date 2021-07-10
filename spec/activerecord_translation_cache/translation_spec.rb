describe ActiverecordTranslationCache::Name do
  context 'enabled' do
    around do |example|
      ActiverecordTranslationCache.enable do
        example.run
      end
    end

    context 'active record' do
      it 'translates' do
        expect(Item.human_attribute_name(:title)).to eq('タイトル')
        expect(ActiverecordTranslationCache.cache).not_to eq({})
      end
    end

    context 'active model' do
      it 'translates' do
        expect(ItemModel.human_attribute_name(:title)).to eq('タイトル')
        expect(ActiverecordTranslationCache.cache).not_to eq({})
      end
    end
  end

  context 'disabled' do
    context 'active record' do
      it 'translates' do
        expect(Item.human_attribute_name(:title)).to eq('タイトル')
        expect(ActiverecordTranslationCache.cache).to eq(nil)
      end
    end

    context 'active model' do
      it 'translates' do
        expect(ItemModel.human_attribute_name(:title)).to eq('タイトル')
        expect(ActiverecordTranslationCache.cache).to eq(nil)
      end
    end
  end
end
