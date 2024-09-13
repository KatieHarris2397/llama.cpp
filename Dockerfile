FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y gcc 
RUN apt-get install -y cmake 
RUN apt-get install -y build-essential

WORKDIR /app

COPY . .

RUN cmake -B build
RUN cmake --build build --config Release

ENTRYPOINT [ "llama-server" ]

CMD [ "--hf-repo", "microsoft/Phi-3-mini-4k-instruct-gguf", "--hf-file", "Phi-3-mini-4k-instruct-q4.gguf", "-c", "4096" ]