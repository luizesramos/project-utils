------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
------------------------------------------
entity DECODER is
port(OP1,OP2,OP3,OP4: in integer range 0 to 255;
     CLOCK: std_logic;
     OUTS: out integer range 0 to 1024);
end DECODER;
------------------------------------------
architecture behv of DECODER is
signal NEXT_OUTS: integer;
begin
  process(CLOCK)
  begin
    if(rising_edge(CLOCK)) then
      OUTS <= NEXT_OUTS;
    end if;
  end process;

  process(OP1,OP2,OP3,OP4)
  begin
    case OP1 is
        when 0 => NEXT_OUTS <= 503; -- addb_Eb_Gb SANITY
        when 1 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 12; -- addl_Ed_Gd SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 2 => NEXT_OUTS <= 313; -- addb_Gb_Eb SANITY
        when 3 => NEXT_OUTS <= 336; -- addl_Gd_Ed SANITY
        when 4 => NEXT_OUTS <= 457; -- addb_AL_Ib SANITY
        when 5 => NEXT_OUTS <= 558; -- addl_EAX_Id SANITY
        when 6 => NEXT_OUTS <= 201; -- pushl_ES SANITY
        when 7 => NEXT_OUTS <= 238; -- popl_ES SANITY
        when 8 => NEXT_OUTS <= 489; -- orb_Eb_Gb SANITY
        when 9 => NEXT_OUTS <= 618; -- orl_Ed_Gd SANITY
        when 10 => NEXT_OUTS <= 624; -- orb_Gb_Eb SANITY
        when 11 => NEXT_OUTS <= 733; -- orl_Gd_Ed SANITY
        when 12 => NEXT_OUTS <= 139; -- orb_AL_Ib SANITY
        when 13 => NEXT_OUTS <= 163; -- orl_EAX_Id SANITY
        when 14 => NEXT_OUTS <= 178; -- pushl_CS SANITY
        when 15 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 225; -- sldt SANITY
                when 8 => NEXT_OUTS <= 147; -- str SANITY
                when 16 => NEXT_OUTS <= 729; -- lldt SANITY
                when 24 => NEXT_OUTS <= 415; -- ltr SANITY
                when 32 => NEXT_OUTS <= 182; -- verr SANITY
                when 40 => NEXT_OUTS <= 220; -- verw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 318; -- sgdt SANITY
                when 8 => NEXT_OUTS <= 207; -- sidt SANITY
                when 16 => NEXT_OUTS <= 477; -- lgdt SANITY
                when 24 => NEXT_OUTS <= 389; -- lidt SANITY
                when 32 => NEXT_OUTS <= 356; -- smsw_Ew SANITY
                when 48 => NEXT_OUTS <= 404; -- lmsw_Ew SANITY
                when 56 => NEXT_OUTS <= 573; -- invlpg SANITY
                when 248 => NEXT_OUTS <= 456; -- swapgs SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 2 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 365; -- larl_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 156; -- lsll_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 8 => NEXT_OUTS <= 21; -- invd SANITY
            when 9 => NEXT_OUTS <= 448; -- wbinvd SANITY
            when 11 => NEXT_OUTS <= 41; -- ud2a SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 295; -- movl_Rd_Cd SANITY
                when 1 => NEXT_OUTS <= 583; -- movq_Rq_Cq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 33 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 452; -- movl_Rd_Dd SANITY
                when 1 => NEXT_OUTS <= 513; -- movq_Rq_Dq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 34 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 743; -- movl_Cd_Rd SANITY
                when 1 => NEXT_OUTS <= 433; -- movq_Cq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 35 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 168; -- movl_Dd_Rd SANITY
                when 1 => NEXT_OUTS <= 561; -- movq_Dq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 36 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 283; -- movl_Rd_Td SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 38 => NEXT_OUTS <= 143; -- movl_Td_Rd SANITY
            when 110 => NEXT_OUTS <= 568; -- movd_Pq_Ed SANITY
            when 128 => NEXT_OUTS <= 202; -- jo_Jd SANITY
            when 129 => NEXT_OUTS <= 159; -- jno_Jd SANITY
            when 130 => NEXT_OUTS <= 782; -- jb_Jd SANITY
            when 131 => NEXT_OUTS <= 312; -- jnb_Jd SANITY
            when 132 => NEXT_OUTS <= 3; -- jz_Jd SANITY
            when 133 => NEXT_OUTS <= 161; -- jnz_Jd SANITY
            when 134 => NEXT_OUTS <= 284; -- jbe_Jd SANITY
            when 135 => NEXT_OUTS <= 154; -- jnbe_Jd SANITY
            when 136 => NEXT_OUTS <= 20; -- js_Jd SANITY
            when 137 => NEXT_OUTS <= 108; -- jns_Jd SANITY
            when 138 => NEXT_OUTS <= 184; -- jp_Jd SANITY
            when 139 => NEXT_OUTS <= 74; -- jnp_Jd SANITY
            when 140 => NEXT_OUTS <= 409; -- jl_Jd SANITY
            when 141 => NEXT_OUTS <= 100; -- jnl_Jd SANITY
            when 142 => NEXT_OUTS <= 497; -- jle_Jd SANITY
            when 143 => NEXT_OUTS <= 322; -- jnle_Jd SANITY
            when 144 => NEXT_OUTS <= 14; -- seto_Eb SANITY
            when 145 => NEXT_OUTS <= 62; -- setno_Eb SANITY
            when 146 => NEXT_OUTS <= 227; -- setb_Eb SANITY
            when 147 => NEXT_OUTS <= 67; -- setnb_Eb SANITY
            when 148 => NEXT_OUTS <= 237; -- setz_Eb SANITY
            when 149 => NEXT_OUTS <= 374; -- setnz_Eb SANITY
            when 150 => NEXT_OUTS <= 39; -- setbe_Eb SANITY
            when 151 => NEXT_OUTS <= 212; -- setnbe_Eb SANITY
            when 152 => NEXT_OUTS <= 459; -- sets_Eb SANITY
            when 153 => NEXT_OUTS <= 424; -- setns_Eb SANITY
            when 154 => NEXT_OUTS <= 304; -- setp_Eb SANITY
            when 155 => NEXT_OUTS <= 718; -- setnp_Eb SANITY
            when 156 => NEXT_OUTS <= 24; -- setl_Eb SANITY
            when 157 => NEXT_OUTS <= 385; -- setnl_Eb SANITY
            when 158 => NEXT_OUTS <= 429; -- setle_Eb SANITY
            when 159 => NEXT_OUTS <= 590; -- setnle_Eb SANITY
            when 160 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 103; -- pushl_FS SANITY
                when 1 => NEXT_OUTS <= 770; -- pushq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 161 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 607; -- popl_FS SANITY
                when 1 => NEXT_OUTS <= 571; -- popq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 162 => NEXT_OUTS <= 616; -- cpuid SANITY
            when 163 => NEXT_OUTS <= 382; -- btl_Ed_Gd SANITY
            when 164 => NEXT_OUTS <= 556; -- shldl_Ed_Gd_Ib SANITY
            when 165 => NEXT_OUTS <= 617; -- shldl_Ed_Gd_CL SANITY
            when 168 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 442; -- pushl_GS SANITY
                when 1 => NEXT_OUTS <= 160; -- pushq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 169 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 543; -- popl_GS SANITY
                when 1 => NEXT_OUTS <= 737; -- popq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 170 => NEXT_OUTS <= 65; -- rsm SANITY
            when 171 => NEXT_OUTS <= 328; -- btsl_Ed_Gd SANITY
            when 172 => NEXT_OUTS <= 341; -- shrdl_Ed_Gd_Ib SANITY
            when 173 => NEXT_OUTS <= 253; -- shrdl_Ed_Gd_CL SANITY
            when 175 => NEXT_OUTS <= 453; -- imull_Gd_Ed SANITY
            when 176 => NEXT_OUTS <= 311; -- cmpxchgb_Eb_Gb SANITY
            when 177 => NEXT_OUTS <= 769; -- cmpxchgl_Ed_Gd SANITY
            when 178 => NEXT_OUTS <= 366; -- lssl_Gd_Mp SANITY
            when 179 => NEXT_OUTS <= 189; -- btrl_Ed_Gd SANITY
            when 180 => NEXT_OUTS <= 130; -- lfsl_Gd_Mp SANITY
            when 181 => NEXT_OUTS <= 544; -- lgsl_Gd_Mp SANITY
            when 182 => NEXT_OUTS <= 331; -- movzbl_Gd_Eb SANITY
            when 183 => NEXT_OUTS <= 753; -- movzwl_Gd_Ew SANITY
            when 185 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 247; -- ud2b SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 186 => 
            case OP3 is
                when 32 => NEXT_OUTS <= 581; -- btl_Ed_Ib SANITY
                when 40 => NEXT_OUTS <= 661; -- btsl_Ed_Ib SANITY
                when 48 => NEXT_OUTS <= 761; -- btrl_Ed_Ib SANITY
                when 56 => NEXT_OUTS <= 194; -- btcl_Ed_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 187 => NEXT_OUTS <= 745; -- btcl_Ed_Gd SANITY
            when 190 => NEXT_OUTS <= 471; -- movsbl_Gd_Eb SANITY
            when 191 => NEXT_OUTS <= 257; -- movswl_Gd_Ew SANITY
            when 192 => NEXT_OUTS <= 303; -- xaddb_Eb_Gb SANITY
            when 193 => NEXT_OUTS <= 727; -- xaddl_Ed_Gd SANITY
            when 199 => 
            case OP3 is
                when 48 => NEXT_OUTS <= 344; -- vmptrld_Mq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 200 => NEXT_OUTS <= 142; -- bswapl_ERX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 16 => NEXT_OUTS <= 174; -- adcb_Eb_Gb SANITY
        when 17 => NEXT_OUTS <= 111; -- adcl_Ed_Gd SANITY
        when 18 => NEXT_OUTS <= 13; -- adcb_Gb_Eb SANITY
        when 19 => NEXT_OUTS <= 711; -- adcl_Gd_Ed SANITY
        when 20 => NEXT_OUTS <= 292; -- adcb_AL_Ib SANITY
        when 21 => NEXT_OUTS <= 512; -- adcl_EAX_Id SANITY
        when 22 => NEXT_OUTS <= 70; -- pushl_SS SANITY
        when 23 => NEXT_OUTS <= 504; -- popl_SS SANITY
        when 24 => NEXT_OUTS <= 766; -- sbbb_Eb_Gb SANITY
        when 25 => NEXT_OUTS <= 191; -- sbbl_Ed_Gd SANITY
        when 26 => NEXT_OUTS <= 83; -- sbbb_Gb_Eb SANITY
        when 27 => NEXT_OUTS <= 596; -- sbbl_Gd_Ed SANITY
        when 28 => NEXT_OUTS <= 514; -- sbbb_AL_Ib SANITY
        when 29 => NEXT_OUTS <= 95; -- sbbl_EAX_Id SANITY
        when 30 => NEXT_OUTS <= 343; -- pushl_DS SANITY
        when 31 => NEXT_OUTS <= 234; -- popl_DS SANITY
        when 32 => NEXT_OUTS <= 261; -- andb_Eb_Gb SANITY
        when 33 => NEXT_OUTS <= 340; -- andl_Ed_Gd SANITY
        when 34 => NEXT_OUTS <= 251; -- andb_Gb_Eb SANITY
        when 35 => NEXT_OUTS <= 699; -- andl_Gd_Ed SANITY
        when 36 => NEXT_OUTS <= 300; -- andb_AL_Ib SANITY
        when 37 => NEXT_OUTS <= 144; -- andl_EAX_Id SANITY
        when 39 => NEXT_OUTS <= 491; -- daa SANITY
        when 40 => NEXT_OUTS <= 176; -- subb_Eb_Gb SANITY
        when 41 => NEXT_OUTS <= 478; -- subl_Ed_Gd SANITY
        when 42 => NEXT_OUTS <= 428; -- subb_Gb_Eb SANITY
        when 43 => NEXT_OUTS <= 204; -- subl_Gd_Ed SANITY
        when 44 => NEXT_OUTS <= 738; -- subb_AL_Ib SANITY
        when 45 => NEXT_OUTS <= 192; -- subl_EAX_Id SANITY
        when 47 => NEXT_OUTS <= 115; -- das SANITY
        when 48 => NEXT_OUTS <= 315; -- xorb_Eb_Gb SANITY
        when 49 => NEXT_OUTS <= 511; -- xorl_Ed_Gd SANITY
        when 50 => NEXT_OUTS <= 755; -- xorb_Gb_Eb SANITY
        when 51 => NEXT_OUTS <= 488; -- xorl_Gd_Ed SANITY
        when 52 => NEXT_OUTS <= 364; -- xorb_AL_Ib SANITY
        when 53 => NEXT_OUTS <= 468; -- xorl_EAX_Id SANITY
        when 55 => NEXT_OUTS <= 670; -- aaa SANITY
        when 56 => NEXT_OUTS <= 725; -- cmpb_Eb_Gb SANITY
        when 57 => NEXT_OUTS <= 410; -- cmpl_Ed_Gd SANITY
        when 58 => NEXT_OUTS <= 23; -- cmpb_Gb_Eb SANITY
        when 59 => NEXT_OUTS <= 461; -- cmpl_Gd_Ed SANITY
        when 60 => NEXT_OUTS <= 262; -- cmpb_AL_Ib SANITY
        when 61 => NEXT_OUTS <= 399; -- cmpl_EAX_Id SANITY
        when 63 => NEXT_OUTS <= 615; -- aas SANITY
        when 64 => NEXT_OUTS <= 499; -- incl_ERX SANITY
        when 72 => 
        case OP2 is
            when 1 => NEXT_OUTS <= 730; -- addq_Eq_Gq SANITY
            when 3 => NEXT_OUTS <= 258; -- addq_Gq_Eq SANITY
            when 5 => NEXT_OUTS <= 179; -- addq_RAX_sId SANITY
            when 9 => NEXT_OUTS <= 564; -- orq_Eq_Gq SANITY
            when 11 => NEXT_OUTS <= 391; -- orq_Gq_Eq SANITY
            when 13 => NEXT_OUTS <= 26; -- orq_RAX_sId SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 712; -- larq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 362; -- lslq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 110 => NEXT_OUTS <= 672; -- movq_Pq_Eq SANITY
                when 163 => NEXT_OUTS <= 450; -- btq_Eq_Gq SANITY
                when 164 => NEXT_OUTS <= 639; -- shldq_Eq_Gq_Ib SANITY
                when 165 => NEXT_OUTS <= 609; -- shldq_Eq_Gq_CL SANITY
                when 171 => NEXT_OUTS <= 305; -- btsq_Eq_Gq SANITY
                when 172 => NEXT_OUTS <= 660; -- shrdq_Eq_Gq_Ib SANITY
                when 173 => NEXT_OUTS <= 229; -- shrdq_Eq_Gq_CL SANITY
                when 175 => NEXT_OUTS <= 69; -- imulq_Gq_Eq SANITY
                when 177 => NEXT_OUTS <= 706; -- cmpxchgq_Eq_Gq SANITY
                when 178 => NEXT_OUTS <= 625; -- lssq_Gq_Mp SANITY
                when 179 => NEXT_OUTS <= 565; -- btrq_Eq_Gq SANITY
                when 180 => NEXT_OUTS <= 688; -- lfsq_Gq_Mp SANITY
                when 181 => NEXT_OUTS <= 197; -- lgsq_Gq_Mp SANITY
                when 182 => NEXT_OUTS <= 689; -- movzbq_Gq_Eb SANITY
                when 183 => NEXT_OUTS <= 566; -- movzwq_Gq_Ew SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 259; -- btq_Eq_Ib SANITY
                    when 40 => NEXT_OUTS <= 697; -- btsq_Eq_Ib SANITY
                    when 48 => NEXT_OUTS <= 647; -- btrq_Eq_Ib SANITY
                    when 56 => NEXT_OUTS <= 190; -- btcq_Eq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 187 => NEXT_OUTS <= 441; -- btcq_Eq_Gq SANITY
                when 190 => NEXT_OUTS <= 104; -- movsbq_Gq_Eb SANITY
                when 191 => NEXT_OUTS <= 383; -- movswq_Gq_Ew SANITY
                when 193 => NEXT_OUTS <= 9; -- xaddq_Eq_Gq SANITY
                when 200 => NEXT_OUTS <= 120; -- bswapq_RRX SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 551; -- adcq_Eq_Gq SANITY
            when 19 => NEXT_OUTS <= 446; -- adcq_Gq_Eq SANITY
            when 21 => NEXT_OUTS <= 535; -- adcq_RAX_sId SANITY
            when 25 => NEXT_OUTS <= 506; -- sbbq_Eq_Gq SANITY
            when 27 => NEXT_OUTS <= 765; -- sbbq_Gq_Eq SANITY
            when 29 => NEXT_OUTS <= 181; -- sbbq_RAX_sId SANITY
            when 33 => NEXT_OUTS <= 92; -- andq_Eq_Gq SANITY
            when 35 => NEXT_OUTS <= 498; -- andq_Gq_Eq SANITY
            when 37 => NEXT_OUTS <= 633; -- andq_RAX_sId SANITY
            when 41 => NEXT_OUTS <= 323; -- subq_Eq_Gq SANITY
            when 43 => NEXT_OUTS <= 734; -- subq_Gq_Eq SANITY
            when 45 => NEXT_OUTS <= 696; -- subq_RAX_sId SANITY
            when 49 => NEXT_OUTS <= 321; -- xorq_Eq_Gq SANITY
            when 51 => NEXT_OUTS <= 508; -- xorq_Gq_Eq SANITY
            when 53 => NEXT_OUTS <= 346; -- xorq_RAX_sId SANITY
            when 57 => NEXT_OUTS <= 540; -- cmpq_Eq_Gq SANITY
            when 59 => NEXT_OUTS <= 634; -- cmpq_Gq_Eq SANITY
            when 61 => NEXT_OUTS <= 210; -- cmpq_RAX_sId SANITY
            when 99 => NEXT_OUTS <= 7; -- movslq_Gq_Ed SANITY
            when 105 => NEXT_OUTS <= 620; -- imulq_Gq_Eq_sId SANITY
            when 107 => NEXT_OUTS <= 279; -- imulq_Gq_Eq_sIb SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 49; -- addq_Eq_sId SANITY
                when 8 => NEXT_OUTS <= 567; -- orq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 357; -- adcq_Eq_sId SANITY
                when 24 => NEXT_OUTS <= 173; -- sbbq_Eq_sId SANITY
                when 32 => NEXT_OUTS <= 167; -- andq_Eq_sId SANITY
                when 40 => NEXT_OUTS <= 427; -- subq_Eq_sId SANITY
                when 48 => NEXT_OUTS <= 501; -- xorq_Eq_sId SANITY
                when 56 => NEXT_OUTS <= 604; -- cmpq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 99; -- addq_Eq_sIb SANITY
                when 8 => NEXT_OUTS <= 22; -- orq_Eq_sIb SANITY
                when 16 => NEXT_OUTS <= 637; -- adcq_Eq_sIb SANITY
                when 24 => NEXT_OUTS <= 137; -- sbbq_Eq_sIb SANITY
                when 32 => NEXT_OUTS <= 695; -- andq_Eq_sIb SANITY
                when 40 => NEXT_OUTS <= 273; -- subq_Eq_sIb SANITY
                when 48 => NEXT_OUTS <= 744; -- xorq_Eq_sIb SANITY
                when 56 => NEXT_OUTS <= 339; -- cmpq_Eq_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 153; -- testq_Eq_Gq SANITY
            when 135 => NEXT_OUTS <= 559; -- xchgq_Eq_Gq SANITY
            when 137 => NEXT_OUTS <= 208; -- movq_Eq_Gq SANITY
            when 139 => NEXT_OUTS <= 81; -- movq_Gq_Eq SANITY
            when 141 => NEXT_OUTS <= 610; -- leaq_Gq_Mq SANITY
            when 145 => NEXT_OUTS <= 702; -- xchgq_RRX_RAX SANITY
            when 152 => NEXT_OUTS <= 240; -- cdqe SANITY
            when 153 => NEXT_OUTS <= 278; -- cqo SANITY
            when 161 => NEXT_OUTS <= 175; -- movq_RAX_Oq SANITY
            when 163 => NEXT_OUTS <= 437; -- movq_Oq_RAX SANITY
            when 165 => NEXT_OUTS <= 55; -- movsq_Yq_Xq SANITY
            when 167 => NEXT_OUTS <= 28; -- cmpsq_Yq_Xq SANITY
            when 169 => NEXT_OUTS <= 578; -- testq_RAX_sId SANITY
            when 171 => NEXT_OUTS <= 612; -- stosq_Yq_RAX SANITY
            when 173 => NEXT_OUTS <= 282; -- lodsq_RAX_Xq SANITY
            when 175 => NEXT_OUTS <= 576; -- scasq_Yq_RAX SANITY
            when 184 => NEXT_OUTS <= 416; -- movq_RRX_Iq SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 146; -- rolq_Eq_Ib SANITY
                when 8 => NEXT_OUTS <= 613; -- rorq_Eq_Ib SANITY
                when 16 => NEXT_OUTS <= 117; -- rclq_Eq_Ib SANITY
                when 24 => NEXT_OUTS <= 611; -- rcrq_Eq_Ib SANITY
                when 32 => NEXT_OUTS <= 631; -- shlq_Eq_Ib SANITY
                when 40 => NEXT_OUTS <= 722; -- shrq_Eq_Ib SANITY
                when 56 => NEXT_OUTS <= 242; -- sarq_Eq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 548; -- movq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 557; -- iretq SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 379; -- rolq_Eq_I1 SANITY
                when 8 => NEXT_OUTS <= 538; -- rorq_Eq_I1 SANITY
                when 16 => NEXT_OUTS <= 75; -- rclq_Eq_I1 SANITY
                when 24 => NEXT_OUTS <= 763; -- rcrq_Eq_I1 SANITY
                when 32 => NEXT_OUTS <= 721; -- shlq_Eq_I1 SANITY
                when 40 => NEXT_OUTS <= 188; -- shrq_Eq_I1 SANITY
                when 56 => NEXT_OUTS <= 58; -- sarq_Eq_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 395; -- rolq_Eq_CL SANITY
                when 8 => NEXT_OUTS <= 307; -- rorq_Eq_CL SANITY
                when 16 => NEXT_OUTS <= 493; -- rclq_Eq_CL SANITY
                when 24 => NEXT_OUTS <= 35; -- rcrq_Eq_CL SANITY
                when 32 => NEXT_OUTS <= 11; -- shlq_Eq_CL SANITY
                when 40 => NEXT_OUTS <= 363; -- shrq_Eq_CL SANITY
                when 56 => NEXT_OUTS <= 627; -- sarq_Eq_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 32; -- testq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 472; -- notq_Eq SANITY
                when 24 => NEXT_OUTS <= 186; -- negq_Eq SANITY
                when 32 => NEXT_OUTS <= 297; -- mulq_RAX_Eq SANITY
                when 40 => NEXT_OUTS <= 196; -- imulq_RAX_Eq SANITY
                when 48 => NEXT_OUTS <= 677; -- divq_RAX_Eq SANITY
                when 56 => NEXT_OUTS <= 371; -- idivq_RAX_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 350; -- incq_Eq SANITY
                when 8 => NEXT_OUTS <= 48; -- decq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 80 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 445; -- pushl_ERX SANITY
            when 1 => NEXT_OUTS <= 520; -- pushq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 88 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 47; -- popl_ERX SANITY
            when 1 => NEXT_OUTS <= 529; -- popq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 96 => NEXT_OUTS <= 271; -- pushal SANITY
        when 97 => NEXT_OUTS <= 479; -- popal SANITY
        when 98 => NEXT_OUTS <= 569; -- boundl_Gd_Ma SANITY
        when 99 => NEXT_OUTS <= 89; -- arpl_Ew_Gw SANITY
        when 102 => 
        case OP2 is
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 57; -- addw_Ew_Gw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => NEXT_OUTS <= 325; -- addw_Gw_Ew SANITY
            when 5 => NEXT_OUTS <= 361; -- addw_AX_Iw SANITY
            when 6 => NEXT_OUTS <= 30; -- pushw_ES SANITY
            when 7 => NEXT_OUTS <= 330; -- popw_ES SANITY
            when 9 => NEXT_OUTS <= 8; -- orw_Ew_Gw SANITY
            when 11 => NEXT_OUTS <= 349; -- orw_Gw_Ew SANITY
            when 13 => NEXT_OUTS <= 494; -- orw_AX_Iw SANITY
            when 14 => NEXT_OUTS <= 484; -- pushw_CS SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 674; -- larw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 380; -- lslw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 110 => NEXT_OUTS <= 61; -- movd_Vdq_Ed SANITY
                when 128 => NEXT_OUTS <= 648; -- jo_Jw SANITY
                when 129 => NEXT_OUTS <= 754; -- jno_Jw SANITY
                when 130 => NEXT_OUTS <= 79; -- jb_Jw SANITY
                when 131 => NEXT_OUTS <= 155; -- jnb_Jw SANITY
                when 132 => NEXT_OUTS <= 77; -- jz_Jw SANITY
                when 133 => NEXT_OUTS <= 345; -- jnz_Jw SANITY
                when 134 => NEXT_OUTS <= 768; -- jbe_Jw SANITY
                when 135 => NEXT_OUTS <= 96; -- jnbe_Jw SANITY
                when 136 => NEXT_OUTS <= 263; -- js_Jw SANITY
                when 137 => NEXT_OUTS <= 642; -- jns_Jw SANITY
                when 138 => NEXT_OUTS <= 2; -- jp_Jw SANITY
                when 139 => NEXT_OUTS <= 662; -- jnp_Jw SANITY
                when 140 => NEXT_OUTS <= 394; -- jl_Jw SANITY
                when 141 => NEXT_OUTS <= 274; -- jnl_Jw SANITY
                when 142 => NEXT_OUTS <= 653; -- jle_Jw SANITY
                when 143 => NEXT_OUTS <= 38; -- jnle_Jw SANITY
                when 160 => NEXT_OUTS <= 470; -- pushw_FS SANITY
                when 161 => NEXT_OUTS <= 751; -- popw_FS SANITY
                when 163 => NEXT_OUTS <= 421; -- btw_Ew_Gw SANITY
                when 164 => NEXT_OUTS <= 46; -- shldw_Ew_Gw_Ib SANITY
                when 165 => NEXT_OUTS <= 778; -- shldw_Ew_Gw_CL SANITY
                when 168 => NEXT_OUTS <= 693; -- pushw_GS SANITY
                when 169 => NEXT_OUTS <= 570; -- popw_GS SANITY
                when 171 => NEXT_OUTS <= 657; -- btsw_Ew_Gw SANITY
                when 172 => NEXT_OUTS <= 458; -- shrdw_Ew_Gw_Ib SANITY
                when 173 => NEXT_OUTS <= 376; -- shrdw_Ew_Gw_CL SANITY
                when 175 => NEXT_OUTS <= 684; -- imulw_Gw_Ew SANITY
                when 177 => NEXT_OUTS <= 54; -- cmpxchgw_Ew_Gw SANITY
                when 178 => NEXT_OUTS <= 64; -- lssw_Gw_Mp SANITY
                when 179 => NEXT_OUTS <= 332; -- btrw_Ew_Gw SANITY
                when 180 => NEXT_OUTS <= 17; -- lfsw_Gw_Mp SANITY
                when 181 => NEXT_OUTS <= 308; -- lgsw_Gw_Mp SANITY
                when 182 => NEXT_OUTS <= 589; -- movzbw_Gw_Eb SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 418; -- btw_Ew_Ib SANITY
                    when 40 => NEXT_OUTS <= 533; -- btsw_Ew_Ib SANITY
                    when 48 => NEXT_OUTS <= 269; -- btrw_Ew_Ib SANITY
                    when 56 => NEXT_OUTS <= 438; -- btcw_Ew_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 187 => NEXT_OUTS <= 80; -- btcw_Ew_Gw SANITY
                when 190 => NEXT_OUTS <= 106; -- movsbw_Gw_Eb SANITY
                when 193 => NEXT_OUTS <= 526; -- xaddw_Ew_Gw SANITY
                when 199 => 
                case OP4 is
                    when 48 => NEXT_OUTS <= 420; -- vmclear_Mq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 43; -- adcw_Ew_Gw SANITY
            when 19 => NEXT_OUTS <= 469; -- adcw_Gw_Ew SANITY
            when 21 => NEXT_OUTS <= 593; -- adcw_AX_Iw SANITY
            when 22 => NEXT_OUTS <= 370; -- pushw_SS SANITY
            when 23 => NEXT_OUTS <= 294; -- popw_SS SANITY
            when 25 => NEXT_OUTS <= 715; -- sbbw_Ew_Gw SANITY
            when 27 => NEXT_OUTS <= 217; -- sbbw_Gw_Ew SANITY
            when 29 => NEXT_OUTS <= 655; -- sbbw_AX_Iw SANITY
            when 30 => NEXT_OUTS <= 646; -- pushw_DS SANITY
            when 31 => NEXT_OUTS <= 123; -- popw_DS SANITY
            when 33 => NEXT_OUTS <= 496; -- andw_Ew_Gw SANITY
            when 35 => NEXT_OUTS <= 203; -- andw_Gw_Ew SANITY
            when 37 => NEXT_OUTS <= 523; -- andw_AX_Iw SANITY
            when 41 => NEXT_OUTS <= 118; -- subw_Ew_Gw SANITY
            when 43 => NEXT_OUTS <= 760; -- subw_Gw_Ew SANITY
            when 45 => NEXT_OUTS <= 87; -- subw_AX_Iw SANITY
            when 49 => NEXT_OUTS <= 280; -- xorw_Ew_Gw SANITY
            when 51 => NEXT_OUTS <= 337; -- xorw_Gw_Ew SANITY
            when 53 => NEXT_OUTS <= 654; -- xorw_AX_Iw SANITY
            when 57 => NEXT_OUTS <= 705; -- cmpw_Ew_Gw SANITY
            when 59 => NEXT_OUTS <= 31; -- cmpw_Gw_Ew SANITY
            when 61 => NEXT_OUTS <= 86; -- cmpw_AX_Iw SANITY
            when 64 => NEXT_OUTS <= 460; -- incw_RX SANITY
            when 72 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 110 => NEXT_OUTS <= 177; -- movq_Vdq_Eq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 80 => NEXT_OUTS <= 172; -- pushw_RX SANITY
            when 88 => NEXT_OUTS <= 510; -- popw_RX SANITY
            when 96 => NEXT_OUTS <= 390; -- pushaw SANITY
            when 97 => NEXT_OUTS <= 632; -- popaw SANITY
            when 98 => NEXT_OUTS <= 386; -- boundw_Gw_Ma SANITY
            when 104 => NEXT_OUTS <= 162; -- pushw_Iw SANITY
            when 105 => NEXT_OUTS <= 541; -- imulw_Gw_Ew_Iw SANITY
            when 106 => NEXT_OUTS <= 481; -- pushw_sIb SANITY
            when 107 => NEXT_OUTS <= 411; -- imulw_Gw_Ew_sIb SANITY
            when 109 => NEXT_OUTS <= 597; -- insw_Yw_DX SANITY
            when 111 => NEXT_OUTS <= 214; -- outsw_DX_Xw SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 550; -- addw_Ew_Iw SANITY
                when 8 => NEXT_OUTS <= 641; -- orw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 246; -- adcw_Ew_Iw SANITY
                when 24 => NEXT_OUTS <= 101; -- sbbw_Ew_Iw SANITY
                when 32 => NEXT_OUTS <= 110; -- andw_Ew_Iw SANITY
                when 40 => NEXT_OUTS <= 423; -- subw_Ew_Iw SANITY
                when 48 => NEXT_OUTS <= 663; -- xorw_Ew_Iw SANITY
                when 56 => NEXT_OUTS <= 772; -- cmpw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 327; -- addw_Ew_sIb SANITY
                when 8 => NEXT_OUTS <= 476; -- orw_Ew_sIb SANITY
                when 16 => NEXT_OUTS <= 93; -- adcw_Ew_sIb SANITY
                when 24 => NEXT_OUTS <= 129; -- sbbw_Ew_sIb SANITY
                when 32 => NEXT_OUTS <= 694; -- andw_Ew_sIb SANITY
                when 40 => NEXT_OUTS <= 127; -- subw_Ew_sIb SANITY
                when 48 => NEXT_OUTS <= 717; -- xorw_Ew_sIb SANITY
                when 56 => NEXT_OUTS <= 141; -- cmpw_Ew_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 206; -- testw_Ew_Gw SANITY
            when 135 => NEXT_OUTS <= 726; -- xchgw_Ew_Gw SANITY
            when 137 => NEXT_OUTS <= 773; -- movw_Ew_Gw SANITY
            when 139 => NEXT_OUTS <= 582; -- movw_Gw_Ew SANITY
            when 141 => NEXT_OUTS <= 723; -- leaw_Gw_Mw SANITY
            when 143 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 762; -- popw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 145 => NEXT_OUTS <= 682; -- xchgw_RX_AX SANITY
            when 152 => NEXT_OUTS <= 298; -- cbw SANITY
            when 153 => NEXT_OUTS <= 482; -- cwd SANITY
            when 154 => NEXT_OUTS <= 434; -- lcall_Apw SANITY
            when 156 => NEXT_OUTS <= 329; -- pushfw SANITY
            when 157 => NEXT_OUTS <= 758; -- popfw SANITY
            when 161 => NEXT_OUTS <= 125; -- movw_AX_Ow SANITY
            when 163 => NEXT_OUTS <= 309; -- movw_Ow_AX SANITY
            when 165 => NEXT_OUTS <= 352; -- movsw_Yw_Xw SANITY
            when 167 => NEXT_OUTS <= 629; -- cmpsw_Yw_Xw SANITY
            when 169 => NEXT_OUTS <= 749; -- testw_AX_Iw SANITY
            when 171 => NEXT_OUTS <= 287; -- stosw_Yw_AX SANITY
            when 173 => NEXT_OUTS <= 320; -- lodsw_AX_Xw SANITY
            when 175 => NEXT_OUTS <= 739; -- scasw_Yw_AX SANITY
            when 184 => NEXT_OUTS <= 690; -- movw_RX_Iw SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 105; -- rolw_Ew_Ib SANITY
                when 8 => NEXT_OUTS <= 741; -- rorw_Ew_Ib SANITY
                when 16 => NEXT_OUTS <= 248; -- rclw_Ew_Ib SANITY
                when 24 => NEXT_OUTS <= 603; -- rcrw_Ew_Ib SANITY
                when 32 => NEXT_OUTS <= 626; -- shlw_Ew_Ib SANITY
                when 40 => NEXT_OUTS <= 554; -- shrw_Ew_Ib SANITY
                when 56 => NEXT_OUTS <= 668; -- sarw_Ew_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 196 => NEXT_OUTS <= 467; -- lesw_Gw_Mp SANITY
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 353; -- movw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 720; -- iretw SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 584; -- rolw_Ew_I1 SANITY
                when 8 => NEXT_OUTS <= 740; -- rorw_Ew_I1 SANITY
                when 16 => NEXT_OUTS <= 360; -- rclw_Ew_I1 SANITY
                when 24 => NEXT_OUTS <= 628; -- rcrw_Ew_I1 SANITY
                when 32 => NEXT_OUTS <= 195; -- shlw_Ew_I1 SANITY
                when 40 => NEXT_OUTS <= 169; -- shrw_Ew_I1 SANITY
                when 56 => NEXT_OUTS <= 226; -- sarw_Ew_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 579; -- rolw_Ew_CL SANITY
                when 8 => NEXT_OUTS <= 709; -- rorw_Ew_CL SANITY
                when 16 => NEXT_OUTS <= 387; -- rclw_Ew_CL SANITY
                when 24 => NEXT_OUTS <= 396; -- rcrw_Ew_CL SANITY
                when 32 => NEXT_OUTS <= 97; -- shlw_Ew_CL SANITY
                when 40 => NEXT_OUTS <= 686; -- shrw_Ew_CL SANITY
                when 56 => NEXT_OUTS <= 29; -- sarw_Ew_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 229 => NEXT_OUTS <= 466; -- inw_AX_Ib SANITY
            when 231 => NEXT_OUTS <= 780; -- outw_Ib_AX SANITY
            when 232 => NEXT_OUTS <= 473; -- call_Jw SANITY
            when 233 => NEXT_OUTS <= 746; -- jmp_Jw SANITY
            when 234 => NEXT_OUTS <= 384; -- ljmp_Apw SANITY
            when 237 => NEXT_OUTS <= 724; -- inw_AX_DX SANITY
            when 239 => NEXT_OUTS <= 200; -- outw_DX_AX SANITY
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 542; -- testw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 265; -- notw_Ew SANITY
                when 24 => NEXT_OUTS <= 122; -- negw_Ew SANITY
                when 32 => NEXT_OUTS <= 651; -- mulw_AX_Ew SANITY
                when 40 => NEXT_OUTS <= 767; -- imulw_AX_Ew SANITY
                when 48 => NEXT_OUTS <= 281; -- divw_AX_Ew SANITY
                when 56 => NEXT_OUTS <= 245; -- idivw_AX_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 776; -- incw_Ew SANITY
                when 8 => NEXT_OUTS <= 656; -- decw_Ew SANITY
                when 16 => NEXT_OUTS <= 398; -- call_Ew SANITY
                when 32 => NEXT_OUTS <= 193; -- jmp_Ew SANITY
                when 48 => NEXT_OUTS <= 52; -- pushw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 103 => 
        case OP2 is
            when 227 => NEXT_OUTS <= 748; -- jcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 104 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 464; -- pushl_Id SANITY
            when 1 => NEXT_OUTS <= 277; -- pushq_sId SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 105 => NEXT_OUTS <= 701; -- imull_Gd_Ed_Id SANITY
        when 106 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 536; -- pushl_sIb SANITY
            when 1 => NEXT_OUTS <= 562; -- pushq_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 107 => NEXT_OUTS <= 719; -- imull_Gd_Ed_sIb SANITY
        when 108 => NEXT_OUTS <= 310; -- insb_Yb_DX SANITY
        when 109 => NEXT_OUTS <= 205; -- insl_Yd_DX SANITY
        when 110 => NEXT_OUTS <= 6; -- outsb_DX_Xb SANITY
        when 111 => NEXT_OUTS <= 594; -- outsl_DX_Xd SANITY
        when 112 => NEXT_OUTS <= 665; -- jo_Jb SANITY
        when 113 => NEXT_OUTS <= 354; -- jno_Jb SANITY
        when 114 => NEXT_OUTS <= 185; -- jb_Jb SANITY
        when 115 => NEXT_OUTS <= 643; -- jnb_Jb SANITY
        when 116 => NEXT_OUTS <= 157; -- jz_Jb SANITY
        when 117 => NEXT_OUTS <= 591; -- jnz_Jb SANITY
        when 118 => NEXT_OUTS <= 165; -- jbe_Jb SANITY
        when 119 => NEXT_OUTS <= 314; -- jnbe_Jb SANITY
        when 120 => NEXT_OUTS <= 232; -- js_Jb SANITY
        when 121 => NEXT_OUTS <= 102; -- jns_Jb SANITY
        when 122 => NEXT_OUTS <= 462; -- jp_Jb SANITY
        when 123 => NEXT_OUTS <= 88; -- jnp_Jb SANITY
        when 124 => NEXT_OUTS <= 517; -- jl_Jb SANITY
        when 125 => NEXT_OUTS <= 490; -- jnl_Jb SANITY
        when 126 => NEXT_OUTS <= 522; -- jle_Jb SANITY
        when 127 => NEXT_OUTS <= 72; -- jnle_Jb SANITY
        when 128 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 351; -- addb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 116; -- orb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 691; -- adcb_Eb_Ib SANITY
            when 24 => NEXT_OUTS <= 507; -- sbbb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 704; -- andb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 150; -- subb_Eb_Ib SANITY
            when 48 => NEXT_OUTS <= 521; -- xorb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 219; -- cmpb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 129 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 454; -- addl_Ed_Id SANITY
            when 8 => NEXT_OUTS <= 243; -- orl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 728; -- adcl_Ed_Id SANITY
            when 24 => NEXT_OUTS <= 199; -- sbbl_Ed_Id SANITY
            when 32 => NEXT_OUTS <= 223; -- andl_Ed_Id SANITY
            when 40 => NEXT_OUTS <= 714; -- subl_Ed_Id SANITY
            when 48 => NEXT_OUTS <= 42; -- xorl_Ed_Id SANITY
            when 56 => NEXT_OUTS <= 285; -- cmpl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 131 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 45; -- addl_Ed_sIb SANITY
            when 8 => NEXT_OUTS <= 266; -- orl_Ed_sIb SANITY
            when 16 => NEXT_OUTS <= 334; -- adcl_Ed_sIb SANITY
            when 24 => NEXT_OUTS <= 401; -- sbbl_Ed_sIb SANITY
            when 32 => NEXT_OUTS <= 59; -- andl_Ed_sIb SANITY
            when 40 => NEXT_OUTS <= 549; -- subl_Ed_sIb SANITY
            when 48 => NEXT_OUTS <= 422; -- xorl_Ed_sIb SANITY
            when 56 => NEXT_OUTS <= 109; -- cmpl_Ed_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 132 => NEXT_OUTS <= 614; -- testb_Eb_Gb SANITY
        when 133 => NEXT_OUTS <= 700; -- testl_Ed_Gd SANITY
        when 134 => NEXT_OUTS <= 623; -- xchgb_Eb_Gb SANITY
        when 135 => NEXT_OUTS <= 553; -- xchgl_Ed_Gd SANITY
        when 136 => NEXT_OUTS <= 255; -- movb_Eb_Gb SANITY
        when 137 => NEXT_OUTS <= 166; -- movl_Ed_Gd SANITY
        when 138 => NEXT_OUTS <= 598; -- movb_Gb_Eb SANITY
        when 139 => NEXT_OUTS <= 752; -- movl_Gd_Ed SANITY
        when 140 => NEXT_OUTS <= 348; -- movw_Ew_Sw SANITY
        when 141 => NEXT_OUTS <= 326; -- leal_Gd_Md SANITY
        when 142 => NEXT_OUTS <= 231; -- movw_Sw_Ew SANITY
        when 143 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 707; -- popl_Ed SANITY
                when 1 => NEXT_OUTS <= 635; -- popq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 144 => NEXT_OUTS <= 601; -- nop SANITY
        when 145 => NEXT_OUTS <= 640; -- xchgl_ERX_EAX SANITY
        when 152 => NEXT_OUTS <= 750; -- cwde SANITY
        when 153 => NEXT_OUTS <= 666; -- cdq SANITY
        when 154 => NEXT_OUTS <= 413; -- lcall_Apd SANITY
        when 155 => NEXT_OUTS <= 85; -- fwait SANITY
        when 156 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 685; -- pushfl SANITY
            when 1 => NEXT_OUTS <= 392; -- pushfq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 157 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 44; -- popfl SANITY
            when 1 => NEXT_OUTS <= 393; -- popfq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 158 => NEXT_OUTS <= 183; -- sahf SANITY
        when 159 => NEXT_OUTS <= 151; -- lahf SANITY
        when 160 => NEXT_OUTS <= 244; -- movb_AL_Ob SANITY
        when 161 => NEXT_OUTS <= 537; -- movl_EAX_Od SANITY
        when 162 => NEXT_OUTS <= 531; -- movb_Ob_AL SANITY
        when 163 => NEXT_OUTS <= 764; -- movl_Od_EAX SANITY
        when 164 => NEXT_OUTS <= 149; -- movsb_Yb_Xb SANITY
        when 165 => NEXT_OUTS <= 5; -- movsl_Yd_Xd SANITY
        when 166 => NEXT_OUTS <= 703; -- cmpsb_Yb_Xb SANITY
        when 167 => NEXT_OUTS <= 126; -- cmpsl_Yd_Xd SANITY
        when 168 => NEXT_OUTS <= 187; -- testb_AL_Ib SANITY
        when 169 => NEXT_OUTS <= 534; -- testl_EAX_Id SANITY
        when 170 => NEXT_OUTS <= 687; -- stosb_Yb_AL SANITY
        when 171 => NEXT_OUTS <= 249; -- stosl_Yd_EAX SANITY
        when 172 => NEXT_OUTS <= 291; -- lodsb_AL_Xb SANITY
        when 173 => NEXT_OUTS <= 622; -- lodsl_EAX_Xd SANITY
        when 174 => NEXT_OUTS <= 546; -- scasb_Yb_AL SANITY
        when 175 => NEXT_OUTS <= 775; -- scasl_Yd_EAX SANITY
        when 176 => NEXT_OUTS <= 213; -- movb_R8_Ib SANITY
        when 184 => NEXT_OUTS <= 107; -- movl_ERX_Id SANITY
        when 192 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 736; -- rolb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 756; -- rorb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 216; -- rclb_Eb_Ib SANITY
            when 24 => NEXT_OUTS <= 302; -- rcrb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 532; -- shlb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 286; -- shrb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 73; -- sarb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 193 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 164; -- roll_Ed_Ib SANITY
            when 8 => NEXT_OUTS <= 527; -- rorl_Ed_Ib SANITY
            when 16 => NEXT_OUTS <= 449; -- rcll_Ed_Ib SANITY
            when 24 => NEXT_OUTS <= 742; -- rcrl_Ed_Ib SANITY
            when 32 => NEXT_OUTS <= 435; -- shll_Ed_Ib SANITY
            when 40 => NEXT_OUTS <= 680; -- shrl_Ed_Ib SANITY
            when 56 => NEXT_OUTS <= 36; -- sarl_Ed_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 194 => NEXT_OUTS <= 563; -- ret_Iw SANITY
        when 195 => NEXT_OUTS <= 552; -- ret SANITY
        when 196 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 228; -- lesl_Gd_Mp SANITY
            when 225 => 
            case OP3 is
                when 249 => 
                case OP4 is
                    when 110 => NEXT_OUTS <= 338; -- vmovq_Vdq_Eq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 226 => 
            case OP3 is
                when 121 => 
                case OP4 is
                    when 19 => NEXT_OUTS <= 595; -- vcvtph2ps_Vps_Wq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 227 => 
            case OP3 is
                when 121 => 
                case OP4 is
                    when 29 => NEXT_OUTS <= 94; -- vcvtps2ph_Wq_Vps_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 197 => 
        case OP2 is
            when 249 => 
            case OP3 is
                when 110 => NEXT_OUTS <= 367; -- vmovd_Vdq_Ed SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 198 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 140; -- movb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 199 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 649; -- movl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 200 => NEXT_OUTS <= 66; -- enter SANITY
        when 201 => NEXT_OUTS <= 779; -- leave SANITY
        when 202 => NEXT_OUTS <= 136; -- lret_Iw SANITY
        when 203 => NEXT_OUTS <= 252; -- lret SANITY
        when 204 => NEXT_OUTS <= 447; -- int3 SANITY
        when 205 => NEXT_OUTS <= 56; -- int_Ib SANITY
        when 206 => NEXT_OUTS <= 128; -- into SANITY
        when 207 => NEXT_OUTS <= 268; -- iretl SANITY
        when 208 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 19; -- rolb_Eb_I1 SANITY
            when 8 => NEXT_OUTS <= 152; -- rorb_Eb_I1 SANITY
            when 16 => NEXT_OUTS <= 90; -- rclb_Eb_I1 SANITY
            when 24 => NEXT_OUTS <= 605; -- rcrb_Eb_I1 SANITY
            when 32 => NEXT_OUTS <= 774; -- shlb_Eb_I1 SANITY
            when 40 => NEXT_OUTS <= 606; -- shrb_Eb_I1 SANITY
            when 56 => NEXT_OUTS <= 516; -- sarb_Eb_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 209 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 290; -- roll_Ed_I1 SANITY
            when 8 => NEXT_OUTS <= 209; -- rorl_Ed_I1 SANITY
            when 16 => NEXT_OUTS <= 414; -- rcll_Ed_I1 SANITY
            when 24 => NEXT_OUTS <= 524; -- rcrl_Ed_I1 SANITY
            when 32 => NEXT_OUTS <= 530; -- shll_Ed_I1 SANITY
            when 40 => NEXT_OUTS <= 436; -- shrl_Ed_I1 SANITY
            when 56 => NEXT_OUTS <= 440; -- sarl_Ed_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 210 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 236; -- rolb_Eb_CL SANITY
            when 8 => NEXT_OUTS <= 221; -- rorb_Eb_CL SANITY
            when 16 => NEXT_OUTS <= 4; -- rclb_Eb_CL SANITY
            when 24 => NEXT_OUTS <= 132; -- rcrb_Eb_CL SANITY
            when 32 => NEXT_OUTS <= 406; -- shlb_Eb_CL SANITY
            when 40 => NEXT_OUTS <= 198; -- shrb_Eb_CL SANITY
            when 56 => NEXT_OUTS <= 519; -- sarb_Eb_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 211 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 51; -- roll_Ed_CL SANITY
            when 8 => NEXT_OUTS <= 509; -- rorl_Ed_CL SANITY
            when 16 => NEXT_OUTS <= 76; -- rcll_Ed_CL SANITY
            when 24 => NEXT_OUTS <= 608; -- rcrl_Ed_CL SANITY
            when 32 => NEXT_OUTS <= 785; -- shll_Ed_CL SANITY
            when 40 => NEXT_OUTS <= 18; -- shrl_Ed_CL SANITY
            when 56 => NEXT_OUTS <= 33; -- sarl_Ed_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 212 => NEXT_OUTS <= 135; -- aam SANITY
        when 213 => NEXT_OUTS <= 572; -- aad SANITY
        when 214 => NEXT_OUTS <= 777; -- salc SANITY
        when 215 => NEXT_OUTS <= 368; -- xlat SANITY
        when 216 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 372; -- fadds_Md SANITY
            when 8 => NEXT_OUTS <= 645; -- fmuls_Md SANITY
            when 16 => NEXT_OUTS <= 515; -- fcoms_Md SANITY
            when 24 => NEXT_OUTS <= 716; -- fcomps_Md SANITY
            when 32 => NEXT_OUTS <= 342; -- fsubs_Md SANITY
            when 40 => NEXT_OUTS <= 430; -- fsubrs_Md SANITY
            when 48 => NEXT_OUTS <= 419; -- fdivs_Md SANITY
            when 56 => NEXT_OUTS <= 335; -- fdivrs_Md SANITY
            when 192 => NEXT_OUTS <= 483; -- fadd_ST0_STi SANITY
            when 200 => NEXT_OUTS <= 264; -- fmul_ST0_STi SANITY
            when 208 => NEXT_OUTS <= 698; -- fcom_STi SANITY
            when 216 => NEXT_OUTS <= 784; -- fcomp_STi SANITY
            when 224 => NEXT_OUTS <= 316; -- fsub_ST0_STi SANITY
            when 232 => NEXT_OUTS <= 375; -- fsubr_ST0_STi SANITY
            when 240 => NEXT_OUTS <= 131; -- fdiv_ST0_STi SANITY
            when 248 => NEXT_OUTS <= 60; -- fdivr_ST0_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 217 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 735; -- flds_Md SANITY
            when 16 => NEXT_OUTS <= 658; -- fsts_Md SANITY
            when 24 => NEXT_OUTS <= 588; -- fstps_Md SANITY
            when 32 => NEXT_OUTS <= 417; -- fldenv SANITY
            when 40 => NEXT_OUTS <= 545; -- fldcw SANITY
            when 48 => NEXT_OUTS <= 602; -- fnstenv SANITY
            when 56 => NEXT_OUTS <= 254; -- fnstcw SANITY
            when 192 => NEXT_OUTS <= 91; -- fld_STi SANITY
            when 200 => NEXT_OUTS <= 27; -- fxch SANITY
            when 208 => NEXT_OUTS <= 53; -- fnop SANITY
            when 224 => NEXT_OUTS <= 134; -- fchs SANITY
            when 225 => NEXT_OUTS <= 783; -- fabs SANITY
            when 228 => NEXT_OUTS <= 539; -- ftst SANITY
            when 229 => NEXT_OUTS <= 426; -- fxam SANITY
            when 232 => NEXT_OUTS <= 299; -- fld1 SANITY
            when 233 => NEXT_OUTS <= 16; -- fldl2t SANITY
            when 234 => NEXT_OUTS <= 678; -- fldl2e SANITY
            when 235 => NEXT_OUTS <= 650; -- fldpi SANITY
            when 236 => NEXT_OUTS <= 431; -- fldlg2 SANITY
            when 237 => NEXT_OUTS <= 585; -- fldln2 SANITY
            when 238 => NEXT_OUTS <= 25; -- fldz SANITY
            when 240 => NEXT_OUTS <= 170; -- f2xm1 SANITY
            when 241 => NEXT_OUTS <= 211; -- fyl2x SANITY
            when 242 => NEXT_OUTS <= 397; -- fptan SANITY
            when 243 => NEXT_OUTS <= 288; -- fpatan SANITY
            when 244 => NEXT_OUTS <= 621; -- fxtract SANITY
            when 245 => NEXT_OUTS <= 306; -- fprem1 SANITY
            when 246 => NEXT_OUTS <= 486; -- fdecstp SANITY
            when 247 => NEXT_OUTS <= 525; -- fincstp SANITY
            when 248 => NEXT_OUTS <= 586; -- fprem SANITY
            when 249 => NEXT_OUTS <= 68; -- fyl2xp1 SANITY
            when 250 => NEXT_OUTS <= 71; -- fsqrt SANITY
            when 251 => NEXT_OUTS <= 402; -- fsincos SANITY
            when 252 => NEXT_OUTS <= 224; -- frndint SANITY
            when 253 => NEXT_OUTS <= 373; -- fscale SANITY
            when 254 => NEXT_OUTS <= 439; -- fsin SANITY
            when 255 => NEXT_OUTS <= 272; -- fcos SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 218 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 276; -- fiaddl_Md SANITY
            when 8 => NEXT_OUTS <= 444; -- fimull_Md SANITY
            when 16 => NEXT_OUTS <= 673; -- ficoml_Md SANITY
            when 24 => NEXT_OUTS <= 82; -- ficompl_Md SANITY
            when 32 => NEXT_OUTS <= 747; -- fisubl_Md SANITY
            when 40 => NEXT_OUTS <= 270; -- fisubrl_Md SANITY
            when 48 => NEXT_OUTS <= 577; -- fidivl_Md SANITY
            when 56 => NEXT_OUTS <= 359; -- fidivrl_Md SANITY
            when 233 => NEXT_OUTS <= 34; -- fucompp SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 219 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 492; -- fildl_Md SANITY
            when 16 => NEXT_OUTS <= 112; -- fistl_Md SANITY
            when 24 => NEXT_OUTS <= 40; -- fistpl_Md SANITY
            when 40 => NEXT_OUTS <= 400; -- fldt_Mt SANITY
            when 56 => NEXT_OUTS <= 407; -- fstpt_Mt SANITY
            when 226 => NEXT_OUTS <= 388; -- fnclex SANITY
            when 227 => NEXT_OUTS <= 681; -- fninit SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 220 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 138; -- faddl_Mq SANITY
            when 8 => NEXT_OUTS <= 369; -- fmull_Mq SANITY
            when 16 => NEXT_OUTS <= 463; -- fcoml_Mq SANITY
            when 24 => NEXT_OUTS <= 600; -- fcompl_Mq SANITY
            when 32 => NEXT_OUTS <= 574; -- fsubl_Mq SANITY
            when 40 => NEXT_OUTS <= 256; -- fsubrl_Mq SANITY
            when 48 => NEXT_OUTS <= 587; -- fdivl_Mq SANITY
            when 56 => NEXT_OUTS <= 241; -- fdivrl_Mq SANITY
            when 192 => NEXT_OUTS <= 487; -- fadd_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 355; -- fmul_STi_ST0 SANITY
            when 224 => NEXT_OUTS <= 636; -- fsubr_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 78; -- fsub_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 669; -- fdivr_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 580; -- fdiv_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 221 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 500; -- fldl_Mq SANITY
            when 16 => NEXT_OUTS <= 505; -- fstl_Mq SANITY
            when 24 => NEXT_OUTS <= 63; -- fstpl_Mq SANITY
            when 32 => NEXT_OUTS <= 771; -- frstor SANITY
            when 48 => NEXT_OUTS <= 121; -- fnsave SANITY
            when 56 => NEXT_OUTS <= 759; -- fnstsw SANITY
            when 192 => NEXT_OUTS <= 713; -- ffree_STi SANITY
            when 208 => NEXT_OUTS <= 235; -- fst_STi SANITY
            when 216 => NEXT_OUTS <= 50; -- fstp_STi SANITY
            when 224 => NEXT_OUTS <= 289; -- fucom_STi SANITY
            when 232 => NEXT_OUTS <= 451; -- fucomp_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 222 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 502; -- fiadds_Mw SANITY
            when 8 => NEXT_OUTS <= 485; -- fimuls_Mw SANITY
            when 16 => NEXT_OUTS <= 781; -- ficoms_Mw SANITY
            when 24 => NEXT_OUTS <= 324; -- ficomps_Mw SANITY
            when 32 => NEXT_OUTS <= 333; -- fisubs_Mw SANITY
            when 40 => NEXT_OUTS <= 233; -- fisubrs_Mw SANITY
            when 48 => NEXT_OUTS <= 659; -- fidivs_Mw SANITY
            when 56 => NEXT_OUTS <= 98; -- fidivrs_Mw SANITY
            when 192 => NEXT_OUTS <= 84; -- faddp_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 171; -- fmulp_STi_ST0 SANITY
            when 217 => NEXT_OUTS <= 15; -- fcompp SANITY
            when 224 => NEXT_OUTS <= 644; -- fsubrp_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 403; -- fsubp_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 443; -- fdivrp_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 215; -- fdivp_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 223 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 377; -- filds_Mw SANITY
            when 16 => NEXT_OUTS <= 619; -- fists_Mw SANITY
            when 24 => NEXT_OUTS <= 37; -- fistps_Mw SANITY
            when 32 => NEXT_OUTS <= 425; -- fbldt_Mt SANITY
            when 40 => NEXT_OUTS <= 528; -- fildq_Mq SANITY
            when 48 => NEXT_OUTS <= 495; -- fbstpt_Mt SANITY
            when 56 => NEXT_OUTS <= 675; -- fistpq_Mq SANITY
            when 224 => NEXT_OUTS <= 260; -- fnstsw_AX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 224 => NEXT_OUTS <= 679; -- loopne_Jb SANITY
        when 225 => NEXT_OUTS <= 381; -- loope_Jb SANITY
        when 226 => NEXT_OUTS <= 692; -- loop_Jb SANITY
        when 227 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 432; -- jecxz_Jb SANITY
            when 1 => NEXT_OUTS <= 408; -- jrcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 228 => NEXT_OUTS <= 358; -- inb_AL_Ib SANITY
        when 229 => NEXT_OUTS <= 412; -- inl_EAX_Ib SANITY
        when 230 => NEXT_OUTS <= 10; -- outb_Ib_AL SANITY
        when 231 => NEXT_OUTS <= 671; -- outl_Ib_EAX SANITY
        when 232 => NEXT_OUTS <= 148; -- call_Jd SANITY
        when 233 => NEXT_OUTS <= 592; -- jmp_Jd SANITY
        when 234 => NEXT_OUTS <= 158; -- ljmp_Apd SANITY
        when 235 => NEXT_OUTS <= 124; -- jmp_Jb SANITY
        when 236 => NEXT_OUTS <= 455; -- inb_AL_DX SANITY
        when 237 => NEXT_OUTS <= 480; -- inl_EAX_DX SANITY
        when 238 => NEXT_OUTS <= 301; -- outb_DX_AL SANITY
        when 239 => NEXT_OUTS <= 317; -- outl_DX_EAX SANITY
        when 241 => NEXT_OUTS <= 296; -- int1 SANITY
        when 243 => 
        case OP2 is
            when 15 => 
            case OP3 is
                when 174 => 
                case OP4 is
                    when 192 => NEXT_OUTS <= 708; -- rdfsbase_Ry SANITY
                    when 200 => NEXT_OUTS <= 664; -- rdgsbase_Ry SANITY
                    when 208 => NEXT_OUTS <= 547; -- wrfsbase_Ry SANITY
                    when 216 => NEXT_OUTS <= 683; -- wrgsbase_Ry SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 144 => NEXT_OUTS <= 114; -- pause SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 244 => NEXT_OUTS <= 676; -- hlt SANITY
        when 245 => NEXT_OUTS <= 145; -- cmc SANITY
        when 246 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 475; -- testb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 133; -- notb_Eb SANITY
            when 24 => NEXT_OUTS <= 560; -- negb_Eb SANITY
            when 32 => NEXT_OUTS <= 638; -- mulb_AL_Eb SANITY
            when 40 => NEXT_OUTS <= 465; -- imulb_AL_Eb SANITY
            when 48 => NEXT_OUTS <= 230; -- divb_AL_Eb SANITY
            when 56 => NEXT_OUTS <= 555; -- idivb_AL_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 247 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 518; -- testl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 474; -- notl_Ed SANITY
            when 24 => NEXT_OUTS <= 275; -- negl_Ed SANITY
            when 32 => NEXT_OUTS <= 347; -- mull_EAX_Ed SANITY
            when 40 => NEXT_OUTS <= 667; -- imull_EAX_Ed SANITY
            when 48 => NEXT_OUTS <= 319; -- divl_EAX_Ed SANITY
            when 56 => NEXT_OUTS <= 731; -- idivl_EAX_Ed SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 248 => NEXT_OUTS <= 710; -- clc SANITY
        when 249 => NEXT_OUTS <= 630; -- stc SANITY
        when 250 => NEXT_OUTS <= 599; -- cli SANITY
        when 251 => NEXT_OUTS <= 222; -- sti SANITY
        when 252 => NEXT_OUTS <= 652; -- cld SANITY
        when 253 => NEXT_OUTS <= 405; -- std SANITY
        when 254 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 218; -- incb_Eb SANITY
            when 8 => NEXT_OUTS <= 119; -- decb_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 255 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 267; -- incl_Ed SANITY
            when 8 => NEXT_OUTS <= 378; -- decl_Ed SANITY
            when 16 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 239; -- call_Ed SANITY
                when 1 => NEXT_OUTS <= 113; -- call_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 24 => NEXT_OUTS <= 732; -- lcall_Mp SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 250; -- jmp_Ed SANITY
                when 1 => NEXT_OUTS <= 575; -- jmp_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 40 => NEXT_OUTS <= 293; -- ljmp_Mp SANITY
            when 48 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 757; -- pushl_Ed SANITY
                when 1 => NEXT_OUTS <= 180; -- pushq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when others => NEXT_OUTS <= 0; -- invalid
    end case;

  end process;
end behv;
