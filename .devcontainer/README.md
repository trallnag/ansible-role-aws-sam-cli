# Dev container

This project supports [Development Containers](https://containers.dev/) only
partially. Running containerized tests and everything related to systemd is not
supported. Why? Getting systemd propagated from the host to the dev container to
the containers spun up by Ansible Molecule seems to be really tricky.
