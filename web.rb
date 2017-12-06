require 'sinatra/base'

module Ombuddy
  class Web < Sinatra::Base
    get '/' do
      'Reporting is good for you.'
    end
  end
end
