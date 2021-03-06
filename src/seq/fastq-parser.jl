# WARNING: This file was generated from fastq-parser.rl using ragel. Do not edit!
const fastqparser_start  = 18
const fastqparser_first_final  = 18
const fastqparser_error  = 0
const fastqparser_en_main  = 18
const _fastqparser_nfa_targs = Int8[ 0, 0 ,  ]
const _fastqparser_nfa_offsets = Int8[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,  ]
const _fastqparser_nfa_push_actions = Int8[ 0, 0 ,  ]
const _fastqparser_nfa_pop_trans = Int8[ 0, 0 ,  ]
Ragel.@generate_read!_function(
"fastqparser",
FASTQParser,
SeqRecord,
begin
begin
if ( p == pe  )
	@goto _test_eof

end
if ( cs  == 18 )
	@goto st_case_18
elseif ( cs  == 0 )
	@goto st_case_0
elseif ( cs  == 1 )
	@goto st_case_1
elseif ( cs  == 2 )
	@goto st_case_2
elseif ( cs  == 3 )
	@goto st_case_3
elseif ( cs  == 4 )
	@goto st_case_4
elseif ( cs  == 5 )
	@goto st_case_5
elseif ( cs  == 6 )
	@goto st_case_6
elseif ( cs  == 7 )
	@goto st_case_7
elseif ( cs  == 8 )
	@goto st_case_8
elseif ( cs  == 9 )
	@goto st_case_9
elseif ( cs  == 10 )
	@goto st_case_10
elseif ( cs  == 11 )
	@goto st_case_11
elseif ( cs  == 12 )
	@goto st_case_12
elseif ( cs  == 19 )
	@goto st_case_19
elseif ( cs  == 13 )
	@goto st_case_13
elseif ( cs  == 14 )
	@goto st_case_14
elseif ( cs  == 15 )
	@goto st_case_15
elseif ( cs  == 16 )
	@goto st_case_16
elseif ( cs  == 17 )
	@goto st_case_17
end
@goto st_out
@label ctr39
begin
state.linenum += 1
end
@goto st18
@label st18
p+= 1;
if 	( p == pe  )
	@goto _test_eof18

end
@label st_case_18
if ( (data[1+(p )]) == 10 )
	begin
	@goto ctr39

end
elseif 	( (data[1+(p )]) == 32 )
	begin
	@goto st18

end
elseif 	( (data[1+(p )]) == 64 )
	begin
	ck = 0;
	if ( (length(input.qualbuf) == length(input.seqbuf)) )
		ck += 1;

	end
	if ( 1 <= ck  )
		begin
		@goto st1

	end

end
@goto st0

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 13  )
	begin
	@goto st18

end

end
begin
@goto st0

end
@label st_case_0
@label st0
cs = 0;
@goto _out
@label ctr41
begin
if length(input.seqbuf) != length(input.qualbuf)
error("Error parsing FASTQ: sequence and quality scores must be of equal length")
end

# if a name and s description are repeated (i.e. old-fashioned fastq)
# make sure they match.
if (!isempty(input.name2buf) && input.name2buf != output.name) ||
(!isempty(input.desc2buf) && input.desc2buf != output.metadata.description)
error("Error parsing FASTQ: sequence and quality scores have non-matching identifiers")
end

# sequence
resize!(output.seq, input.seqbuf.position - 1)
encode_copy!(output.seq, 1, input.seqbuf.buffer, 1, input.seqbuf.position - 1)

# quality
encoding, input.quality_encodings =
infer_quality_encoding(input.qualbuf.buffer, 1,
input.qualbuf.position - 1,
input.quality_encodings)

decode_quality_string!(encoding, input.qualbuf.buffer,
output.metadata.quality, 1,
input.qualbuf.position - 1)

# reset temporaries for the next run
empty!(input.qualbuf)
empty!(input.seqbuf)
empty!(input.name2buf)
empty!(input.desc2buf)

