class FormItemsController < ApplicationController
  def new
    @form_item = FormItem.new
  end
end
