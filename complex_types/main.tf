terraform {
  required_version = ">= 0.12"
}

variable "planet" {
  type        = list
  default     = ["mars", "earth", "jupiter"]
  description = "List of planets"
}

variable "plans" {
  type        = map
  default     = {
    "PlanA"    = "10CAD"
    "PlanB"    = "20CAD"
    "PlanC"    = "30CAD"
  }
}


variable "plans_object" {
  type        = object({
    PlanA = string
    PlanB = number
  })
  default     = {
    PlanA = "10CAD"
    PlanB = 20
  }
}

variable "random" {
  type        = tuple([string, number, bool])
  default     = ["hello", 10, true]
}