terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}


resource "docker_image" "simplegoservice" {
 name         = "registry.gitlab.com/alta3/simplegoservice"
 keep_locally = true      // keep image after "destroy"
}

resource "docker_container" "simplegoservice" {
 image = docker_image.simplegoservice.image_id
 network_mode = "bridge"
 name = "simple_service"
 ports {
   internal = var.internal_port #9876
   external = var.external_port #5432
 }
}

