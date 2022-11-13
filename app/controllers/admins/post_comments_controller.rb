class  Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def create
    recipe = Recipe.find(params[:id])
    comment = current_user.post_comments.new(post_comment_params)
    # 以下のように記述したものと変わりません。
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id
    comment.recipe_id = recipe.id
    comment.save!
    redirect_to users_recipe_path(comment.recipe_id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    PostComment.find(params[:post_comments_id]).destroy
    redirect_to users_recipe_path(recipe.id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
