require 'randexp'
require 'faker'
require 'forgery'


class Randgen
  def self.rand_name(options = {})
    /#{Forgery::Basic.color}-#{Faker::Name.first_name}-\d{4}/.gen.downcase
  end
end

module Lita
  module Handlers
    class RandomName < Handler
      route(/random[_]?name/, :random_name)

      def random_name(response)
        response.reply /[:rand_name:]/.gen
      end

      Lita.register_handler(self)
    end
  end
end
