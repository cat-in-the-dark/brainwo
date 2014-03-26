class PaginatingDecorator < Draper::CollectionDecorator
  # suppport for will_paginate
  delegate :current_page, :total_entries, :total_pages, :limit_value, :per_page, :offset
end