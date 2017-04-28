#!/usr/bin/env python
import argparse
import re


VERSION = "0.5.6"
FILENAME_OUTPUT = "rna.txt"

def transcribe(args):
	# create a transcription map and use regex to translate
	nucleotide_map = {"A":"U", "T":"A", "C":"G", "G":"C"}
	nucleotide_map = dict((re.escape(k), v) for k, v in nucleotide_map.items())
	pattern = re.compile("|".join(nucleotide_map.keys()))
	DNA = args['dna'].read().strip()
	mRNA = pattern.sub(lambda m: nucleotide_map[re.escape(m.group(0))], DNA)

	print("Welcome to transcribe, version: {0}".format(VERSION))
	if args['verbose']:
		print("mRNA has been translated. Result in {0}".format(FILENAME_OUTPUT))
	with open(FILENAME_OUTPUT, "w") as output:
		output.write(mRNA)
	print("Done.")

if __name__ == "__main__":
	""" Parse the command line arguments """
	parser = argparse.ArgumentParser(description="Translates a DNA input test into a RNA", 
									formatter_class=argparse.ArgumentDefaultsHelpFormatter)
	parser.add_argument("dna", type=argparse.FileType("r"), help="DNA input file to transcribe")
	parser.add_argument("-v", "--verbose", action="store_true", default=False)
	parser.add_argument("--version", action='version', version=VERSION) 
	args = vars(parser.parse_args())

	""" Run the desired methods """
	transcribe(args)
