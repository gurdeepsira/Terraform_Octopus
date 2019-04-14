
provider "octopusdeploy" {
  address = "http://octopus.production.yolo"
  apikey  = "API-XXXXXXXXXXXXX"
}

resource "octopusdeploy_project_group" "BuildOverview Project Group" {
  description = "Projects for the deployment of BuildOverview"
  name        = "BuildOverview Project Group"
}


resource "octopusdeploy_project" "BuildOverview ASP.NET Project" {
  description           = "Core release"
  lifecycle_id          = "Lifecycles-1"
  name                  = "BuildOverview"
  project_group_id      = "${octopusdeploy_project_group.finance.id}"
  skip_machine_behavior = "SkipUnavailableMachines"
}