Ragel.@yield 1
end
@goto st1
@label st1
p+= 1;
if ( p == pe  )
@goto _test_eof1

end
@label st_case_1
if ( (data[1+(p )])== 32  )
begin
@goto st0

end

end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 13  )
begin
@goto st0

end

end
begin
@goto ctr0

end
@label ctr0
begin
Ragel.@anchor!
end
@goto st2
@label st2
p+= 1;
if ( p == pe  )
@goto _test_eof2

end
@label st_case_2
if ( (data[1+(p )]) == 10 )
begin
@goto ctr4

end
elseif ( (data[1+(p )]) == 12 )
begin
@goto st0

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr5

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr3

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 11  )
begin
@goto ctr3

end

end
begin
@goto st2

end
@label ctr3
begin
Ragel.@copy_from_anchor!(output.name)
end
@goto st3
@label st3
p+= 1;
if ( p == pe  )
@goto _test_eof3

end
@label st_case_3
if ( (data[1+(p )]) == 10 )
begin
@goto st0

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st3

end
end
if ( (data[1+(p )])> 11  )
begin
if ( (data[1+(p )])<= 13  )
begin
@goto st0

end

end

end

elseif ( (data[1+(p )])>= 9  )
begin
@goto st3

end

end
begin
@goto ctr6

end
@label ctr6
begin
Ragel.@anchor!
end
@goto st4
@label st4
p+= 1;
if ( p == pe  )
@goto _test_eof4

end
@label st_case_4
if ( (data[1+(p )]) == 10 )
begin
@goto ctr9

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr10

end
end
begin
@goto st4

end
@label ctr4
begin
Ragel.@copy_from_anchor!(output.name)
end
begin
state.linenum += 1
end
@goto st5
@label ctr9
begin
Ragel.@copy_from_anchor!(output.metadata.description)
end
begin
state.linenum += 1
end
@goto st5
@label ctr37
begin
state.linenum += 1
end
@goto st5
@label st5
p+= 1;
if ( p == pe  )
@goto _test_eof5

end
@label st_case_5
if ( (data[1+(p )]) == 10 )
begin
@goto ctr11

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st7

