output "aws_instances" {
    value = aws_instance.ubuntu.*.id
   
 }


 output "ec2_sg" {
     value = aws_security_group.ec2_sg.id
     
 }