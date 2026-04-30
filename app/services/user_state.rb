class UserState
  def initialize
    @states = {}
  end

  def set(chat_id, state)
    @states[chat_id] = state
  end

  def get(chat_id)
    @states[chat_id]
  end

  def clear(chat_id)
    @states.delete(chat_id)
  end
end