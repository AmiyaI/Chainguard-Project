module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  # Set the name for the EKS cluster
  cluster_name = local.name
  
  # Allow public access to the EKS cluster endpoint
  cluster_endpoint_public_access = true

  # Define EKS cluster addons
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  # Set the VPC and subnets for the EKS cluster
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  # Default configurations for EKS Managed Node Groups
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"          # Amazon Linux 2 AMI for worker nodes
    instance_types = ["m5.large"]          # Default instance type for worker nodes

    attach_cluster_primary_security_group = true # Attach the primary security group to worker nodes
  }

  # Define the Managed Node Groups for the EKS cluster
  eks_managed_node_groups = {
    amc-cluster-wg = {
      min_size     = 1                    # Minimum number of instances in the node group
      max_size     = 2                    # Maximum number of instances in the node group
      desired_size = 1                    # Desired number of instances in the node group

      instance_types = ["t3.medium"]      # Instance type for this specific node group
      capacity_type  = "SPOT"             # Use spot instances to reduce costs

      # Additional tags for the resources created in this node group
      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  # Apply tags to the EKS resources
  tags = local.tags
}