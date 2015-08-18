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
        when 0 => NEXT_OUTS <= 448; -- addb_Eb_Gb SANITY
        when 1 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 114; -- addl_Ed_Gd SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 2 => NEXT_OUTS <= 200; -- addb_Gb_Eb SANITY
        when 3 => NEXT_OUTS <= 678; -- addl_Gd_Ed SANITY
        when 4 => NEXT_OUTS <= 227; -- addb_AL_Ib SANITY
        when 5 => NEXT_OUTS <= 382; -- addl_EAX_Id SANITY
        when 6 => NEXT_OUTS <= 512; -- pushl_ES SANITY
        when 7 => NEXT_OUTS <= 185; -- popl_ES SANITY
        when 8 => NEXT_OUTS <= 524; -- orb_Eb_Gb SANITY
        when 9 => NEXT_OUTS <= 393; -- orl_Ed_Gd SANITY
        when 10 => NEXT_OUTS <= 337; -- orb_Gb_Eb SANITY
        when 11 => NEXT_OUTS <= 431; -- orl_Gd_Ed SANITY
        when 12 => NEXT_OUTS <= 128; -- orb_AL_Ib SANITY
        when 13 => NEXT_OUTS <= 261; -- orl_EAX_Id SANITY
        when 14 => NEXT_OUTS <= 329; -- pushl_CS SANITY
        when 15 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 335; -- sldt SANITY
                when 8 => NEXT_OUTS <= 442; -- str SANITY
                when 16 => NEXT_OUTS <= 488; -- lldt SANITY
                when 24 => NEXT_OUTS <= 650; -- ltr SANITY
                when 32 => NEXT_OUTS <= 381; -- verr SANITY
                when 40 => NEXT_OUTS <= 244; -- verw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 292; -- sgdt SANITY
                when 8 => NEXT_OUTS <= 205; -- sidt SANITY
                when 16 => NEXT_OUTS <= 238; -- lgdt SANITY
                when 24 => NEXT_OUTS <= 359; -- lidt SANITY
                when 32 => NEXT_OUTS <= 430; -- smsw_Ew SANITY
                when 48 => NEXT_OUTS <= 609; -- lmsw_Ew SANITY
                when 56 => NEXT_OUTS <= 67; -- invlpg SANITY
                when 248 => NEXT_OUTS <= 289; -- swapgs SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 2 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 253; -- larl_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 457; -- lsll_Gd_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 8 => NEXT_OUTS <= 252; -- invd SANITY
            when 9 => NEXT_OUTS <= 63; -- wbinvd SANITY
            when 11 => NEXT_OUTS <= 160; -- ud2a SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 129; -- movl_Rd_Cd SANITY
                when 1 => NEXT_OUTS <= 311; -- movq_Rq_Cq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 33 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 637; -- movl_Rd_Dd SANITY
                when 1 => NEXT_OUTS <= 242; -- movq_Rq_Dq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 34 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 392; -- movl_Cd_Rd SANITY
                when 1 => NEXT_OUTS <= 574; -- movq_Cq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 35 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 296; -- movl_Dd_Rd SANITY
                when 1 => NEXT_OUTS <= 646; -- movq_Dq_Rq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 36 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 9; -- movl_Rd_Td SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 38 => NEXT_OUTS <= 429; -- movl_Td_Rd SANITY
            when 110 => NEXT_OUTS <= 664; -- movd_Pq_Ed SANITY
            when 128 => NEXT_OUTS <= 368; -- jo_Jd SANITY
            when 129 => NEXT_OUTS <= 146; -- jno_Jd SANITY
            when 130 => NEXT_OUTS <= 376; -- jb_Jd SANITY
            when 131 => NEXT_OUTS <= 484; -- jnb_Jd SANITY
            when 132 => NEXT_OUTS <= 444; -- jz_Jd SANITY
            when 133 => NEXT_OUTS <= 240; -- jnz_Jd SANITY
            when 134 => NEXT_OUTS <= 652; -- jbe_Jd SANITY
            when 135 => NEXT_OUTS <= 281; -- jnbe_Jd SANITY
            when 136 => NEXT_OUTS <= 48; -- js_Jd SANITY
            when 137 => NEXT_OUTS <= 413; -- jns_Jd SANITY
            when 138 => NEXT_OUTS <= 461; -- jp_Jd SANITY
            when 139 => NEXT_OUTS <= 250; -- jnp_Jd SANITY
            when 140 => NEXT_OUTS <= 142; -- jl_Jd SANITY
            when 141 => NEXT_OUTS <= 388; -- jnl_Jd SANITY
            when 142 => NEXT_OUTS <= 319; -- jle_Jd SANITY
            when 143 => NEXT_OUTS <= 358; -- jnle_Jd SANITY
            when 144 => NEXT_OUTS <= 124; -- seto_Eb SANITY
            when 145 => NEXT_OUTS <= 251; -- setno_Eb SANITY
            when 146 => NEXT_OUTS <= 433; -- setb_Eb SANITY
            when 147 => NEXT_OUTS <= 586; -- setnb_Eb SANITY
            when 148 => NEXT_OUTS <= 414; -- setz_Eb SANITY
            when 149 => NEXT_OUTS <= 531; -- setnz_Eb SANITY
            when 150 => NEXT_OUTS <= 677; -- setbe_Eb SANITY
            when 151 => NEXT_OUTS <= 220; -- setnbe_Eb SANITY
            when 152 => NEXT_OUTS <= 674; -- sets_Eb SANITY
            when 153 => NEXT_OUTS <= 467; -- setns_Eb SANITY
            when 154 => NEXT_OUTS <= 16; -- setp_Eb SANITY
            when 155 => NEXT_OUTS <= 516; -- setnp_Eb SANITY
            when 156 => NEXT_OUTS <= 668; -- setl_Eb SANITY
            when 157 => NEXT_OUTS <= 110; -- setnl_Eb SANITY
            when 158 => NEXT_OUTS <= 621; -- setle_Eb SANITY
            when 159 => NEXT_OUTS <= 585; -- setnle_Eb SANITY
            when 160 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 507; -- pushl_FS SANITY
                when 1 => NEXT_OUTS <= 212; -- pushq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 161 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 274; -- popl_FS SANITY
                when 1 => NEXT_OUTS <= 540; -- popq_FS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 164 => NEXT_OUTS <= 474; -- shldl_Ed_Gd_Ib SANITY
            when 165 => NEXT_OUTS <= 568; -- shldl_Ed_Gd_CL SANITY
            when 168 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 485; -- pushl_GS SANITY
                when 1 => NEXT_OUTS <= 458; -- pushq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 169 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 445; -- popl_GS SANITY
                when 1 => NEXT_OUTS <= 428; -- popq_GS SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 170 => NEXT_OUTS <= 483; -- rsm SANITY
            when 172 => NEXT_OUTS <= 592; -- shrdl_Ed_Gd_Ib SANITY
            when 175 => NEXT_OUTS <= 410; -- imull_Gd_Ed SANITY
            when 178 => NEXT_OUTS <= 286; -- lssl_Gd_Mp SANITY
            when 180 => NEXT_OUTS <= 624; -- lfsl_Gd_Mp SANITY
            when 181 => NEXT_OUTS <= 647; -- lgsl_Gd_Mp SANITY
            when 182 => NEXT_OUTS <= 81; -- movzbl_Gd_Eb SANITY
            when 183 => NEXT_OUTS <= 59; -- movzwl_Gd_Ew SANITY
            when 185 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 15; -- ud2b SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 186 => 
            case OP3 is
                when 32 => NEXT_OUTS <= 552; -- btl_Ed_Ib SANITY
                when 40 => NEXT_OUTS <= 670; -- btsl_Ed_Ib SANITY
                when 48 => NEXT_OUTS <= 477; -- btrl_Ed_Ib SANITY
                when 56 => NEXT_OUTS <= 230; -- btcl_Ed_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 190 => NEXT_OUTS <= 171; -- movsbl_Gd_Eb SANITY
            when 191 => NEXT_OUTS <= 395; -- movswl_Gd_Ew SANITY
            when 199 => 
            case OP3 is
                when 48 => NEXT_OUTS <= 268; -- vmptrld_Mq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 200 => NEXT_OUTS <= 5; -- bswapl_ERX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 16 => NEXT_OUTS <= 422; -- adcb_Eb_Gb SANITY
        when 17 => NEXT_OUTS <= 31; -- adcl_Ed_Gd SANITY
        when 18 => NEXT_OUTS <= 450; -- adcb_Gb_Eb SANITY
        when 19 => NEXT_OUTS <= 564; -- adcl_Gd_Ed SANITY
        when 20 => NEXT_OUTS <= 168; -- adcb_AL_Ib SANITY
        when 21 => NEXT_OUTS <= 93; -- adcl_EAX_Id SANITY
        when 22 => NEXT_OUTS <= 473; -- pushl_SS SANITY
        when 23 => NEXT_OUTS <= 78; -- popl_SS SANITY
        when 24 => NEXT_OUTS <= 195; -- sbbb_Eb_Gb SANITY
        when 25 => NEXT_OUTS <= 216; -- sbbl_Ed_Gd SANITY
        when 26 => NEXT_OUTS <= 432; -- sbbb_Gb_Eb SANITY
        when 27 => NEXT_OUTS <= 471; -- sbbl_Gd_Ed SANITY
        when 28 => NEXT_OUTS <= 515; -- sbbb_AL_Ib SANITY
        when 29 => NEXT_OUTS <= 506; -- sbbl_EAX_Id SANITY
        when 30 => NEXT_OUTS <= 525; -- pushl_DS SANITY
        when 31 => NEXT_OUTS <= 135; -- popl_DS SANITY
        when 32 => NEXT_OUTS <= 107; -- andb_Eb_Gb SANITY
        when 33 => NEXT_OUTS <= 519; -- andl_Ed_Gd SANITY
        when 34 => NEXT_OUTS <= 22; -- andb_Gb_Eb SANITY
        when 35 => NEXT_OUTS <= 183; -- andl_Gd_Ed SANITY
        when 36 => NEXT_OUTS <= 648; -- andb_AL_Ib SANITY
        when 37 => NEXT_OUTS <= 14; -- andl_EAX_Id SANITY
        when 39 => NEXT_OUTS <= 52; -- daa SANITY
        when 40 => NEXT_OUTS <= 316; -- subb_Eb_Gb SANITY
        when 41 => NEXT_OUTS <= 642; -- subl_Ed_Gd SANITY
        when 42 => NEXT_OUTS <= 223; -- subb_Gb_Eb SANITY
        when 43 => NEXT_OUTS <= 18; -- subl_Gd_Ed SANITY
        when 44 => NEXT_OUTS <= 293; -- subb_AL_Ib SANITY
        when 45 => NEXT_OUTS <= 280; -- subl_EAX_Id SANITY
        when 47 => NEXT_OUTS <= 156; -- das SANITY
        when 48 => NEXT_OUTS <= 663; -- xorb_Eb_Gb SANITY
        when 49 => NEXT_OUTS <= 116; -- xorl_Ed_Gd SANITY
        when 50 => NEXT_OUTS <= 199; -- xorb_Gb_Eb SANITY
        when 51 => NEXT_OUTS <= 36; -- xorl_Gd_Ed SANITY
        when 52 => NEXT_OUTS <= 386; -- xorb_AL_Ib SANITY
        when 53 => NEXT_OUTS <= 669; -- xorl_EAX_Id SANITY
        when 55 => NEXT_OUTS <= 176; -- aaa SANITY
        when 56 => NEXT_OUTS <= 290; -- cmpb_Eb_Gb SANITY
        when 57 => NEXT_OUTS <= 121; -- cmpl_Ed_Gd SANITY
        when 58 => NEXT_OUTS <= 370; -- cmpb_Gb_Eb SANITY
        when 59 => NEXT_OUTS <= 260; -- cmpl_Gd_Ed SANITY
        when 60 => NEXT_OUTS <= 333; -- cmpb_AL_Ib SANITY
        when 61 => NEXT_OUTS <= 561; -- cmpl_EAX_Id SANITY
        when 63 => NEXT_OUTS <= 475; -- aas SANITY
        when 64 => NEXT_OUTS <= 417; -- incl_ERX SANITY
        when 72 => 
        case OP2 is
            when 1 => NEXT_OUTS <= 209; -- addq_Eq_Gq SANITY
            when 3 => NEXT_OUTS <= 545; -- addq_Gq_Eq SANITY
            when 5 => NEXT_OUTS <= 65; -- addq_RAX_sId SANITY
            when 9 => NEXT_OUTS <= 385; -- orq_Eq_Gq SANITY
            when 11 => NEXT_OUTS <= 33; -- orq_Gq_Eq SANITY
            when 13 => NEXT_OUTS <= 130; -- orq_RAX_sId SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 232; -- larq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 331; -- lslq_Gq_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 110 => NEXT_OUTS <= 371; -- movq_Pq_Eq SANITY
                when 164 => NEXT_OUTS <= 391; -- shldq_Eq_Gq_Ib SANITY
                when 165 => NEXT_OUTS <= 304; -- shldq_Eq_Gq_CL SANITY
                when 172 => NEXT_OUTS <= 625; -- shrdq_Eq_Gq_Ib SANITY
                when 175 => NEXT_OUTS <= 619; -- imulq_Gq_Eq SANITY
                when 178 => NEXT_OUTS <= 39; -- lssq_Gq_Mp SANITY
                when 180 => NEXT_OUTS <= 487; -- lfsq_Gq_Mp SANITY
                when 181 => NEXT_OUTS <= 551; -- lgsq_Gq_Mp SANITY
                when 182 => NEXT_OUTS <= 291; -- movzbq_Gq_Eb SANITY
                when 183 => NEXT_OUTS <= 566; -- movzwq_Gq_Ew SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 177; -- btq_Eq_Ib SANITY
                    when 40 => NEXT_OUTS <= 526; -- btsq_Eq_Ib SANITY
                    when 48 => NEXT_OUTS <= 383; -- btrq_Eq_Ib SANITY
                    when 56 => NEXT_OUTS <= 491; -- btcq_Eq_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 190 => NEXT_OUTS <= 172; -- movsbq_Gq_Eb SANITY
                when 191 => NEXT_OUTS <= 125; -- movswq_Gq_Ew SANITY
                when 200 => NEXT_OUTS <= 453; -- bswapq_RRX SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 571; -- adcq_Eq_Gq SANITY
            when 19 => NEXT_OUTS <= 616; -- adcq_Gq_Eq SANITY
            when 21 => NEXT_OUTS <= 426; -- adcq_RAX_sId SANITY
            when 25 => NEXT_OUTS <= 150; -- sbbq_Eq_Gq SANITY
            when 27 => NEXT_OUTS <= 119; -- sbbq_Gq_Eq SANITY
            when 29 => NEXT_OUTS <= 593; -- sbbq_RAX_sId SANITY
            when 33 => NEXT_OUTS <= 494; -- andq_Eq_Gq SANITY
            when 35 => NEXT_OUTS <= 617; -- andq_Gq_Eq SANITY
            when 37 => NEXT_OUTS <= 28; -- andq_RAX_sId SANITY
            when 41 => NEXT_OUTS <= 615; -- subq_Eq_Gq SANITY
            when 43 => NEXT_OUTS <= 258; -- subq_Gq_Eq SANITY
            when 45 => NEXT_OUTS <= 122; -- subq_RAX_sId SANITY
            when 49 => NEXT_OUTS <= 26; -- xorq_Eq_Gq SANITY
            when 51 => NEXT_OUTS <= 363; -- xorq_Gq_Eq SANITY
            when 53 => NEXT_OUTS <= 587; -- xorq_RAX_sId SANITY
            when 57 => NEXT_OUTS <= 229; -- cmpq_Eq_Gq SANITY
            when 59 => NEXT_OUTS <= 449; -- cmpq_Gq_Eq SANITY
            when 61 => NEXT_OUTS <= 7; -- cmpq_RAX_sId SANITY
            when 99 => NEXT_OUTS <= 154; -- movslq_Gq_Ed SANITY
            when 105 => NEXT_OUTS <= 465; -- imulq_Gq_Eq_sId SANITY
            when 107 => NEXT_OUTS <= 344; -- imulq_Gq_Eq_sIb SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 83; -- addq_Eq_sId SANITY
                when 8 => NEXT_OUTS <= 208; -- orq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 97; -- adcq_Eq_sId SANITY
                when 24 => NEXT_OUTS <= 127; -- sbbq_Eq_sId SANITY
                when 32 => NEXT_OUTS <= 596; -- andq_Eq_sId SANITY
                when 40 => NEXT_OUTS <= 74; -- subq_Eq_sId SANITY
                when 48 => NEXT_OUTS <= 41; -- xorq_Eq_sId SANITY
                when 56 => NEXT_OUTS <= 44; -- cmpq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 273; -- addq_Eq_sIb SANITY
                when 8 => NEXT_OUTS <= 490; -- orq_Eq_sIb SANITY
                when 16 => NEXT_OUTS <= 401; -- adcq_Eq_sIb SANITY
                when 24 => NEXT_OUTS <= 580; -- sbbq_Eq_sIb SANITY
                when 32 => NEXT_OUTS <= 277; -- andq_Eq_sIb SANITY
                when 40 => NEXT_OUTS <= 521; -- subq_Eq_sIb SANITY
                when 48 => NEXT_OUTS <= 307; -- xorq_Eq_sIb SANITY
                when 56 => NEXT_OUTS <= 149; -- cmpq_Eq_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 109; -- testq_Eq_Gq SANITY
            when 137 => NEXT_OUTS <= 247; -- movq_Eq_Gq SANITY
            when 139 => NEXT_OUTS <= 365; -- movq_Gq_Eq SANITY
            when 141 => NEXT_OUTS <= 137; -- leaq_Gq_Mq SANITY
            when 152 => NEXT_OUTS <= 611; -- cdqe SANITY
            when 153 => NEXT_OUTS <= 204; -- cqo SANITY
            when 161 => NEXT_OUTS <= 284; -- movq_RAX_Oq SANITY
            when 163 => NEXT_OUTS <= 435; -- movq_Oq_RAX SANITY
            when 165 => NEXT_OUTS <= 186; -- movsq_Yq_Xq SANITY
            when 167 => NEXT_OUTS <= 482; -- cmpsq_Yq_Xq SANITY
            when 169 => NEXT_OUTS <= 181; -- testq_RAX_sId SANITY
            when 171 => NEXT_OUTS <= 390; -- stosq_Yq_RAX SANITY
            when 173 => NEXT_OUTS <= 139; -- lodsq_RAX_Xq SANITY
            when 175 => NEXT_OUTS <= 334; -- scasq_Yq_RAX SANITY
            when 184 => NEXT_OUTS <= 266; -- movq_RRX_Iq SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 66; -- rolq_Eq_Ib SANITY
                when 8 => NEXT_OUTS <= 166; -- rorq_Eq_Ib SANITY
                when 16 => NEXT_OUTS <= 98; -- rclq_Eq_Ib SANITY
                when 32 => NEXT_OUTS <= 672; -- shlq_Eq_Ib SANITY
                when 40 => NEXT_OUTS <= 231; -- shrq_Eq_Ib SANITY
                when 56 => NEXT_OUTS <= 79; -- sarq_Eq_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 108; -- movq_Eq_sId SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 527; -- iretq SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 51; -- rolq_Eq_I1 SANITY
                when 8 => NEXT_OUTS <= 597; -- rorq_Eq_I1 SANITY
                when 16 => NEXT_OUTS <= 387; -- rclq_Eq_I1 SANITY
                when 32 => NEXT_OUTS <= 418; -- shlq_Eq_I1 SANITY
                when 40 => NEXT_OUTS <= 394; -- shrq_Eq_I1 SANITY
                when 56 => NEXT_OUTS <= 306; -- sarq_Eq_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 254; -- rclq_Eq_CL SANITY
                when 32 => NEXT_OUTS <= 486; -- shlq_Eq_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 103; -- testq_Eq_sId SANITY
                when 16 => NEXT_OUTS <= 636; -- notq_Eq SANITY
                when 24 => NEXT_OUTS <= 47; -- negq_Eq SANITY
                when 32 => NEXT_OUTS <= 537; -- mulq_RAX_Eq SANITY
                when 40 => NEXT_OUTS <= 665; -- imulq_RAX_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 246; -- incq_Eq SANITY
                when 8 => NEXT_OUTS <= 622; -- decq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 80 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 42; -- pushl_ERX SANITY
            when 1 => NEXT_OUTS <= 159; -- pushq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 88 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 556; -- popl_ERX SANITY
            when 1 => NEXT_OUTS <= 303; -- popq_RRX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 97 => NEXT_OUTS <= 152; -- popal SANITY
        when 99 => NEXT_OUTS <= 279; -- arpl_Ew_Gw SANITY
        when 102 => 
        case OP2 is
            when 1 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 542; -- addw_Ew_Gw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 3 => NEXT_OUTS <= 423; -- addw_Gw_Ew SANITY
            when 5 => NEXT_OUTS <= 544; -- addw_AX_Iw SANITY
            when 6 => NEXT_OUTS <= 105; -- pushw_ES SANITY
            when 7 => NEXT_OUTS <= 405; -- popw_ES SANITY
            when 9 => NEXT_OUTS <= 676; -- orw_Ew_Gw SANITY
            when 11 => NEXT_OUTS <= 57; -- orw_Gw_Ew SANITY
            when 13 => NEXT_OUTS <= 64; -- orw_AX_Iw SANITY
            when 14 => NEXT_OUTS <= 80; -- pushw_CS SANITY
            when 15 => 
            case OP3 is
                when 2 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 379; -- larw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 3 => 
                case OP4 is
                    when 0 => NEXT_OUTS <= 132; -- lslw_Gw_Ew SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 110 => NEXT_OUTS <= 173; -- movd_Vdq_Ed SANITY
                when 128 => NEXT_OUTS <= 400; -- jo_Jw SANITY
                when 129 => NEXT_OUTS <= 54; -- jno_Jw SANITY
                when 130 => NEXT_OUTS <= 161; -- jb_Jw SANITY
                when 131 => NEXT_OUTS <= 673; -- jnb_Jw SANITY
                when 132 => NEXT_OUTS <= 30; -- jz_Jw SANITY
                when 133 => NEXT_OUTS <= 236; -- jnz_Jw SANITY
                when 134 => NEXT_OUTS <= 630; -- jbe_Jw SANITY
                when 135 => NEXT_OUTS <= 397; -- jnbe_Jw SANITY
                when 136 => NEXT_OUTS <= 269; -- js_Jw SANITY
                when 137 => NEXT_OUTS <= 85; -- jns_Jw SANITY
                when 138 => NEXT_OUTS <= 297; -- jp_Jw SANITY
                when 139 => NEXT_OUTS <= 278; -- jnp_Jw SANITY
                when 140 => NEXT_OUTS <= 662; -- jl_Jw SANITY
                when 141 => NEXT_OUTS <= 308; -- jnl_Jw SANITY
                when 142 => NEXT_OUTS <= 90; -- jle_Jw SANITY
                when 143 => NEXT_OUTS <= 631; -- jnle_Jw SANITY
                when 160 => NEXT_OUTS <= 283; -- pushw_FS SANITY
                when 161 => NEXT_OUTS <= 143; -- popw_FS SANITY
                when 164 => NEXT_OUTS <= 389; -- shldw_Ew_Gw_Ib SANITY
                when 165 => NEXT_OUTS <= 323; -- shldw_Ew_Gw_CL SANITY
                when 168 => NEXT_OUTS <= 271; -- pushw_GS SANITY
                when 169 => NEXT_OUTS <= 629; -- popw_GS SANITY
                when 172 => NEXT_OUTS <= 111; -- shrdw_Ew_Gw_Ib SANITY
                when 175 => NEXT_OUTS <= 141; -- imulw_Gw_Ew SANITY
                when 178 => NEXT_OUTS <= 315; -- lssw_Gw_Mp SANITY
                when 180 => NEXT_OUTS <= 324; -- lfsw_Gw_Mp SANITY
                when 181 => NEXT_OUTS <= 84; -- lgsw_Gw_Mp SANITY
                when 182 => NEXT_OUTS <= 534; -- movzbw_Gw_Eb SANITY
                when 186 => 
                case OP4 is
                    when 32 => NEXT_OUTS <= 508; -- btw_Ew_Ib SANITY
                    when 40 => NEXT_OUTS <= 175; -- btsw_Ew_Ib SANITY
                    when 48 => NEXT_OUTS <= 197; -- btrw_Ew_Ib SANITY
                    when 56 => NEXT_OUTS <= 206; -- btcw_Ew_Ib SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when 190 => NEXT_OUTS <= 46; -- movsbw_Gw_Eb SANITY
                when 199 => 
                case OP4 is
                    when 48 => NEXT_OUTS <= 523; -- vmclear_Mq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 17 => NEXT_OUTS <= 302; -- adcw_Ew_Gw SANITY
            when 19 => NEXT_OUTS <= 535; -- adcw_Gw_Ew SANITY
            when 21 => NEXT_OUTS <= 4; -- adcw_AX_Iw SANITY
            when 22 => NEXT_OUTS <= 257; -- pushw_SS SANITY
            when 23 => NEXT_OUTS <= 131; -- popw_SS SANITY
            when 25 => NEXT_OUTS <= 671; -- sbbw_Ew_Gw SANITY
            when 27 => NEXT_OUTS <= 294; -- sbbw_Gw_Ew SANITY
            when 29 => NEXT_OUTS <= 543; -- sbbw_AX_Iw SANITY
            when 30 => NEXT_OUTS <= 498; -- pushw_DS SANITY
            when 31 => NEXT_OUTS <= 408; -- popw_DS SANITY
            when 33 => NEXT_OUTS <= 82; -- andw_Ew_Gw SANITY
            when 35 => NEXT_OUTS <= 454; -- andw_Gw_Ew SANITY
            when 37 => NEXT_OUTS <= 92; -- andw_AX_Iw SANITY
            when 41 => NEXT_OUTS <= 504; -- subw_Ew_Gw SANITY
            when 43 => NEXT_OUTS <= 447; -- subw_Gw_Ew SANITY
            when 45 => NEXT_OUTS <= 437; -- subw_AX_Iw SANITY
            when 49 => NEXT_OUTS <= 299; -- xorw_Ew_Gw SANITY
            when 51 => NEXT_OUTS <= 328; -- xorw_Gw_Ew SANITY
            when 53 => NEXT_OUTS <= 481; -- xorw_AX_Iw SANITY
            when 57 => NEXT_OUTS <= 656; -- cmpw_Ew_Gw SANITY
            when 59 => NEXT_OUTS <= 559; -- cmpw_Gw_Ew SANITY
            when 61 => NEXT_OUTS <= 634; -- cmpw_AX_Iw SANITY
            when 64 => NEXT_OUTS <= 594; -- incw_RX SANITY
            when 72 => 
            case OP3 is
                when 15 => 
                case OP4 is
                    when 110 => NEXT_OUTS <= 633; -- movq_Vdq_Eq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 80 => NEXT_OUTS <= 305; -- pushw_RX SANITY
            when 88 => NEXT_OUTS <= 21; -- popw_RX SANITY
            when 104 => NEXT_OUTS <= 194; -- pushw_Iw SANITY
            when 105 => NEXT_OUTS <= 355; -- imulw_Gw_Ew_Iw SANITY
            when 106 => NEXT_OUTS <= 557; -- pushw_sIb SANITY
            when 107 => NEXT_OUTS <= 407; -- imulw_Gw_Ew_sIb SANITY
            when 109 => NEXT_OUTS <= 411; -- insw_Yw_DX SANITY
            when 111 => NEXT_OUTS <= 341; -- outsw_DX_Xw SANITY
            when 129 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 601; -- addw_Ew_Iw SANITY
                when 8 => NEXT_OUTS <= 347; -- orw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 340; -- adcw_Ew_Iw SANITY
                when 24 => NEXT_OUTS <= 660; -- sbbw_Ew_Iw SANITY
                when 32 => NEXT_OUTS <= 623; -- andw_Ew_Iw SANITY
                when 40 => NEXT_OUTS <= 213; -- subw_Ew_Iw SANITY
                when 48 => NEXT_OUTS <= 34; -- xorw_Ew_Iw SANITY
                when 56 => NEXT_OUTS <= 529; -- cmpw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 131 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 517; -- addw_Ew_sIb SANITY
                when 8 => NEXT_OUTS <= 342; -- orw_Ew_sIb SANITY
                when 16 => NEXT_OUTS <= 398; -- adcw_Ew_sIb SANITY
                when 24 => NEXT_OUTS <= 439; -- sbbw_Ew_sIb SANITY
                when 32 => NEXT_OUTS <= 321; -- andw_Ew_sIb SANITY
                when 40 => NEXT_OUTS <= 469; -- subw_Ew_sIb SANITY
                when 48 => NEXT_OUTS <= 69; -- xorw_Ew_sIb SANITY
                when 56 => NEXT_OUTS <= 32; -- cmpw_Ew_sIb SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 133 => NEXT_OUTS <= 362; -- testw_Ew_Gw SANITY
            when 137 => NEXT_OUTS <= 245; -- movw_Ew_Gw SANITY
            when 139 => NEXT_OUTS <= 639; -- movw_Gw_Ew SANITY
            when 141 => NEXT_OUTS <= 140; -- leaw_Gw_Mw SANITY
            when 143 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 492; -- popw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 152 => NEXT_OUTS <= 272; -- cbw SANITY
            when 153 => NEXT_OUTS <= 584; -- cwd SANITY
            when 154 => NEXT_OUTS <= 626; -- lcall_Apw SANITY
            when 156 => NEXT_OUTS <= 327; -- pushfw SANITY
            when 161 => NEXT_OUTS <= 412; -- movw_AX_Ow SANITY
            when 163 => NEXT_OUTS <= 420; -- movw_Ow_AX SANITY
            when 165 => NEXT_OUTS <= 489; -- movsw_Yw_Xw SANITY
            when 167 => NEXT_OUTS <= 354; -- cmpsw_Yw_Xw SANITY
            when 169 => NEXT_OUTS <= 502; -- testw_AX_Iw SANITY
            when 171 => NEXT_OUTS <= 301; -- stosw_Yw_AX SANITY
            when 173 => NEXT_OUTS <= 464; -- lodsw_AX_Xw SANITY
            when 175 => NEXT_OUTS <= 554; -- scasw_Yw_AX SANITY
            when 184 => NEXT_OUTS <= 402; -- movw_RX_Iw SANITY
            when 193 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 117; -- rolw_Ew_Ib SANITY
                when 8 => NEXT_OUTS <= 361; -- rorw_Ew_Ib SANITY
                when 16 => NEXT_OUTS <= 151; -- rclw_Ew_Ib SANITY
                when 32 => NEXT_OUTS <= 620; -- shlw_Ew_Ib SANITY
                when 40 => NEXT_OUTS <= 614; -- shrw_Ew_Ib SANITY
                when 56 => NEXT_OUTS <= 228; -- sarw_Ew_Ib SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 196 => NEXT_OUTS <= 576; -- lesw_Gw_Mp SANITY
            when 199 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 424; -- movw_Ew_Iw SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 207 => NEXT_OUTS <= 313; -- iretw SANITY
            when 209 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 233; -- rolw_Ew_I1 SANITY
                when 8 => NEXT_OUTS <= 222; -- rorw_Ew_I1 SANITY
                when 16 => NEXT_OUTS <= 259; -- rclw_Ew_I1 SANITY
                when 32 => NEXT_OUTS <= 71; -- shlw_Ew_I1 SANITY
                when 40 => NEXT_OUTS <= 330; -- shrw_Ew_I1 SANITY
                when 56 => NEXT_OUTS <= 641; -- sarw_Ew_I1 SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 211 => 
            case OP3 is
                when 16 => NEXT_OUTS <= 320; -- rclw_Ew_CL SANITY
                when 32 => NEXT_OUTS <= 99; -- shlw_Ew_CL SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 229 => NEXT_OUTS <= 666; -- inw_AX_Ib SANITY
            when 231 => NEXT_OUTS <= 375; -- outw_Ib_AX SANITY
            when 232 => NEXT_OUTS <= 546; -- call_Jw SANITY
            when 233 => NEXT_OUTS <= 572; -- jmp_Jw SANITY
            when 234 => NEXT_OUTS <= 263; -- ljmp_Apw SANITY
            when 237 => NEXT_OUTS <= 309; -- inw_AX_DX SANITY
            when 239 => NEXT_OUTS <= 403; -- outw_DX_AX SANITY
            when 247 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 210; -- testw_Ew_Iw SANITY
                when 16 => NEXT_OUTS <= 443; -- notw_Ew SANITY
                when 24 => NEXT_OUTS <= 300; -- negw_Ew SANITY
                when 32 => NEXT_OUTS <= 10; -- mulw_AX_Ew SANITY
                when 40 => NEXT_OUTS <= 19; -- imulw_AX_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 255 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 256; -- incw_Ew SANITY
                when 8 => NEXT_OUTS <= 377; -- decw_Ew SANITY
                when 16 => NEXT_OUTS <= 500; -- call_Ew SANITY
                when 32 => NEXT_OUTS <= 451; -- jmp_Ew SANITY
                when 48 => NEXT_OUTS <= 582; -- pushw_Ew SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 103 => 
        case OP2 is
            when 227 => NEXT_OUTS <= 575; -- jcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 104 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 318; -- pushl_Id SANITY
            when 1 => NEXT_OUTS <= 661; -- pushq_sId SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 105 => NEXT_OUTS <= 404; -- imull_Gd_Ed_Id SANITY
        when 106 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 604; -- pushl_sIb SANITY
            when 1 => NEXT_OUTS <= 37; -- pushq_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 107 => NEXT_OUTS <= 164; -- imull_Gd_Ed_sIb SANITY
        when 108 => NEXT_OUTS <= 50; -- insb_Yb_DX SANITY
        when 109 => NEXT_OUTS <= 470; -- insl_Yd_DX SANITY
        when 110 => NEXT_OUTS <= 463; -- outsb_DX_Xb SANITY
        when 111 => NEXT_OUTS <= 178; -- outsl_DX_Xd SANITY
        when 112 => NEXT_OUTS <= 462; -- jo_Jb SANITY
        when 113 => NEXT_OUTS <= 569; -- jno_Jb SANITY
        when 114 => NEXT_OUTS <= 434; -- jb_Jb SANITY
        when 115 => NEXT_OUTS <= 659; -- jnb_Jb SANITY
        when 116 => NEXT_OUTS <= 29; -- jz_Jb SANITY
        when 117 => NEXT_OUTS <= 530; -- jnz_Jb SANITY
        when 118 => NEXT_OUTS <= 338; -- jbe_Jb SANITY
        when 119 => NEXT_OUTS <= 667; -- jnbe_Jb SANITY
        when 120 => NEXT_OUTS <= 501; -- js_Jb SANITY
        when 121 => NEXT_OUTS <= 180; -- jns_Jb SANITY
        when 122 => NEXT_OUTS <= 167; -- jp_Jb SANITY
        when 123 => NEXT_OUTS <= 282; -- jnp_Jb SANITY
        when 124 => NEXT_OUTS <= 120; -- jl_Jb SANITY
        when 125 => NEXT_OUTS <= 133; -- jnl_Jb SANITY
        when 126 => NEXT_OUTS <= 202; -- jle_Jb SANITY
        when 127 => NEXT_OUTS <= 190; -- jnle_Jb SANITY
        when 128 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 605; -- addb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 654; -- orb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 94; -- adcb_Eb_Ib SANITY
            when 24 => NEXT_OUTS <= 578; -- sbbb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 541; -- andb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 298; -- subb_Eb_Ib SANITY
            when 48 => NEXT_OUTS <= 264; -- xorb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 95; -- cmpb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 129 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 20; -- addl_Ed_Id SANITY
            when 8 => NEXT_OUTS <= 8; -- orl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 514; -- adcl_Ed_Id SANITY
            when 24 => NEXT_OUTS <= 599; -- sbbl_Ed_Id SANITY
            when 32 => NEXT_OUTS <= 478; -- andl_Ed_Id SANITY
            when 40 => NEXT_OUTS <= 350; -- subl_Ed_Id SANITY
            when 48 => NEXT_OUTS <= 495; -- xorl_Ed_Id SANITY
            when 56 => NEXT_OUTS <= 348; -- cmpl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 131 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 372; -- addl_Ed_sIb SANITY
            when 8 => NEXT_OUTS <= 638; -- orl_Ed_sIb SANITY
            when 16 => NEXT_OUTS <= 579; -- adcl_Ed_sIb SANITY
            when 24 => NEXT_OUTS <= 602; -- sbbl_Ed_sIb SANITY
            when 32 => NEXT_OUTS <= 528; -- andl_Ed_sIb SANITY
            when 40 => NEXT_OUTS <= 77; -- subl_Ed_sIb SANITY
            when 48 => NEXT_OUTS <= 679; -- xorl_Ed_sIb SANITY
            when 56 => NEXT_OUTS <= 147; -- cmpl_Ed_sIb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 132 => NEXT_OUTS <= 17; -- testb_Eb_Gb SANITY
        when 133 => NEXT_OUTS <= 310; -- testl_Ed_Gd SANITY
        when 136 => NEXT_OUTS <= 207; -- movb_Eb_Gb SANITY
        when 137 => NEXT_OUTS <= 583; -- movl_Ed_Gd SANITY
        when 138 => NEXT_OUTS <= 396; -- movb_Gb_Eb SANITY
        when 139 => NEXT_OUTS <= 415; -- movl_Gd_Ed SANITY
        when 140 => NEXT_OUTS <= 374; -- movw_Ew_Sw SANITY
        when 141 => NEXT_OUTS <= 425; -- leal_Gd_Md SANITY
        when 142 => NEXT_OUTS <= 237; -- movw_Sw_Ew SANITY
        when 143 => 
        case OP2 is
            when 0 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 538; -- popl_Ed SANITY
                when 1 => NEXT_OUTS <= 612; -- popq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 144 => NEXT_OUTS <= 224; -- nop SANITY
        when 152 => NEXT_OUTS <= 421; -- cwde SANITY
        when 153 => NEXT_OUTS <= 480; -- cdq SANITY
        when 154 => NEXT_OUTS <= 510; -- lcall_Apd SANITY
        when 155 => NEXT_OUTS <= 275; -- fwait SANITY
        when 156 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 138; -- pushfl SANITY
            when 1 => NEXT_OUTS <= 38; -- pushfq SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 158 => NEXT_OUTS <= 360; -- sahf SANITY
        when 159 => NEXT_OUTS <= 606; -- lahf SANITY
        when 160 => NEXT_OUTS <= 267; -- movb_AL_Ob SANITY
        when 161 => NEXT_OUTS <= 157; -- movl_EAX_Od SANITY
        when 162 => NEXT_OUTS <= 235; -- movb_Ob_AL SANITY
        when 163 => NEXT_OUTS <= 91; -- movl_Od_EAX SANITY
        when 164 => NEXT_OUTS <= 312; -- movsb_Yb_Xb SANITY
        when 165 => NEXT_OUTS <= 35; -- movsl_Yd_Xd SANITY
        when 166 => NEXT_OUTS <= 681; -- cmpsb_Yb_Xb SANITY
        when 167 => NEXT_OUTS <= 76; -- cmpsl_Yd_Xd SANITY
        when 168 => NEXT_OUTS <= 610; -- testb_AL_Ib SANITY
        when 169 => NEXT_OUTS <= 440; -- testl_EAX_Id SANITY
        when 170 => NEXT_OUTS <= 577; -- stosb_Yb_AL SANITY
        when 171 => NEXT_OUTS <= 288; -- stosl_Yd_EAX SANITY
        when 172 => NEXT_OUTS <= 226; -- lodsb_AL_Xb SANITY
        when 173 => NEXT_OUTS <= 589; -- lodsl_EAX_Xd SANITY
        when 174 => NEXT_OUTS <= 562; -- scasb_Yb_AL SANITY
        when 175 => NEXT_OUTS <= 169; -- scasl_Yd_EAX SANITY
        when 176 => NEXT_OUTS <= 558; -- movb_R8_Ib SANITY
        when 184 => NEXT_OUTS <= 214; -- movl_ERX_Id SANITY
        when 192 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 427; -- rolb_Eb_Ib SANITY
            when 8 => NEXT_OUTS <= 58; -- rorb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 518; -- rclb_Eb_Ib SANITY
            when 32 => NEXT_OUTS <= 262; -- shlb_Eb_Ib SANITY
            when 40 => NEXT_OUTS <= 165; -- shrb_Eb_Ib SANITY
            when 56 => NEXT_OUTS <= 364; -- sarb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 193 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 600; -- roll_Ed_Ib SANITY
            when 8 => NEXT_OUTS <= 112; -- rorl_Ed_Ib SANITY
            when 16 => NEXT_OUTS <= 217; -- rcll_Ed_Ib SANITY
            when 32 => NEXT_OUTS <= 243; -- shll_Ed_Ib SANITY
            when 40 => NEXT_OUTS <= 591; -- shrl_Ed_Ib SANITY
            when 56 => NEXT_OUTS <= 603; -- sarl_Ed_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 194 => NEXT_OUTS <= 493; -- ret_Iw SANITY
        when 195 => NEXT_OUTS <= 520; -- ret SANITY
        when 196 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 100; -- lesl_Gd_Mp SANITY
            when 225 => 
            case OP3 is
                when 249 => 
                case OP4 is
                    when 110 => NEXT_OUTS <= 345; -- vmovq_Vdq_Eq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 226 => 
            case OP3 is
                when 121 => 
                case OP4 is
                    when 19 => NEXT_OUTS <= 170; -- vcvtph2ps_Vps_Wq SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 227 => 
            case OP3 is
                when 121 => 
                case OP4 is
                    when 29 => NEXT_OUTS <= 635; -- vcvtps2ph_Wq_Vps_Ib SANITY
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
                when 110 => NEXT_OUTS <= 73; -- vmovd_Vdq_Ed SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 198 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 472; -- movb_Eb_Ib SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 199 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 539; -- movl_Ed_Id SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 201 => NEXT_OUTS <= 86; -- leave SANITY
        when 202 => NEXT_OUTS <= 563; -- lret_Iw SANITY
        when 203 => NEXT_OUTS <= 239; -- lret SANITY
        when 204 => NEXT_OUTS <= 349; -- int3 SANITY
        when 205 => NEXT_OUTS <= 162; -- int_Ib SANITY
        when 206 => NEXT_OUTS <= 87; -- into SANITY
        when 207 => NEXT_OUTS <= 191; -- iretl SANITY
        when 208 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 419; -- rolb_Eb_I1 SANITY
            when 8 => NEXT_OUTS <= 234; -- rorb_Eb_I1 SANITY
            when 16 => NEXT_OUTS <= 70; -- rclb_Eb_I1 SANITY
            when 32 => NEXT_OUTS <= 547; -- shlb_Eb_I1 SANITY
            when 40 => NEXT_OUTS <= 438; -- shrb_Eb_I1 SANITY
            when 56 => NEXT_OUTS <= 187; -- sarb_Eb_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 209 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 6; -- roll_Ed_I1 SANITY
            when 8 => NEXT_OUTS <= 332; -- rorl_Ed_I1 SANITY
            when 16 => NEXT_OUTS <= 608; -- rcll_Ed_I1 SANITY
            when 32 => NEXT_OUTS <= 651; -- shll_Ed_I1 SANITY
            when 40 => NEXT_OUTS <= 658; -- shrl_Ed_I1 SANITY
            when 56 => NEXT_OUTS <= 499; -- sarl_Ed_I1 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 210 => 
        case OP2 is
            when 16 => NEXT_OUTS <= 479; -- rclb_Eb_CL SANITY
            when 32 => NEXT_OUTS <= 198; -- shlb_Eb_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 211 => 
        case OP2 is
            when 16 => NEXT_OUTS <= 352; -- rcll_Ed_CL SANITY
            when 32 => NEXT_OUTS <= 68; -- shll_Ed_CL SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 213 => NEXT_OUTS <= 640; -- aad SANITY
        when 214 => NEXT_OUTS <= 675; -- salc SANITY
        when 215 => NEXT_OUTS <= 134; -- xlat SANITY
        when 216 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 399; -- fadds_Md SANITY
            when 8 => NEXT_OUTS <= 384; -- fmuls_Md SANITY
            when 16 => NEXT_OUTS <= 632; -- fcoms_Md SANITY
            when 24 => NEXT_OUTS <= 549; -- fcomps_Md SANITY
            when 32 => NEXT_OUTS <= 366; -- fsubs_Md SANITY
            when 40 => NEXT_OUTS <= 326; -- fsubrs_Md SANITY
            when 48 => NEXT_OUTS <= 174; -- fdivs_Md SANITY
            when 56 => NEXT_OUTS <= 189; -- fdivrs_Md SANITY
            when 192 => NEXT_OUTS <= 532; -- fadd_ST0_STi SANITY
            when 200 => NEXT_OUTS <= 219; -- fmul_ST0_STi SANITY
            when 208 => NEXT_OUTS <= 455; -- fcom_STi SANITY
            when 216 => NEXT_OUTS <= 101; -- fcomp_STi SANITY
            when 224 => NEXT_OUTS <= 378; -- fsub_ST0_STi SANITY
            when 232 => NEXT_OUTS <= 72; -- fsubr_ST0_STi SANITY
            when 240 => NEXT_OUTS <= 56; -- fdiv_ST0_STi SANITY
            when 248 => NEXT_OUTS <= 497; -- fdivr_ST0_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 217 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 460; -- flds_Md SANITY
            when 32 => NEXT_OUTS <= 336; -- fldenv SANITY
            when 40 => NEXT_OUTS <= 27; -- fldcw SANITY
            when 48 => NEXT_OUTS <= 509; -- fnstenv SANITY
            when 56 => NEXT_OUTS <= 555; -- fnstcw SANITY
            when 192 => NEXT_OUTS <= 89; -- fld_STi SANITY
            when 200 => NEXT_OUTS <= 11; -- fxch SANITY
            when 208 => NEXT_OUTS <= 511; -- fnop SANITY
            when 224 => NEXT_OUTS <= 513; -- fchs SANITY
            when 225 => NEXT_OUTS <= 203; -- fabs SANITY
            when 228 => NEXT_OUTS <= 158; -- ftst SANITY
            when 229 => NEXT_OUTS <= 595; -- fxam SANITY
            when 232 => NEXT_OUTS <= 680; -- fld1 SANITY
            when 233 => NEXT_OUTS <= 13; -- fldl2t SANITY
            when 234 => NEXT_OUTS <= 339; -- fldl2e SANITY
            when 235 => NEXT_OUTS <= 136; -- fldpi SANITY
            when 236 => NEXT_OUTS <= 588; -- fldlg2 SANITY
            when 237 => NEXT_OUTS <= 144; -- fldln2 SANITY
            when 238 => NEXT_OUTS <= 295; -- fldz SANITY
            when 246 => NEXT_OUTS <= 23; -- fdecstp SANITY
            when 247 => NEXT_OUTS <= 653; -- fincstp SANITY
            when 250 => NEXT_OUTS <= 373; -- fsqrt SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 218 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 456; -- fiaddl_Md SANITY
            when 8 => NEXT_OUTS <= 468; -- fimull_Md SANITY
            when 16 => NEXT_OUTS <= 351; -- ficoml_Md SANITY
            when 24 => NEXT_OUTS <= 553; -- ficompl_Md SANITY
            when 32 => NEXT_OUTS <= 367; -- fisubl_Md SANITY
            when 40 => NEXT_OUTS <= 314; -- fisubrl_Md SANITY
            when 48 => NEXT_OUTS <= 145; -- fidivl_Md SANITY
            when 56 => NEXT_OUTS <= 560; -- fidivrl_Md SANITY
            when 233 => NEXT_OUTS <= 380; -- fucompp SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 219 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 503; -- fildl_Md SANITY
            when 16 => NEXT_OUTS <= 322; -- fistl_Md SANITY
            when 24 => NEXT_OUTS <= 567; -- fistpl_Md SANITY
            when 40 => NEXT_OUTS <= 113; -- fldt_Mt SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 220 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 201; -- faddl_Mq SANITY
            when 8 => NEXT_OUTS <= 285; -- fmull_Mq SANITY
            when 16 => NEXT_OUTS <= 618; -- fcoml_Mq SANITY
            when 24 => NEXT_OUTS <= 649; -- fcompl_Mq SANITY
            when 32 => NEXT_OUTS <= 573; -- fsubl_Mq SANITY
            when 40 => NEXT_OUTS <= 193; -- fsubrl_Mq SANITY
            when 48 => NEXT_OUTS <= 115; -- fdivl_Mq SANITY
            when 56 => NEXT_OUTS <= 153; -- fdivrl_Mq SANITY
            when 192 => NEXT_OUTS <= 627; -- fadd_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 241; -- fmul_STi_ST0 SANITY
            when 224 => NEXT_OUTS <= 118; -- fsubr_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 40; -- fsub_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 215; -- fdivr_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 446; -- fdiv_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 221 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 357; -- fldl_Mq SANITY
            when 16 => NEXT_OUTS <= 255; -- fstl_Mq SANITY
            when 56 => NEXT_OUTS <= 179; -- fnstsw SANITY
            when 192 => NEXT_OUTS <= 182; -- ffree_STi SANITY
            when 208 => NEXT_OUTS <= 416; -- fst_STi SANITY
            when 216 => NEXT_OUTS <= 75; -- fstp_STi SANITY
            when 224 => NEXT_OUTS <= 598; -- fucom_STi SANITY
            when 232 => NEXT_OUTS <= 353; -- fucomp_STi SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 222 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 62; -- fiadds_Mw SANITY
            when 8 => NEXT_OUTS <= 25; -- fimuls_Mw SANITY
            when 16 => NEXT_OUTS <= 459; -- ficoms_Mw SANITY
            when 24 => NEXT_OUTS <= 106; -- ficomps_Mw SANITY
            when 32 => NEXT_OUTS <= 655; -- fisubs_Mw SANITY
            when 40 => NEXT_OUTS <= 533; -- fisubrs_Mw SANITY
            when 48 => NEXT_OUTS <= 287; -- fidivs_Mw SANITY
            when 56 => NEXT_OUTS <= 452; -- fidivrs_Mw SANITY
            when 192 => NEXT_OUTS <= 356; -- faddp_STi_ST0 SANITY
            when 200 => NEXT_OUTS <= 192; -- fmulp_STi_ST0 SANITY
            when 217 => NEXT_OUTS <= 441; -- fcompp SANITY
            when 224 => NEXT_OUTS <= 581; -- fsubrp_STi_ST0 SANITY
            when 232 => NEXT_OUTS <= 60; -- fsubp_STi_ST0 SANITY
            when 240 => NEXT_OUTS <= 211; -- fdivrp_STi_ST0 SANITY
            when 248 => NEXT_OUTS <= 148; -- fdivp_STi_ST0 SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 223 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 406; -- filds_Mw SANITY
            when 16 => NEXT_OUTS <= 270; -- fists_Mw SANITY
            when 24 => NEXT_OUTS <= 104; -- fistps_Mw SANITY
            when 40 => NEXT_OUTS <= 317; -- fildq_Mq SANITY
            when 56 => NEXT_OUTS <= 536; -- fistpq_Mq SANITY
            when 224 => NEXT_OUTS <= 225; -- fnstsw_AX SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 227 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 466; -- jecxz_Jb SANITY
            when 1 => NEXT_OUTS <= 45; -- jrcxz_Jb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 228 => NEXT_OUTS <= 123; -- inb_AL_Ib SANITY
        when 229 => NEXT_OUTS <= 184; -- inl_EAX_Ib SANITY
        when 230 => NEXT_OUTS <= 55; -- outb_Ib_AL SANITY
        when 231 => NEXT_OUTS <= 325; -- outl_Ib_EAX SANITY
        when 232 => NEXT_OUTS <= 61; -- call_Jd SANITY
        when 233 => NEXT_OUTS <= 550; -- jmp_Jd SANITY
        when 234 => NEXT_OUTS <= 163; -- ljmp_Apd SANITY
        when 235 => NEXT_OUTS <= 218; -- jmp_Jb SANITY
        when 236 => NEXT_OUTS <= 343; -- inb_AL_DX SANITY
        when 237 => NEXT_OUTS <= 12; -- inl_EAX_DX SANITY
        when 238 => NEXT_OUTS <= 436; -- outb_DX_AL SANITY
        when 239 => NEXT_OUTS <= 570; -- outl_DX_EAX SANITY
        when 241 => NEXT_OUTS <= 590; -- int1 SANITY
        when 243 => 
        case OP2 is
            when 15 => 
            case OP3 is
                when 174 => 
                case OP4 is
                    when 192 => NEXT_OUTS <= 607; -- rdfsbase_Ry SANITY
                    when 200 => NEXT_OUTS <= 265; -- rdgsbase_Ry SANITY
                    when 208 => NEXT_OUTS <= 196; -- wrfsbase_Ry SANITY
                    when 216 => NEXT_OUTS <= 409; -- wrgsbase_Ry SANITY
                    when others => NEXT_OUTS <= 0; -- invalid
                end case;
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 244 => NEXT_OUTS <= 565; -- hlt SANITY
        when 245 => NEXT_OUTS <= 476; -- cmc SANITY
        when 246 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 369; -- testb_Eb_Ib SANITY
            when 16 => NEXT_OUTS <= 96; -- notb_Eb SANITY
            when 24 => NEXT_OUTS <= 248; -- negb_Eb SANITY
            when 32 => NEXT_OUTS <= 548; -- mulb_AL_Eb SANITY
            when 40 => NEXT_OUTS <= 2; -- imulb_AL_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 247 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 221; -- testl_Ed_Id SANITY
            when 16 => NEXT_OUTS <= 522; -- notl_Ed SANITY
            when 24 => NEXT_OUTS <= 644; -- negl_Ed SANITY
            when 32 => NEXT_OUTS <= 346; -- mull_EAX_Ed SANITY
            when 40 => NEXT_OUTS <= 49; -- imull_EAX_Ed SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 248 => NEXT_OUTS <= 3; -- clc SANITY
        when 249 => NEXT_OUTS <= 43; -- stc SANITY
        when 250 => NEXT_OUTS <= 126; -- cli SANITY
        when 251 => NEXT_OUTS <= 188; -- sti SANITY
        when 252 => NEXT_OUTS <= 657; -- cld SANITY
        when 253 => NEXT_OUTS <= 155; -- std SANITY
        when 254 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 645; -- incb_Eb SANITY
            when 8 => NEXT_OUTS <= 628; -- decb_Eb SANITY
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when 255 => 
        case OP2 is
            when 0 => NEXT_OUTS <= 249; -- incl_Ed SANITY
            when 8 => NEXT_OUTS <= 505; -- decl_Ed SANITY
            when 16 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 613; -- call_Ed SANITY
                when 1 => NEXT_OUTS <= 102; -- call_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 24 => NEXT_OUTS <= 24; -- lcall_Mp SANITY
            when 32 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 276; -- jmp_Ed SANITY
                when 1 => NEXT_OUTS <= 496; -- jmp_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when 40 => NEXT_OUTS <= 53; -- ljmp_Mp SANITY
            when 48 => 
            case OP3 is
                when 0 => NEXT_OUTS <= 88; -- pushl_Ed SANITY
                when 1 => NEXT_OUTS <= 643; -- pushq_Eq SANITY
                when others => NEXT_OUTS <= 0; -- invalid
            end case;
            when others => NEXT_OUTS <= 0; -- invalid
        end case;
        when others => NEXT_OUTS <= 0; -- invalid
    end case;

  end process;
end behv;
