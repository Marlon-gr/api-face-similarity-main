
 Face Similarity API
==========================
Process image to obtain 128 vector dimensions and calculate distance.
The distance represents the similarity between both faces.

System requirements
-------------------
- Python >= 3.6

Installation
------------
```bash
$ sudo mkdir /var/log/  # creates  logging folder
$ sudo chown $USER:$USER /var/log/  # give  logging folder group permissions
$ pip install -e .
```

Usage
-----
```bash
$ api-face-similarity  # run API
```
Read REST API documentation through ``/docs`` endpoint for API usage.