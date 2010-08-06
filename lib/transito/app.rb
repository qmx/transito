require 'sinatra/base'
require 'open-uri'
require 'hpricot'
require 'haml'

module Transito
	class App < Sinatra::Base
		set :root, File.expand_path("../../../", __FILE__)
		get '/' do
			begin
			@lentidao = Hpricot(open("http://cetsp1.cetsp.com.br/monitransmapa/agora/"))./('//div[@id=lentidao]/b').inner_text
				haml :index
			rescue
				haml :erro
			end
		end
	end
end
