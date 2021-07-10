describe ActiverecordTranslationCache::Middleware do
  let :app do
    Class.new do
      def initialize
      end

      def call(env)
        Item.model_name.human
      end
    end
  end

  let :middleware do
    ActiverecordTranslationCache::Middleware.new(app.new)
  end

  it 'translates options' do
    expect(middleware.call({})).to eq('アイテム')
  end
end
