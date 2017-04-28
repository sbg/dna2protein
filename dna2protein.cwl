class: Workflow
cwlVersion: v1.0
id: dna2protein_cwl
label: dna2protein.cwl.yaml
inputs:
  - id: dna
    type: File
    fileTypes: []
    'sbg:x': -707.3352146362032
    'sbg:y': 7.558805120071309
  - id: verbose_transcribe
    type: boolean?
    fileTypes: []
    'sbg:x': -717.7321961678115
    'sbg:y': -145.01937835488542
  - id: verbose_translate
    type: boolean?
    fileTypes: []
    'sbg:x': -213.41893005371094
    'sbg:y': -179.67202758789062
outputs:
  - id: rna
    outputSource:
      - transcribe/rna
    type: File
    fileTypes: []
    'sbg:x': -373.1210325782998
    'sbg:y': -149.92108038234497
  - id: protein
    outputSource:
      - translate/protein
    type: File
    fileTypes: []
    'sbg:x': 147.01910400390625
    'sbg:y': -92.385986328125
steps:
  - id: transcribe
    in:
      - id: dna
        source:
          - dna
      - id: verbose_transcribe
        source:
          - verbose_transcribe
    out:
      - id: rna
    run:
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
      id: transcribe
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
    'sbg:x': -521.4851027793799
    'sbg:y': -83.81255953317253
  - id: translate
    in:
      - id: mRNA
        source:
          - transcribe/rna
      - id: verbose_translate
        source:
          - verbose_translate
    out:
      - id: protein
    run:
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
      id: translate
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
    'sbg:x': -82.98089599609375
    'sbg:y': -64.385986328125
description: ''
'sbg:modified': true
