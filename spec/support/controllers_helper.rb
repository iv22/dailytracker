# frozen_string_literal: true

RSpec.shared_context 'shared controller data', shared_context: :metadata do
  let(:json_body) { response.body }

  def user_fields(user)
    {
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      role: user.role
    }
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'shared controller data', include_shared: true
end
