#!/usr/bin/env ruby

DOCKER_REGISTRY="shinyspiderdude"

IMAGES_ORDER = ['base', 'python', 'glibc', 'java7', 'java8', 'java7-with-takipi', 'java8-with-takipi', 'java7-jdk', 'java8-jdk', 'maven-java7', 'maven-java8', 'tomcat6', 'tomcat6-se', 'tomcat8', 'tomcat8-se', 'jar-runner', 'activemq']

@PUSH = false

@FAILED_IMAGES = []

def check_that_all_images_will_be_created
	images = Dir.entries(Dir.pwd).select {|entry| File.directory? File.join(Dir.pwd, entry) and !(entry =='.' || entry == '..') }

	image_difference = images - IMAGES_ORDER

	if (image_difference).size > 0
        	puts "WARNING: The following images are not scheduled for compilation! -> #{image_difference}"
	end
end


def create_image(image)
        if (image == "--all") 
		check_that_all_images_will_be_created
		IMAGES_ORDER.each {|image| create_image image}
		return
	end
	command = "docker build -t #{DOCKER_REGISTRY}/#{image} #{image} > /dev/null"
	command += " && docker push #{DOCKER_REGISTRY}/#{image} > /dev/null" if @PUSH
	puts command.gsub(/> \/dev\/null/, "")
	exit_status = system(command)
	@FAILED_IMAGES << image unless exit_status
end

@PUSH = true if ARGV[1] == "--push"
create_image(ARGV[0])
puts "ERROR: Creation failed for the following images: #{@FAILED_IMAGES}" if @FAILED_IMAGES.size > 0
