terraform{
  backend "s3"{
    bucket = "nishutech1112936573"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
