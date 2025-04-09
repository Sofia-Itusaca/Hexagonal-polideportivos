FROM ruby:latest

RUN apt-get update -qq && apt-get install -y nodejs

RUN git config --global user.name "Sofia-Itusaca"
RUN git config --global user.email "ana.itusaca@unas.edu.pe"

WORKDIR /usr/src/app

RUN gem install rails -v 7.0

EXPOSE 3000

