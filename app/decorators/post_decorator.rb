class PostDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

end
