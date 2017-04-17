# for each directory in folder


for D in `find . -mindepth 1 -maxdepth 1 -type d | grep -v '.git'`
do
    # build and tag docker image
    docker build $D -t kingles/node-yarn-flow:$(basename $D)
    for SD in `find $D -mindepth 1 -maxdepth 1 -type d | grep -v '.git'`
    do
        docker build $SD -t kingles-node-yarn-flow:$(basename $D)-$(basename $SD)
    done
done
