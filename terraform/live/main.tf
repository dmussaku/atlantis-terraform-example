# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "foo_live" {
  image = "${docker_image.nginx.latest}"
  name  = "foo_live"

  ports {
    internal = 80
    external = 3161
  }
}

resource "docker_image" "nginx" {
  name = "nginx:1.16.1-alpine"
}
