class Api::V1::ApiController < ApplicationController
  def start
    render json: {
        message: 'welcome'
    }
  end
end