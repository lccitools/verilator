# The MIT License
#
#  Copyright (c) 2017, Oleg Nenashev, Stefan Wallentowitz
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM lccitools/base:latest
LABEL Maintainer  Stefan Wallentowitz <stefan@wallentowitz.de>
LABEL Description "Verilator"

ARG VERSION=3.902
ARG JOBS=-j8

RUN git clone http://git.veripool.org/git/verilator
WORKDIR verilator
RUN git checkout verilator_`echo ${VERSION} | sed 's/\./_/g'`

ENV JOBS=${JOBS}
ENV VERSION=${VERSION}
ENV VERILATOR_BASE=/tools/eda/verilator
ENV VERILATOR_MODULEFILES=/tools/modulefiles/eda/verilator

COPY build.sh /tmp/verilator

ENTRYPOINT ["./build.sh"]
