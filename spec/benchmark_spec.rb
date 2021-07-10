require 'benchmark'

describe 'benchmark' do
  context 'model_name' do
    it 'improves performance' do
      n = 1000
      Benchmark.bmbm do |x|
        x.report("without cache") do
          n.times { ItemModel.model_name.human }
        end
        x.report("with cache (0% hit)") do
          n.times { ActiverecordTranslationCache.enable { ItemModel.model_name.human } }
        end
        x.report("with cache (100% hit)") do
          ActiverecordTranslationCache.enable { n.times { ItemModel.model_name.human } }
        end
      end
    end
  end

  context 'human_attribute_name' do
    it 'improves performance' do
      n = 1000
      Benchmark.bmbm do |x|
        x.report("without cache") do
          n.times { ItemModel.human_attribute_name(:title) }
        end
        x.report("with cache (0% hit)") do
          n.times { ActiverecordTranslationCache.enable { ItemModel.human_attribute_name(:title) } }
        end
        x.report("with cache (100% hit)") do
          ActiverecordTranslationCache.enable { n.times { ItemModel.human_attribute_name(:title) } }
        end
      end
    end
  end
end
