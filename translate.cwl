class: CommandLineTool
cwlVersion: v1.0
baseCommand:
  - translate.py
inputs:
  - type: File
    id: mRNA
    inputBinding:
      position: 1
    doc: mRNA to transcribe
    secondaryFiles: []
  - default: false
    type: boolean?
    id: verbose_translate
    inputBinding:
      prefix: '-v'
      separate: true
    doc: Run in verbose mode
    secondaryFiles: []
outputs:
  - id: protein
    type: File
    outputBinding:
      glob: protein.txt
requirements:
  - class: DockerRequirement
    dockerPull: 'sevenbridges/dna2protein:0.5.6'
  - class: InitialWorkDirRequirement
    listing: []
stdout: translate.log
'sbg:job':
  inputs: {}
  runtime: {}
'sbg:modified': true
