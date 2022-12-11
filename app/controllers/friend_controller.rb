# frozen_string_literal: true

# Новый контроллер
class FriendController < ApplicationController
  def input; end

  def view
    v1 = params[:v1]
    stat = 'success'
    stat = 'error' if (/^[0-9]+/=~v1).nil?
    res = []
    (1..v1.to_i).each do |number|
      sumdel = 0
      revsumdel = 0
      (1..number / 2).each do |del|
        sumdel += del if (number % del).zero?
      end
      (1..sumdel / 2).each do |revdel|
        revsumdel += revdel if (sumdel % revdel).zero?
      end
      if number == revsumdel && number != sumdel && (res[res.length - 1] != [sumdel, revsumdel])
        res.push([revsumdel, sumdel])
      end
    end
    @result = res
    respond_to do |format|
      format.html
      format.json do
        render json:
        { status: stat, value: @result }
      end
    end
  end
end
