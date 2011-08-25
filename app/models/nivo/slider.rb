module Nivo
  class Slider < ActiveRecord::Base
    attr_accessible :caption, :url, :active, :lft, :rgt

    def self.page(search, page)
      with_permissions_to(:manage).search(search).order("caption").paginate(:per_page => 12, :page => page)
    end

    def self.search(search)
      if search
        where("caption LIKE ?", "%#{search}%")
      else
        scoped
      end
    end
  end
end
