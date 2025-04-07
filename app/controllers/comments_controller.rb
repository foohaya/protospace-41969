class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])  
    @comment = @prototype.comments.build(comment_params)
    
    if @comment.save
      redirect_to prototype_path(@prototype), notice: "コメントが投稿されました"
    else
      render "prototypes/show"  # コメント作成が失敗した場合
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)  # 現在ログインしているユーザーIDを追加
  end
end
