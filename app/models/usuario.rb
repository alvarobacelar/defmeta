class Usuario < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nome, presence: true

  enumerize :perfil, in: [:administrador, :comum], default: :comum, predicates: true, scope: true

  scope :ativo, -> { where(ativo: true) }

  def active_for_authentication?
    ativo
  end

end
