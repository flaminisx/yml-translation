require 'dotenv'
require 'yandex-translator'

Dotenv.load

translator = Yandex::Translator.new(ENV['YANDEX_API_KEY'])

puts translator.translate 'Car', from: 'en', to: 'ru'
