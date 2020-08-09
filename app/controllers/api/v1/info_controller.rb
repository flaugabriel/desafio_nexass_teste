module Api
  module V1
    class InfoController < ApplicationController
      def info
        render json: { msg: 'Yay! You’re on Rails!', version: '0.0.1' }
      end
    end
  end
end
