# frozen_string_literal: true

class UserSessionParamsContract < Dry::Validation::Contract
  params do
    required(:email).value(:string)
    required(:password_digest).value(:string)
  end

  rule(:password_digest) do
    key.failure('password cannot be empty') if value.empty?
  end
end
