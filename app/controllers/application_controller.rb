class ApplicationController < ActionController::Base
    User.limit(1)
end
