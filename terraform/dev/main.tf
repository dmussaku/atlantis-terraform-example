# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "foo_dev" {
  image = "${docker_image.nginx.latest}"
  name  = "foo_dev"

  ports {
    internal = 80
    external = 3131
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
