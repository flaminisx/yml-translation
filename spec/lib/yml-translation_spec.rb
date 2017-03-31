require 'yml-translation'
require 'fileutils'
require 'dotenv'

RSpec.describe YmlTranslation, '#translate_hash' do
  it 'translates hashes from english to russian' do
    Dotenv.load
    translator = YmlTranslation.new ENV['YANDEX_API_KEY']
    result = translator.translate_hash( { value: "value" }, {from: 'en', to: 'ru'})
    expect(result[:value]).to eq('значение')
  end

  it 'translates files from english to russian' do
    Dotenv.load
    translator = YmlTranslation.new ENV['YANDEX_API_KEY']
    FileUtils.rm('tmp/output.yml')
    translator.translate_file
    expect(File.file? 'tmp/output.yml').to eq(true)
  end
end
