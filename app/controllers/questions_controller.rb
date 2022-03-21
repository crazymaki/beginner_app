class QuestionsController < ApplicationController
    def index
        @test = "テストテキスト"
    end
    
    def new
        @question = Question.new
        @test = "new_テストテキスト"
    end

    def create
        @question = Question.new(question_params)
        @test = "create_テストテキスト"
        if @question.save
            flash[:notice] = '成功！'
            redirect_to('/questions/new')
        else
            flash[:notice] = '失敗！'
            render('questions/new')
        end
    end

    private
        def question_params
            params.require(:question).permit(:title, :body)
        end
end
