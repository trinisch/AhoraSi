class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :titulo, presence: { message: "El título es obligatorio" }
  validates :sigla_ramo, presence: { message: "La sigla del ramo es obligatoria" }
  validates :precio, presence: { message: "El precio es obligatorio" }
  validates :descripcion, presence: { message: "La descripción es obligatoria" }
end
