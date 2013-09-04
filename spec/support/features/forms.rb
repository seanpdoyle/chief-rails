module Features
  def submit_form
    find('input[type=submit]').click
    expect(current_path).to be
  end
end