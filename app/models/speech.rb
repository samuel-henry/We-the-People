class Speech < ActiveRecord::Base
  attr_accessible :date, :location, :speaker, :speech_text, :title
end
