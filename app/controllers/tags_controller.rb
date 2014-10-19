class TagsController < ApplicationController
  def _show
    @tags = Tag.all
  end

end
