# Getting Started 

## Some background
Kafka is a distributed messaging system that's fast and highly scalable. It
provides messaging through a publish and subscribe model. 

``` sidebar:: You are free, and that is why you are lost.

    Franz Kafka (3 July 1883 – 3 June 1924) was a German-speaking Bohemian
    novelist and short-story writer, widely regarded as one of the major
    figures of 20th-century literature. His work fuses elements of realism and
    the fantastic.
```

Kafka was originally developed by LinkedIn. Jay Kreps (CEO of Confluent, and
formerly the lead architect for data infrastructure at LinkedIn) chose to
name the software after the author Franz Kafka because it is "a system
optimized for writing", and he liked Kafka's work.

Due to its distributed design, Kafka allows large number of permanent or ad-hoc
consumers and makes it highly available, resilient to node failures and able
to support automatic recovery. These characteristics that make it ideal fit
for communication and integration between components of large-scale data
systems.

## Prerequisites
To complete our work we will need to:

- Clone a git repository
- Run docker containers
- Run some python programs we will write

The following sections provide more details on these requirements.

### Git
Git is a version control system (VCS). We need it to clone the
[Kafka Demo](https://github.com/davecharles/kafka_demo) repository. If you
don't have `git` installed then
[this is a good place to start](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). 

### Docker
Docker provides the ability to package and run an application in a loosely
isolated environment called a *container*. If you don't have `docker` installed
then [this is a good place to start](https://docs.docker.com/engine/install/). 

### Python
Python is a general purpose, intuitive, high level programming language.
If you don't have `python ` installed then
[this is a good place to start](https://docs.docker.com/engine/install/). A
suitable version is `Python 3.8`.

Python will also require some additional dependencies installed. These include:

```bash
kafka-python==2.0.1
termcolor==1.1.0
```

You should be able to install these using [pip](https://pip.pypa.io/en/stable/)
which is usually packaged with Python.

## Clone the repository
The [Kafka Demo](https://github.com/davecharles/kafka_demo) repository is
required to get going. Clone the repository as follows:

```bash
$ git clone git@github.com:davecharles/kafka_demo.git
$ cd kafka_demo
```

## Start up Kafka 
HEREHEREHEREHEREHEREHEREHEREHEREHEREHEREHEREHEREHERE
 
Mauris auctor porttitor vehicula. Nunc aliquam fermentum tellus, nec varius dolor imperdiet sed.

## The story so far
This went well - what we did

- reviewed the prereqs
- Cloned the repo 
- Started kafka
- Checked it was running
- Reviewed the Kafka UI
 
Next we are going to write a simple Kafka Producer using Python.  
