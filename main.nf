#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process sayHello {
  input:
    val x
  output:
    stdout
  script:
    """
    if [ "$x" == "Hello" ]; then
      echo "Throwing an exception for 'Hello'"
      exit 1
    else
      echo '$x world!'
    fi
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
