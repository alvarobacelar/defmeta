class WelcomeController < ApplicationController
  def index
    @metas = Meta.periodo(Date.today).count
    @todas_metas = Meta.periodo(Date.today)
  end
end
