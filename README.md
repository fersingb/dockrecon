# Dockrecon

Dockrecon is a docker image that contains tools used for recon. Right now it contains only amass, nmap and webscreenshot. I'll add more tools later.

# How to use it
Clone the repository and build the image:
```
$ git clone git@github.com:fersingb/dockrecon.git
$ cd dockrecon
$ docker build -t dockrecon .
```

And run it!

Example run where you have a file named *alive* containing urls in the current directory:
```
docker run -v $(pwd):/host/ -w /host -it dockrecon webscreenshot --no-xserver -i alive -o result
```

What this command does:
- Run the dockrecon image
- Mount the current directory to **/host/** in the container
- Set the current working directory inside the container to **/host/**
- Execute the webscreenshot command where *alive* is the input file and *result* is the output directory 
