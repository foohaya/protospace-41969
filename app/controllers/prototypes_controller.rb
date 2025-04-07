class PrototypesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params.merge(user_id: current_user.id))
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプが作成されました"
    else
      render :new
    end
  end

      def show
        @prototype = Prototype.find(params[:id])
        @comment = @prototype.comments.build
        @comments = @prototype.comments.includes(:user) 
      end

      def edit
        @prototype = Prototype.find(params[:id])
      end

      def update
        @prototype = Prototype.find(params[:id])
        if @prototype.update(prototype_params)  # フォームから送信されたデータで更新
          redirect_to prototype_path(@prototype), notice: "プロトタイプが更新されました"  # 更新後、詳細ページへ遷移
        else
          render :edit  # 更新が失敗した場合は、再度編集ページを表示
        end
      end

      def destroy
        @prototype = Prototype.find(params[:id])
        @prototype.destroy 
        redirect_to root_path, notice: "プロトタイプを削除しました"
      end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_root
    unless current_user == @prototype.user
      redirect_to root_path, alert: "アクセス権限がありません"
    end
  end
end