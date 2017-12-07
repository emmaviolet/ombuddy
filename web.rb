require 'sinatra/base'

module Ombuddy
	class Web < Sinatra::Base
		post '/' do
			Ombuddy::Services::StartReportingProcess.call(params)
		end
	end
end
