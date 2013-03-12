class Speech < ActiveRecord::Base
  attr_accessible :date, :location, :speaker, :text, :title
  #serialize :text
end
