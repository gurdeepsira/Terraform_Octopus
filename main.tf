
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


resource "octopusdeploy_machine" "Production" {
  name                            = "GLOVSIISD01"
  environments                    = ["${data.octopusdeploy_environment.staging.id}"]
  isdisabled                      = false
  machinepolicy                   = "${data.octopusdeploy_machinepolicy.default.id}"
  roles                           = ["Production"]
  tenanteddeploymentparticipation = "Untenanted"

  endpoint {
    communicationstyle = "TentaclePassive"
    thumbprint         = "81D0FF8B76FC"
    uri                = "https://finance-web-01:10933"
  }