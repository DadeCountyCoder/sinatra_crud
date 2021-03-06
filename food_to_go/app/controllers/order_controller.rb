class OrderController < ApplicationController




    #create
    get '/orders/new' do
        erb :'/orders/new'
        #"render order form"
    end

    post '/orders/' do
        #"process our form"
        @order = Order.create(
            address: params[:address],
            item: params[:item],
            item_price: params[:item_price],
            total: params[:total]
        )
        redirect "/orders#{@order.id}"
    end



    #read
    get '/orders/:id' do
        @order = Order.find(params [:id])
        erb :'/orders/show'
    end

    get '/orders' do
        @orders = Order.all #returns array
        erb :'/orders/index'
    end



    #update

    get '/orders/:id/edit' do
        @order = Order.find(params[:id])
        erb :'/orders/edit'
    end

    post '/orders/:id' do
        @order = Order.find(params[:id])
        @order.update(
            address: params[:address],
            item: params[:item],
            item_price: params[:item_price],
            total: params[:total]
        )
        redirect "/orders/#{@order.id}"
    end



    #delete

    delete '/orders/:id/delete' do
        @order = Order.find(params[:id])
        @order.destroy
        redirect '/orders'
    end


end