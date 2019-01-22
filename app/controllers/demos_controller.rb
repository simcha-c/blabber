class DemosController < ApplicationController
  def bananas # actions that look like methods
    # need to give a response, render/redirect
    # can render plain(text), html, json, etc.
      # json: javascript object notation
    render plain: 'hello world!'
  end
end