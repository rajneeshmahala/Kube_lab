# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set environment variables
ENV JMETER_VERSION 5.5
ENV JMETER_HOME /opt/jmeter
ENV PATH $PATH:$JMETER_HOME/bin

# Install dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget tar && \
    apt-get clean

# Download and install JMeter
RUN wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf apache-jmeter-${JMETER_VERSION}.tgz && \
    mv apache-jmeter-${JMETER_VERSION} $JMETER_HOME && \
    rm apache-jmeter-${JMETER_VERSION}.tgz

# Set working directory
WORKDIR $JMETER_HOME

# Default command
CMD ["jmeter"]

##                                                                 ##
#                                                                   #
# docker run -it --name jmeter-container jmeter-image               #   
#   jmeter -n -t /path/to/your/testplan.jmx -l /path/to/results.jtl #
##                                                                 ##             
 