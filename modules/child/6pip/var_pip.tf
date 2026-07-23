variable "child_pip" {
  type = map(object({
    pip_name = string
    rg_name= string
    location= string
    allocation_method = string
    tags = map(string)
    
  }))
}