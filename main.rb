require 'dotenv'
require 'yandex-translator'
require 'yaml'

Dotenv.load

translator = Yandex::Translator.new(ENV['YANDEX_API_KEY'])
# puts translator.translate 'Car', from: 'en', to: 'ru'

file = YAML.load_file('tmp/input.yml')
