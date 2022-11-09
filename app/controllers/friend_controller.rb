class FriendController < ApplicationController
  def input
  end

  def view
    v1 = params[:v1].to_i
    res=[]
    (1..v1).each do |number|
      sumdel = 0
      revsumdel = 0
      (1..number / 2).each do |del|
        if number % del == 0
          sumdel += del
        end
      end
      (1..sumdel / 2).each do |revdel|
        if sumdel % revdel == 0
          revsumdel += revdel
        end
      end
      if number == revsumdel && number != sumdel
        res.push([revsumdel, sumdel]) if res[res.length-1]!=[sumdel, revsumdel]
      end
    end
    @result = res
  end
end

