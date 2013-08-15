module Features
  def spot(name)
    find('.spot aside', text: name)
  end
end