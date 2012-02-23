class Role < ActiveRecord::Base

  def name
    I18n.t(:"roles.#{role}")
  end
end
