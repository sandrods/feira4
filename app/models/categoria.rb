class Categoria < ActiveRecord::Base

  VENDAS = 2

  scope :por_cd, ->(cd) { where(cd: cd) }

end
