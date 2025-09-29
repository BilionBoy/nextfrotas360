class HomeController < ApplicationController

  def index
    if current_user.gestor?
      render :gestor
    elsif current_user.fornecedor?
      render :fornecedor
    else
      render :index  
    end
  end
end
