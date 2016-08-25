module FlagsHelper

  def flag_params(params)
    params.require('flag').permit(:answer_id)
  end
end
