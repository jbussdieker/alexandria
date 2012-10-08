module Alexandria
  class Data
    def self.user_list
      require 'sqlite3'
      d = SQLite3::Database.new("/home/jbussdieker/jbussdieker/appian/db/development.sqlite3")
      d.query("select name from users").collect {|user| user[0]}

      #["jbussdieker"]
    end

    def self.user_keys(name)
      require 'sqlite3'
      d = SQLite3::Database.new("/home/jbussdieker/jbussdieker/appian/db/development.sqlite3")
      d.query("select key_data from rsa_keys inner join users on rsa_keys.user_id=users.id where users.name='#{name}'").collect {|key| key[0]}

      #if name == "jbussdieker"
      #  ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8tkChMszepqJQG6j4B71Qc3y/MR4zv29qkBM6DGA/nlWfdCnelQI0Z881e4FNEaBN6D85fYBZ0YNDPajwYy3dHHjHcEL3qeZ7a2H67e13LwSLcWavarr3yUooAh3zLg68XnxABcvLpqv6gb/tc3mB8G54320UE9ie+IO1AyICybHQgOjVx9BK/jWnZuQoa8EHCt+cHpPddIT+3vovpKYv7ygKG7TtTuMYNBME2+gaDb0hZj6Afg+CoJeg5XoK2DvZE2Vebh3Ty0MFmpHQIeMkSk8UcMXh0jqrgiwe3AWJR19h3Dn+lricVvBWVIQax3ye3e0iv42VsYLkJrH0m5gv jbussdieker@host"]
      #else
      #  []
      #end
    end
  end
end
