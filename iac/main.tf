resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
    variavel_inexistente = var.variavel_inexistente


    tags = {
        Name = "Hello World"
    }
}