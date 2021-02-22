RSpec.shared_context 'User factory', shared_context: :metadata do
  let(:manager) { FactoryBot.create(:manager_user) }
  let(:employee) { FactoryBot.create(:employee_user) }

  # def create_onliner_content
  #   FactoryBot.create(:content, :onliner, year: Integer(data_expected[0]), mood: data_expected[1])
  # end  
end

RSpec.configure do |rspec|
  rspec.include_context 'User factory', include_shared: true  
end