class ProcessController < ApplicationController
  def new
    @roles = Role.all
  end
end
