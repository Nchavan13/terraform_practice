output "public_ip" {
  value= aws_instance.web.public_ip
}

output "availability_zone" {
  value= aws_instance.web.availability_zone
}

output "private_ip" {
  value= aws_instance.web.private_ip
  sensitive = true
}