class CommentsController < ApplicationController
    before_action :find_post, only: [:create, :edit, :update, :destroy]
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body, :user_id, :username))
        @comment.username = current_user.username
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:name, :body, :user_id, :username)
    end
end
