FROM ruby:3.2.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 

WORKDIR /cv_creater
COPY Gemfile .
RUN gem install bundle && bundle install
COPY . . 
RUN apt install sudo
RUN apt install -f 
RUN apt-get install wkhtmltopdf -y 
    #may be no need ^
RUN apt install libreoffice-writer -y
RUN apt-get install libvips-dev -y
# RUN apt install nodejs -y  # no need i just add >>gem 'mini_racer'
RUN apt-get install default-jre -y
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
# ENTRYPOINT ["./entrypoint.sh"]
# wkhtmltopdf|pdf , libreoffice-writer|doc , libvips-dev|image_processing
# need to configure path wkhtmltopdf
# node js for precompile , js compression etc

# run >> 
# docker build -t cv_docker:1.3 .   \\ give image
# docker run -p 3000:3000 -v "$(pwd)":/cv_creater cv_docker:1.3
# docker run -p 3000:3000 -v "$(pwd)":/cv_creater -it cv_docker:1.3 bash