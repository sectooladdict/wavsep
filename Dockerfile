FROM tomcat:7.0.63-jre8

# Download WAVSEP
WORKDIR /tmp/

RUN wget https://github.com/sectooladdict/wavsep/archive/wavsep-v1.5-war.zip

RUN unzip wavsep-v1.5-war.zip
RUN rm wavsep-v1.5-war.zip
RUN mv wavsep-wavsep-v1.5-war wavsep

# http://stackoverflow.com/questions/1858463/java-error-only-a-type-can-be-imported-xyz-resolves-to-a-package
RUN cp -rf wavsep/build/classes/ wavsep/WebContent/WEB-INF/classes/

# The war contains garbage
RUN rm -rf wavsep/WebContent/WEB-INF.*
RUN rm -rf "wavsep/WebContent/WEB-INF - Copy"
RUN rm -rf "wavsep/WebContent/Copy of WEB-INF"
RUN rm -rf "wavsep/WebContent/WEB-INF (copy)"


# Copy WAVSEP to Tomcat's directory
WORKDIR /usr/local/tomcat/webapps/
RUN cp -rf /tmp/wavsep/WebContent/ wavsep
