/* main.tf
   Alta3 Research - rzfeeser@alta3.com */

# terraform block
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

// interact with docker
provider "docker" {}

resource "docker_network" "ansible-net" {
  name = "ansible-net"
  ipam_config {
  subnet = "10.10.2.0/24"
  }
}

// create our image
resource "docker_image" "fry" {
  name         = "ssh-fry:latest"
  keep_locally = true
  build {
    path = "/home/student/mycode/ansible-tf/"    # path to Dockerfile
    tag = ["ssh-fry"]
    build_arg = {
      user : "fry"
    }
  }
}

resource "docker_container" "fry" {
  name = "fry"
  image = docker_image.fry.name
  network_mode = "bridge"
  hostname = "fry"

  networks_advanced {
    name = docker_network.ansible-net.name
    aliases = ["ansible-net"]
    ipv4_address = "10.10.2.4"  
  }
}

// create our image
resource "docker_image" "moe" {
  name         = "ssh-moe:latest"
  keep_locally = true
  build {
    path = "/home/student/mycode/ansible-tf/"    # path to Dockerfile
    tag = ["ssh-moe"]
    build_arg = {
      user : "moe"
    }
  }
}

resource "docker_container" "moe" {
  name = "moe"
  image = docker_image.moe.name
  network_mode = "bridge"
  hostname = "moe"

  networks_advanced {
    name = docker_network.ansible-net.name
    aliases = ["ansible-net"]
    ipv4_address = "10.10.2.5"
  }
}

// create our image
resource "docker_image" "larrythecableguy" {
  name         = "ssh-larrythecableguy:latest"
  keep_locally = true
  build {
    path = "/home/student/mycode/ansible-tf/"    # path to Dockerfile
    tag = ["ssh-larrythecableguy"]
    build_arg = {
      user : "larrythecableguy"
    }
  }
}

resource "docker_container" "larrythecableguy" {
  name = "larrythecableguy"
  image = docker_image.larrythecableguy.name
  network_mode = "bridge"
  hostname = "larrythecableguy"

  networks_advanced {
    name = docker_network.ansible-net.name
    aliases = ["ansible-net"]
    ipv4_address = "10.10.2.6"
  }
}

// create our image
resource "docker_image" "ace" {
  name         = "ssh-ace:latest"
  keep_locally = true
  build {
    path = "/home/student/mycode/ansible-tf/"    # path to Dockerfile
    tag = ["ssh-ace"]
    build_arg = {
      user : "ace"
    }
  }
}

resource "docker_container" "ace" {
  name = "ace"
  image = docker_image.larrythecableguy.name
  network_mode = "bridge"
  hostname = "ace"

  networks_advanced {
    name = docker_network.ansible-net.name
    aliases = ["ansible-net"]
    ipv4_address = "10.10.2.7"
  }
}
