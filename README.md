[![Build](https://github.com/hsuliz/terraform-ansible-sample/actions/workflows/build.yml/badge.svg)](https://github.com/hsuliz/terraform-ansible-sample/actions/workflows/build.yml)

# Read me

Example CI/CD of using AWS, Terraform, Ansible and GitHub Actions to automate:
- Build, run tests, lint and pushes to Docker Hub if on main branch
- Onboard, which creates infrastructure for us
- Destroy, destroys infrastructure
- Promote, promotes new Image to existing infrastructure
- Release, releasing new version based on input