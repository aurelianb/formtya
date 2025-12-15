class FormItemOptionsController < ApplicationController
  def new
    @form_item_option = FormItemOption.new
    @form_item_id = params.expect(:form_item_id)
  end
end
