class: CommandLineTool
cwlVersion: v1.0
baseCommand:
  - transcribe.py
inputs:
  - type: File
    id: dna
    inputBinding:
      position: 1
    doc: DNA input file to transcribe
    secondaryFiles: []
  - default: false
    type: boolean?
    id: verbose_transcribe
    inputBinding:
      prefix: '--verbose'
      separate: true
    secondaryFiles: []
outputs:
  - id: rna
    type: File
    outputBinding:
      glob: rna.txt
requirements:
  - class: DockerRequirement
    dockerPull: 'sevenbridges/dna2protein:0.5.6'
  - class: InitialWorkDirRequirement
    listing: []
stdout: transcribe.log
'sbg:job':
  inputs:
    dna:
      class: File
      path: /path/to/dna.ext
      secondaryFiles: []
      size: 0
    verbose: true
'sbg:modified': true
