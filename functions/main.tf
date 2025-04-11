# Example of various functions in Terraform

# String Functions
variable "example_string" {
    default = "Hello, Terraform!"
}

output "lowercase_example" {
    value = lower(var.example_string)
}

output "uppercase_example" {
    value = upper(var.example_string)
}

output "length_example" {
    value = length(var.example_string)
}

# Numeric Functions
variable "example_number" {
    default = 42
}

output "abs_example" {
    value = abs(-5)
}

output "ceil_example" {
    value = ceil(4.2)
}

output "floor_example" {
    value = floor(4.8)
}

# Collection Functions
variable "example_list" {
    default = ["apple", "banana", "cherry"]
}

output "contains_example" {
    value = contains(var.example_list, "banana")
}

output "length_of_list" {
    value = length(var.example_list)
}

output "join_example" {
    value = join(", ", var.example_list)
}

# Encoding Functions
output "base64encode_example" {
    value = base64encode("Hello, World!")
}

output "base64decode_example" {
    value = base64decode("SGVsbG8sIFdvcmxkIQ==")
}

# Date and Time Functions
output "timestamp_example" {
    value = timestamp()
}

# File Functions
output "file_example" {
    value = ("example.txt") # Ensure example.txt exists in the same directory
}

# Hash and Crypto Functions
output "md5_example" {
    value = md5("example")
}

output "sha256_example" {
    value = sha256("example")
}

# IP Network Functions
output "cidrhost_example" {
    value = cidrhost("192.168.1.0/24", 5)
}

output "cidrsubnet_example" {
    value = cidrsubnet("192.168.1.0/24", 2, 1)
}

# Type Conversion Functions
output "tostring_example" {
    value = tostring(123)
}

output "tolist_example" {
    value = tolist(["a", "b", "c"])
}

output "tomap_example" {
    value = tomap({ key1 = "value1", key2 = "value2" })
}