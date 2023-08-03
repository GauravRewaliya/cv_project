FROM ruby:3.2.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 

WORKDIR /cv_creater
COPY Gemfile .
RUN gem install bundle && bundle install
COPY . . 
RUN apt install -f 
RUN apt-get install wkhtmltopdf -y
RUN apt install libreoffice-writer -y
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]


