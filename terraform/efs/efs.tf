resource "aws_efs_file_system" "eks_efs" {
    creation_token = "eks_efs"
    encrypted =  true
    performance_mode = "generalPurpose"
    throughput_mode = "elastic"
    lifecycle_policy {
      transition_to_ia = "AFTER_14_DAYS"
    } 
    lifecycle_policy {
      transition_to_archive = "AFTER_30_DAYS"
    }
    tags = var.efs
    depends_on = [ var.vpc_id ] 

     
}

resource "aws_efs_mount_target" "efs_mount_eks" {
    file_system_id = aws_efs_file_system.eks_efs.id
    count = length(var.subnet_ids)
    subnet_id = var.subnet_ids[count.index]
    security_groups = [aws_security_group.efs_SG.id]
}
