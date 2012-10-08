module Alexandria
  class Data
    def self.user_list
      ["jbussdieker", "jaja"]
    end

    def self.user_keys(name)
      if name == "jbussdieker"
        [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8tkChMszepqJQG6j4B71Qc3y/MR4zv29qkBM6DGA/nlWfdCnelQI0Z881e4FNEaBN6D85fYBZ0YNDPajwYy3dHHjHcEL3qeZ7a2H67e13LwSLcWavarr3yUooAh3zLg68XnxABcvLpqv6gb/tc3mB8G54320UE9ie+IO1AyICybHQgOjVx9BK/jWnZuQoa8EHCt+cHpPddIT+3vovpKYv7ygKG7TtTuMYNBME2+gaDb0hZj6Afg+CoJeg5XoK2DvZE2Vebh3Ty0MFmpHQIeMkSk8UcMXh0jqrgiwe3AWJR19h3Dn+lricVvBWVIQax3ye3e0iv42VsYLkJrH0m5gv somecomment",
        ]
      elsif name == "jaja"
        [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyYDBDNRbleec7bJZPZm2v6P0uj+y6mbl49jgU5zaRfcYLlA7Bh3JunfSK7GSwOr+Ex4gugTieMTYTV2mzustPJOI+OlYaAYYU0QCj31R3Zs0UYatOAV/FD5l6oNnIaD8p0/9PlUQiFfxtWuNz2x733DyT4IEHvvzIiMTlmpLvQxQNe6WYju5zXlZ+1U6p+JGrPLg98HuzsXnzkK2xGcAaDCZGaRIk0dIhTlsUMeBJMGM32iTdprixUTFCjvN1AFNzOKbcmpHZcUZuvwd30rZZlyruiItZg3qoNw70XoBBqDHEZUDQ+hV/5f3/T/onhfieYmPclqyOWgQvRTiJw3ix root@synapse.jbussdieker.com",
        ]
      end
    end
  end
end
