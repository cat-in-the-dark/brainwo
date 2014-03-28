class TeamDecorator < Draper::Decorator
  delegate_all

  def killed?
    object.status == 'killed'
  end

  def alive?
    object.status == 'alive'
  end

  def victim_name
    if object.victim
      object.victim.name
    else
      ''
    end
  end
end
