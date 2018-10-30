class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match("/items/")
      p_item = req.path.split("/").last
      item_array = Application.class_variable_get(:@@items)
      item = item_array.find {|item| item.name == p_item}
      if item
        resp.write item.price 
        item.price
      else 
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
      resp.finish
  end 
end

# class Application

#   @@items = []

#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)

#     if req.path.match(/items/)
#       item_name = req.path.split("/items/").last

#       item = @@items.find{|i| i.name == item_name}

#       if item.nil?
#         resp.write "Item not found"
#         resp.status = 400
#       else
#         resp.write item.price
#       end
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end

#     resp.finish
#   end
# end