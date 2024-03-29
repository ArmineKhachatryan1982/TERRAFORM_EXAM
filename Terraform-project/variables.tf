variable "subnet_ids" {

    type = list(string)
    default = [
        "subnet-0bb6fda626d74b0ae",
        "subnet-09f6eceeabe51873f",
        "subnet-04fc4d11191214caa"
    ]
}
variable "vpc_id" {
    type = string
    default = "vpc-0260253a2c8ed1c85"
}
variable "security_grp" {
    type = list
    default = ["sg-010ee67d4f250712f"]
}
