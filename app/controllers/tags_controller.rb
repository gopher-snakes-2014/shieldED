class TagsController < ApplicationController

  def show
    @tags = Tag.all
    render partial: 'tags/show'
  end

end

