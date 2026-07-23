variable "child_rg" {

    type = map(object({
      rg_name = string
      location =string
    }))
  
}