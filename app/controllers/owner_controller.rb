class OwnerController < ApplicationController
  before_filter :authenticate_owner!
  layout 'owner/layouts/application'
end