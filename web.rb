require 'sinatra/base'

module Ombuddy
  class Web < Sinatra::Base
    get '/' do
      'Reporting is good for you.'
    end

    post '/' do
    	200
    end
  end
end
