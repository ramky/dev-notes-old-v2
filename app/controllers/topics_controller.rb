class TopicsController < ApplicationController
  def index
    todos = Topic.all_for_account(current_account.id)
    json_response(todos)
  end
end
