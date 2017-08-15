# Goldeneye 007 (U) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

.include "src/header.s"
.include "src/entry.s"
.include "src/code.s"

.section .c_data, "a"
Compressedrodata:
 # make a hole for when we compress .data segment
 .space 0x11C00
Compressedrodata_end:

.include "src/rarezip.s"
.include "src/tlbcode.s"
.include "bin/romfiles.s"
.include "ramrom/ramrom.s"
.include "font/font.s"
.include "music/music.s"
.include "obseg/ob_seg.s"
.include "images/images.s"

# PADDING region BE6D10-C00000 [192F0]
.space 0x192F0, 0xFF

.include "src/data.s"
.include "src/bss.s"
.include "src/buffers.s"



