<a href = "https://www.sbgenomics.com/"><img src ="https://drive.google.com/file/d/0B8Ko6ojXxxUrenRQeEFpOGtXSWM/view?usp=sharing" width ="300" align="center"></a>

# Introduction
This tutorial illustrates how to add custom tools to the Seven Bridges Platform or Cancer Genomics Cloud using a Dockerfile.

To follow the tutorial, see:
* [Upload a custom python program using a Dockerfile to the Seven Bridges Platform](http://docs.sevenbridges.com/v1.0/docs/worked-example-of-uploading-a-custom-python-program), or
* [Upload a custom python program using a Dockerfile to the Cancer Genomics Cloud](http://docs.cancergenomicscloud.org/v1.0/docs/worked-example-of-uploading-a-custom-python-program).

This directory contains the files needed to follow and complete the tutorial successfully.

# Repository contents
This repository contains the following files:
* `transcribe.py` - Python script that takes an input DNA file composed of nucleotides and transcribes it to RNA.
* `translate.py` - Python script that takes mRNA as input and translates it to a peptide.
* `Dockerfile` - Text file with instructions on how to build the necessary Docker image containing the scripts.
* `dna.txt` - Input file for `transcribe.py`.

For instructions on using Dockerfiles to upload an image to the **Seven Bridges Platform**, see [the Platform documentation](http://docs.sevenbridges.com/v1.0/docs/upload-your-docker-image-with-a-dockerfile).
For instructions on using Dockerfiles to upload an image to the **Cancer Genomics Cloud**, see [the CGC documentation](http://docs.cancergenomicscloud.org/v1.0/docs/upload-your-docker-image-with-a-dockerfile).

# To download these files
1. Click **Clone or download** in the top-right corner above the file list.
2. Select **Download ZIP**.
The files will be downloaded to your computer.

* [Back to the tutorial for the Seven Bridges Platform](http://docs.sevenbridges.com/v1.0/docs/worked-example-of-uploading-a-custom-python-program),
* [Back to the tutorial the Cancer Genomics Cloud](http://docs.cancergenomicscloud.org/v1.0/docs/worked-example-of-uploading-a-custom-python-program).


