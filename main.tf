provider "aws" {
  region = "us-west-2"
}

variable "cidr-blocks" {
  description = "cidr blocks and name tags for vpc and subnet"
  type        = list(object({
    cidr_block = string
    name = string
  }))
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = var.cidr-blocks[0].cidr_block

  tags = {
    Name = var.cidr-blocks[0].name
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.cidr-blocks[1].cidr_block
  availability_zone = "us-west-2a"

  tags = {
    Name = var.cidr-blocks[1].name
  }
}