end
end
if ( 65 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto ctr13

end

end
begin
@goto st0

end
@label ctr11
begin
state.linenum += 1
end
@goto st6
@label ctr34
begin
Ragel.@append_from_anchor!(input.seqbuf)
end
begin
state.linenum += 1
end
@goto st6
@label st6
p+= 1;
if ( p == pe  )
@goto _test_eof6

end
@label st_case_6
if ( (data[1+(p )]) == 10 )
begin
@goto ctr11

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st7

end
elseif ( (data[1+(p )]) == 43 )
begin
@goto st8

end
end
if ( 65 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto ctr13

end

end
begin
@goto st0

end
@label ctr35
begin
Ragel.@append_from_anchor!(input.seqbuf)
end
@goto st7
@label st7
p+= 1;
if ( p == pe  )
@goto _test_eof7

end
@label st_case_7
if ( (data[1+(p )])== 10  )
begin
@goto ctr11

end

end
begin
@goto st0

end
@label st8
p+= 1;
if ( p == pe  )
@goto _test_eof8

end
@label st_case_8
if ( (data[1+(p )]) == 10 )
begin
@goto ctr16

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st15

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st0

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 12  )
begin
@goto st0

end

end
begin
@goto ctr15

end
@label ctr15
begin
Ragel.@anchor!
end
@goto st9
@label st9
p+= 1;
if ( p == pe  )
@goto _test_eof9

end
@label st_case_9
if ( (data[1+(p )]) == 10 )
begin
@goto ctr20

end
elseif ( (data[1+(p )]) == 12 )
begin
@goto st0

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr21

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto ctr19

end
end
if ( 9 <= (data[1+(p )])&& (data[1+(p )])<= 11  )
begin
@goto ctr19

end

end
begin
@goto st9

end
@label ctr19
begin
Ragel.@copy_from_anchor!(input.name2buf)
end
@goto st10
@label st10
p+= 1;
if ( p == pe  )
@goto _test_eof10

end
@label st_case_10
if ( (data[1+(p )]) == 10 )
begin
@goto st0

end
elseif ( (data[1+(p )]) == 32 )
begin
@goto st10

end
end
if ( (data[1+(p )])> 11  )
begin
if ( (data[1+(p )])<= 13  )
begin
@goto st0

end

end

end

elseif ( (data[1+(p )])>= 9  )
begin
@goto st10

end

end
begin
@goto ctr22

end
@label ctr22
begin
Ragel.@anchor!
end
@goto st11
@label st11
p+= 1;
if ( p == pe  )
@goto _test_eof11

end
@label st_case_11
if ( (data[1+(p )]) == 10 )
begin
@goto ctr25

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr26

end
end
begin
@goto st11

end
@label ctr16
begin
state.linenum += 1
end
@goto st12
@label ctr20
begin
Ragel.@copy_from_anchor!(input.name2buf)
end
begin
state.linenum += 1
end
@goto st12
@label ctr25
begin
Ragel.@copy_from_anchor!(input.desc2buf)
end
begin
state.linenum += 1
end
@goto st12
@label st12
p+= 1;
if ( p == pe  )
@goto _test_eof12

end
@label st_case_12
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st13

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
ck = 0;
if ( (length(input.qualbuf) + input.qualcount < length(input.seqbuf)) )
ck += 1;

end
if ( 1 <= ck  )
begin
@goto ctr29

end

end
@goto st0

end

end
begin
@goto st0

end
@label ctr27
begin
state.linenum += 1
end
@goto st19
@label ctr31
begin
Ragel.@append_from_anchor!(input.qualbuf)
input.qualcount = 0
end
begin
state.linenum += 1
end
@goto st19
@label st19
p+= 1;
if ( p == pe  )
@goto _test_eof19

end
@label st_case_19
if ( (data[1+(p )]) == 10 )
begin
@goto ctr27

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto st13

end
elseif ( (data[1+(p )]) == 64 )
begin
ck = 0;
if ( (length(input.qualbuf) + input.qualcount < length(input.seqbuf)) )
ck += 1;

end
if ( (length(input.qualbuf) == length(input.seqbuf)) )
ck += 2;

end
if ( ck < 2  )
begin
if ( 1 <= ck  )
begin
@goto ctr29

end

end

end

elseif ( ck > 2  )
begin
@goto ctr29

end

else
begin
@goto ctr41

end

end
@goto st0

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
ck = 0;
if ( (length(input.qualbuf) + input.qualcount < length(input.seqbuf)) )
ck += 1;

end
if ( 1 <= ck  )
begin
@goto ctr29

end

end
@goto st0

end

end
begin
@goto st0

end
@label ctr32
begin
Ragel.@append_from_anchor!(input.qualbuf)
input.qualcount = 0
end
@goto st13
@label st13
p+= 1;
if ( p == pe  )
@goto _test_eof13

end
@label st_case_13
if ( (data[1+(p )])== 10  )
begin
@goto ctr27

end

end
begin
@goto st0

end
@label ctr29
begin
Ragel.@anchor!
end
begin
input.qualcount += 1
end
@goto st14
@label ctr33
begin
input.qualcount += 1
end
@goto st14
@label st14
p+= 1;
if ( p == pe  )
@goto _test_eof14

end
@label st_case_14
if ( (data[1+(p )]) == 10 )
begin
@goto ctr31

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr32

end
end
if ( 33 <= (data[1+(p )])&& (data[1+(p )])<= 126  )
begin
ck = 0;
if ( (length(input.qualbuf) + input.qualcount < length(input.seqbuf)) )
ck += 1;

end
if ( 1 <= ck  )
begin
@goto ctr33

end

end
@goto st0

end

end
begin
@goto st0

end
@label ctr21
begin
Ragel.@copy_from_anchor!(input.name2buf)
end
@goto st15
@label ctr26
begin
Ragel.@copy_from_anchor!(input.desc2buf)
end
@goto st15
@label st15
p+= 1;
if ( p == pe  )
@goto _test_eof15

end
@label st_case_15
if ( (data[1+(p )])== 10  )
begin
@goto ctr16

end

end
begin
@goto st0

end
@label ctr13
begin
Ragel.@anchor!
end
@goto st16
@label st16
p+= 1;
if ( p == pe  )
@goto _test_eof16

end
@label st_case_16
if ( (data[1+(p )]) == 10 )
begin
@goto ctr34

end
elseif ( (data[1+(p )]) == 13 )
begin
@goto ctr35

end
end
if ( 65 <= (data[1+(p )])&& (data[1+(p )])<= 122  )
begin
@goto st16

end

end
begin
@goto st0

end
@label ctr5
begin
Ragel.@copy_from_anchor!(output.name)
end
@goto st17
@label ctr10
begin
Ragel.@copy_from_anchor!(output.metadata.description)
end
@goto st17
@label st17
p+= 1;
if ( p == pe  )
@goto _test_eof17

end
@label st_case_17
if ( (data[1+(p )])== 10  )
begin
@goto ctr37

end

end
begin
@goto st0

end
@label st_out
@label _test_eof18
cs = 18;
@goto _test_eof
@label _test_eof1
cs = 1;
@goto _test_eof
@label _test_eof2
cs = 2;
@goto _test_eof
@label _test_eof3
cs = 3;
@goto _test_eof
@label _test_eof4
cs = 4;
@goto _test_eof
@label _test_eof5
cs = 5;
@goto _test_eof
@label _test_eof6
cs = 6;
@goto _test_eof
@label _test_eof7
cs = 7;
@goto _test_eof
@label _test_eof8
cs = 8;
@goto _test_eof
@label _test_eof9
cs = 9;
@goto _test_eof
@label _test_eof10
cs = 10;
@goto _test_eof
@label _test_eof11
cs = 11;
@goto _test_eof
@label _test_eof12
cs = 12;
@goto _test_eof
@label _test_eof19
cs = 19;
@goto _test_eof
@label _test_eof13
cs = 13;
@goto _test_eof
@label _test_eof14
cs = 14;
@goto _test_eof
@label _test_eof15
cs = 15;
@goto _test_eof
@label _test_eof16
cs = 16;
@goto _test_eof
@label _test_eof17
cs = 17;
@goto _test_eof
@label _test_eof
begin

end
if ( p == eof  )
begin
if ( cs  == 19 )
begin
if length(input.seqbuf) != length(input.qualbuf)
error("Error parsing FASTQ: sequence and quality scores must be of equal length")
end

# if a name and s description are repeated (i.e. old-fashioned fastq)
# make sure they match.
if (!isempty(input.name2buf) && input.name2buf != output.name) ||
(!isempty(input.desc2buf) && input.desc2buf != output.metadata.description)
error("Error parsing FASTQ: sequence and quality scores have non-matching identifiers")
end

# sequence
resize!(output.seq, input.seqbuf.position - 1)
encode_copy!(output.seq, 1, input.seqbuf.buffer, 1, input.seqbuf.position - 1)

# quality
encoding, input.quality_encodings =
infer_quality_encoding(input.qualbuf.buffer, 1,
input.qualbuf.position - 1,
input.quality_encodings)

decode_quality_string!(encoding, input.qualbuf.buffer,
output.metadata.quality, 1,
input.qualbuf.position - 1)

# reset temporaries for the next run
empty!(input.qualbuf)
empty!(input.seqbuf)
empty!(input.name2buf)
empty!(input.desc2buf)

Ragel.@yield 0
end

break;
end

end

end
@label _out
begin

end

end
end)
