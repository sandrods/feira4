class Categoria < ActiveRecord::Base

  scope :por_cd, ->(cd) { where(cd: cd) }

end
