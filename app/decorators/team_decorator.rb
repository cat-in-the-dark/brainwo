class TeamDecorator < Draper::Decorator
  delegate_all

  def killed?
    object.status == 'killed'
  end

  def alive?
    object.status == 'alive'
  end
end
