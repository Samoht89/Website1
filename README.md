<h1> Create Your own webpage in docker </h1>
<center><h2>For IT Students at upper secondary school: tutorial github/docker project</h2></center>


<center><h3>Software to use</h3></center>
<b>Github Desktop Application</b> to sync the respitory from desktop to gihub and the other way: https://desktop.github.com/
<br><br>
<b>VisualStudio</b> to edit the files: https://code.visualstudio.com/Download
<br><br>
both software is compatible with mac, windows and linux



<center><h3>Make github respitory docker</h3></center>

1. make docker file: Dockerfile
2. insert required data example:
```
   FROM php:apache 
   COPY . /var/www/html/
```

3. go to your github image select action --> create new workflow
(make your own workflow non template)

4. Copy and paste this in the file:
```
 name: Manual Docker Image CI

 permissions:
   contents: read
   packages: write
   id-token: write

 on:
   workflow_dispatch:

 jobs:

   build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Docker Login
      # You may pin to the exact commit or the version.
      # uses: docker/login-action@49ed152c8eca782a232dede0303416e8f356c37b
      uses: docker/login-action@v2.0.0
      with:
        registry: ghcr.io
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}       

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Cache Docker layers
      uses: actions/cache@v2
      with:
        path: /tmp/.buildx-cache
        key: ${{ runner.os }}-buildx-${{ github.sha }}
        restore-keys: |
          ${{ runner.os }}-buildx-

    - name: Docker Metadata action
      id: docker_meta
      # You may pin to the exact commit or the version.
      # uses: docker/metadata-action@69f6fc9d46f2f8bf0d5491e4aabe0bb8c6a4678a
      uses: docker/metadata-action@v4.0.1
      with:
        # List of Docker images to use as base name for tags
        images: ghcr.io/${{ github.repository }}
        # List of tags as key-value pair attributes
        tags: |
            type=ref,event=branch,suffix=-{{sha}}
            type=ref,event=pr,suffix=-{{sha}}
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=sha
        flavor: |
            latest=true

    - name: Build and push Docker images
      # You may pin to the exact commit or the version.
      # uses: docker/build-push-action@e551b19e49efd4e98792db7592c17c09b89db8d8
      uses: docker/build-push-action@v3.0.0
      with:
        push: true
        tags: ${{ steps.docker_meta.outputs.tags }}
        labels: ${{ steps.docker_meta.outputs.labels }}
        cache-from: type=local,src=/tmp/.buildx-cache
        cache-to: type=local,dest=/tmp/.buildx-cache

```


<h2>Send your github username/web package</h2>
<br>
Send github username/web package to the responsible admin. 
<br><br>
<h2><center>My notes for Website</center></h2>

This is just a test to see how my github project works with docker

Testing auto update with watchtower. 
<img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fdone_7799536&psig=AOvVaw1ZR_r8c0xRfgiLiXkqPuCt&ust=1685464596889000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCMCjoob7mv8CFQAAAAAdAAAAABAE" alt="done" width="50" height="50">


Testing database

Testing html

Testing perl
