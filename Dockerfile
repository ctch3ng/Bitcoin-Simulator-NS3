FROM ubuntu

RUN apt-get update && apt-get install -y wget gedit git gcc g++ python python-dev mercurial python-setuptools git qt5-default python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython openmpi-bin openmpi-common openmpi-doc libopenmpi-dev autoconf cvs bzr unrar gdb valgrind uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng python-sphinx dia gsl-bin libgsl2 libgsl-dev flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev cmake libc6-dev libc6-dev-i386 libclang-dev python-pip libgtk2.0-0 libgtk2.0-dev vtun lxc libboost-signals-dev libboost-filesystem-dev
RUN pip install cxxfilt

WORKDIR /root/
RUN mkdir workspace

WORKDIR /root/workspace/
RUN wget https://www.nsnam.org/release/ns-allinone-3.25.tar.bz2
RUN tar xvfj ns-allinone-3.25.tar.bz2
RUN git clone https://github.com/arthurgervais/Bitcoin-Simulator.git
WORKDIR /root/
RUN git clone https://github.com/Tencent/rapidjson.git

WORKDIR /root/workspace/Bitcoin-Simulator/
RUN chmod u+x copy-to-ns3.sh
RUN ./copy-to-ns3.sh

WORKDIR /root/
RUN mkdir mods

WORKDIR /root/mods/
ADD insert_text_1.txt /root/mods
ADD insert_text_2.txt /root/mods
ADD insert_text_3.txt /root/mods
ADD insert_text_4.txt /root/mods

RUN sed -i '/module.source = \[/r insert_text_1.txt' ~/workspace/ns-allinone-3.25/ns-3.25/src/applications/wscript
RUN sed -i '/headers.source = \[/r insert_text_2.txt' ~/workspace/ns-allinone-3.25/ns-3.25/src/applications/wscript
RUN sed -i '/obj.source = \[/r insert_text_3.txt' ~/workspace/ns-allinone-3.25/ns-3.25/src/internet/wscript
RUN sed -i '/headers.source = \[/r insert_text_4.txt' ~/workspace/ns-allinone-3.25/ns-3.25/src/internet/wscript

WORKDIR /root/workspace/ns-allinone-3.25/ns-3.25
RUN CXXFLAGS="-std=c++11" ./waf configure --build-profile=optimized --out=build/optimized --with-pybindgen=~/workspace/ns-allinone-3.25/pybindgen-0.17.0.post49+ng0e4e3bc --enable-mpi --enable-static
RUN ./waf


