class Bookmark < ApplicationRecord
    has_many :types, dependent: :delete_all
end
