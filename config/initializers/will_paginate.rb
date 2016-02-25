module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options[:renderer] ||= BootstrapPagination::Rails
      super.try :html_safe
    end
  end
end
