class Bookmark < ApplicationRecord
    has_many :types, dependent: :delete_all
    enum status: [:Privado, :Publico]
    validates :status, presence: true
end
