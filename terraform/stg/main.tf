# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "foo_stg" {
  image = "${docker_image.nginx.latest}"
  name  = "foo_stg"

  ports {
    internal = 80
    external = 3141
  }
}

resource "docker_image" "nginx" {
  name = "nginx:stable"
}
