class SubscriptionsController < ApplicationController


  def index

  	@subscribable = find_subscribable
  	@subscriptions = @subscribable.subscriptions

  end

  def create
  	@subscription=Subscription.new
  	@subscribable= find_subscribable
  	@subscription.subscribable = @subscribable
  	@subscription.user = current_user
    @subscription.save

    respond_to do |format|
        format.html { redirect_to @subscribable, notice: 'You are subscribed to this topic.' }
        format.json { head :no_content }
    end

  end




  def unsubscribe
  end

	def find_subscribable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end
end
