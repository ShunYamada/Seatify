class StaticPagesController < ApplicationController
  def index
    @seats = Seat.all
  end
end
