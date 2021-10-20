Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :username
      String :email
      Boolean :admin

      DateTime :created
      DateTime :updated

      unique :username
    end
  end
end
