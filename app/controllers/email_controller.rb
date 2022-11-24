class EmailController < ApplicationController
    def index
        @emails = Email.all
    end

    def create
        @email_new = Email.create(object: Faker::Games::Overwatch.quote, body: Faker::Lorem.sentence(word_count: 30))

        if @email_new.save
            respond_to do |format|
                format.html { redirect_to root_path }
                format.js {}
            end
        else
            respond_to do |format|
                format.html { redirect_to root_path }
                format.js {}
            end
            flash[:notice] = "Please try again later"
        end

    end

    def show
        @email = Email.find(params[:id])
        @email.update(read: true)
    end

    def update
        @email = Email.find(params[:id])
        @email.toggle(:read).save

        respond_to do |format|
            format.html { redirect_to root_path }
            format.js {}
        end
    end

    def destroy
        @email = Email.find(params[:id])
        @email.destroy

        respond_to do |format|
            format.html { redirect_to root_path }
            format.js {}
        end
    end
end
