class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
      
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        
        if @comment.save
            redirect_back(fallback_location: root_path)
            p "セーブされました"
        else
            redirect_back(fallback_location: root_path)
            p "セーブされませんでした"
        end
    
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        comment = @post.comments.find(params[:id])
        p comment
        if comment.destroy
        redirect_back(fallback_location: root_path)
        p "削除"
        end
    end
    
   
    
    private
    def comment_params
        params.require(:comment).permit(:comment_content, :user_id, :post_id)
    end
end
