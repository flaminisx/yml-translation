require 'dotenv'
require 'yandex-translator'
require 'yaml'

Dotenv.load

$translator = Yandex::Translator.new(ENV['YANDEX_API_KEY'])
# puts translator.translate 'Car', from: 'en', to: 'ru'

file = YAML.load_file('tmp/input.yml')

def through_every_value(obj)
  temp = {}
  obj.each do |k, v|
    if v.is_a?(Hash)
      temp[k] = through_every_value(v)
    else
      temp[k] = $translator.translate v, from: 'en', to: 'ru'
    end
  end
  temp
end

File.open('tmp/output.yml', 'w+') {|f| f.write through_every_value(file).to_yaml } 