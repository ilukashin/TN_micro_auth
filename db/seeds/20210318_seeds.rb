Sequel.seed(:development) do 
  def run
    User.create(name: 'Seed',
                 email: 'seed@example.com',
                 password_digest: 'givemeatoken' )
  end
end
