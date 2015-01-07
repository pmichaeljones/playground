class CrossfitNameGeneratorController < ApplicationController

  def new
    @counter = Counter.where(name:"CrossFit").first
  end

  def create
    @counter = Counter.where(name:"CrossFit").first

      respond_to do |format|

        format.js do

          if params[:query].empty? || ((params[:query] =~ /\s/).nil? == false)

          else

            require 'net/http'

            uri = URI("http://words.bighugelabs.com/api/2/#{ENV['BIG_THES_KEY']}" + "/" + "#{params[:query]}" + "/json")

            res = Net::HTTP.get_response(uri)

            @reply_code = res.code

            if @reply_code == "404"

            else

              hash = JSON.parse(res.body)

              @counter.count += 1
              @counter.save
              @business_names = hash["adjective"]["sim"]

            end

          end #end of if statement

        end #end of format.js

    end #end of respond_to

  end # end of create action

  def show
  end

end
