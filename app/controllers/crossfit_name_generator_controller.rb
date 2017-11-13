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

            if res.code != "200"
              @message = "That word doesn't exist in our dictionary."
            else

              hash = JSON.parse(res.body)

              @business_names = []

              hash.keys.each do |x|
                if x == "adjective"
                  hash.fetch("adjective")["sim"].each{ |x| @business_names << x }
                elsif x == "noun"
                  hash.fetch("noun")["syn"].each{ |x| @business_names << x }
                end
              end
              @counter.count += 1
              @counter.save
            end

          end #end of if statement

        end #end of format.js

    end #end of respond_to

  end # end of create action

  def show
  end

end
