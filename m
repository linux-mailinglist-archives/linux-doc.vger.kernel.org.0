Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A20EC42D
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2019 15:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfKAOE7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Nov 2019 10:04:59 -0400
Received: from mga18.intel.com ([134.134.136.126]:57541 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbfKAOE7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Nov 2019 10:04:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Nov 2019 07:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,255,1569308400"; 
   d="scan'208";a="194668434"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.197]) ([10.237.72.197])
  by orsmga008.jf.intel.com with ESMTP; 01 Nov 2019 07:04:37 -0700
Subject: Re: [PATCH v7 27/27] x86/cet/shstk: Add Shadow Stack instructions to
 opcode map
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
References: <20190606200646.3951-1-yu-cheng.yu@intel.com>
 <20190606200646.3951-28-yu-cheng.yu@intel.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <93e915b9-975d-9876-8f89-8b6f2bc4586e@intel.com>
Date:   Fri, 1 Nov 2019 16:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190606200646.3951-28-yu-cheng.yu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/06/19 11:06 PM, Yu-cheng Yu wrote:
> Add the following shadow stack management instructions.
> 
> INCSSP:
>     Increment shadow stack pointer by the steps specified.
> 
> RDSSP:
>     Read SSP register into a GPR.
> 
> SAVEPREVSSP:
>     Use "prev ssp" token at top of current shadow stack to
>     create a "restore token" on previous shadow stack.
> 
> RSTORSSP:
>     Restore from a "restore token" pointed by a GPR to SSP.
> 
> WRSS:
>     Write to kernel-mode shadow stack (kernel-mode instruction).
> 
> WRUSS:
>     Write to user-mode shadow stack (kernel-mode instruction).
> 
> SETSSBSY:
>     Verify the "supervisor token" pointed by IA32_PL0_SSP MSR,
>     if valid, set the token to busy, and set SSP to the value
>     of IA32_PL0_SSP MSR.
> 
> CLRSSBSY:
>     Verify the "supervisor token" pointed by a GPR, if valid,
>     clear the busy bit from the token.

Does the notrack prefix also need to be catered for somehow?

> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/lib/x86-opcode-map.txt               | 26 +++++++++++++------
>  tools/objtool/arch/x86/lib/x86-opcode-map.txt | 26 +++++++++++++------
>  2 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
> index e0b85930dd77..c5e825d44766 100644
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -366,7 +366,7 @@ AVXcode: 1
>  1b: BNDCN Gv,Ev (F2) | BNDMOV Ev,Gv (66) | BNDMK Gv,Ev (F3) | BNDSTX Ev,Gv
>  1c:
>  1d:
> -1e:
> +1e: RDSSP Rd (F3),REX.W
>  1f: NOP Ev
>  # 0x0f 0x20-0x2f
>  20: MOV Rd,Cd
> @@ -610,7 +610,17 @@ fe: paddd Pq,Qq | vpaddd Vx,Hx,Wx (66),(v1)
>  ff: UD0
>  EndTable
>  
> -Table: 3-byte opcode 1 (0x0f 0x38)
> +Table: 3-byte opcode 1 (0x0f 0x01)
> +Referrer:
> +AVXcode:
> +# Skip 0x00-0xe7
> +e8: SETSSBSY (f3)
> +e9:
> +ea: SAVEPREVSSP (f3)
> +# Skip 0xeb-0xff
> +EndTable
> +
> +Table: 3-byte opcode 2 (0x0f 0x38)
>  Referrer: 3-byte escape 1
>  AVXcode: 2
>  # 0x0f 0x38 0x00-0x0f
> @@ -789,12 +799,12 @@ f0: MOVBE Gy,My | MOVBE Gw,Mw (66) | CRC32 Gd,Eb (F2) | CRC32 Gd,Eb (66&F2)
>  f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
>  f2: ANDN Gy,By,Ey (v)
>  f3: Grp17 (1A)
> -f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v)
> -f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v)
> +f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSS Pq,Qq (66),REX.W
> +f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSS Pq,Qq (66),REX.W

AFAICT WRSS does not have 66 prefix

>  f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
>  EndTable
>  
> -Table: 3-byte opcode 2 (0x0f 0x3a)
> +Table: 3-byte opcode 3 (0x0f 0x3a)
>  Referrer: 3-byte escape 2
>  AVXcode: 3
>  # 0x0f 0x3a 0x00-0xff
> @@ -948,7 +958,7 @@ GrpTable: Grp7
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B)
>  3: LIDT Ms
>  4: SMSW Mw/Rv
> -5: rdpkru (110),(11B) | wrpkru (111),(11B)
> +5: rdpkru (110),(11B) | wrpkru (111),(11B) | RSTORSSP Mq (F3)
>  6: LMSW Ew
>  7: INVLPG Mb | SWAPGS (o64),(000),(11B) | RDTSCP (001),(11B)
>  EndTable
> @@ -1019,8 +1029,8 @@ GrpTable: Grp15
>  2: vldmxcsr Md (v1) | WRFSBASE Ry (F3),(11B)
>  3: vstmxcsr Md (v1) | WRGSBASE Ry (F3),(11B)
>  4: XSAVE | ptwrite Ey (F3),(11B)
> -5: XRSTOR | lfence (11B)
> -6: XSAVEOPT | clwb (66) | mfence (11B)
> +5: XRSTOR | lfence (11B) | INCSSP Rd (F3),REX.W
> +6: XSAVEOPT | clwb (66) | mfence (11B) | CLRSSBSY Mq (F3)
>  7: clflush | clflushopt (66) | sfence (11B)
>  EndTable
>  
> diff --git a/tools/objtool/arch/x86/lib/x86-opcode-map.txt b/tools/objtool/arch/x86/lib/x86-opcode-map.txt
> index e0b85930dd77..c5e825d44766 100644
> --- a/tools/objtool/arch/x86/lib/x86-opcode-map.txt
> +++ b/tools/objtool/arch/x86/lib/x86-opcode-map.txt
> @@ -366,7 +366,7 @@ AVXcode: 1
>  1b: BNDCN Gv,Ev (F2) | BNDMOV Ev,Gv (66) | BNDMK Gv,Ev (F3) | BNDSTX Ev,Gv
>  1c:
>  1d:
> -1e:
> +1e: RDSSP Rd (F3),REX.W
>  1f: NOP Ev
>  # 0x0f 0x20-0x2f
>  20: MOV Rd,Cd
> @@ -610,7 +610,17 @@ fe: paddd Pq,Qq | vpaddd Vx,Hx,Wx (66),(v1)
>  ff: UD0
>  EndTable
>  
> -Table: 3-byte opcode 1 (0x0f 0x38)
> +Table: 3-byte opcode 1 (0x0f 0x01)
> +Referrer:
> +AVXcode:
> +# Skip 0x00-0xe7
> +e8: SETSSBSY (f3)
> +e9:
> +ea: SAVEPREVSSP (f3)
> +# Skip 0xeb-0xff
> +EndTable
> +
> +Table: 3-byte opcode 2 (0x0f 0x38)
>  Referrer: 3-byte escape 1
>  AVXcode: 2
>  # 0x0f 0x38 0x00-0x0f
> @@ -789,12 +799,12 @@ f0: MOVBE Gy,My | MOVBE Gw,Mw (66) | CRC32 Gd,Eb (F2) | CRC32 Gd,Eb (66&F2)
>  f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
>  f2: ANDN Gy,By,Ey (v)
>  f3: Grp17 (1A)
> -f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v)
> -f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v)
> +f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSS Pq,Qq (66),REX.W
> +f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSS Pq,Qq (66),REX.W
>  f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
>  EndTable
>  
> -Table: 3-byte opcode 2 (0x0f 0x3a)
> +Table: 3-byte opcode 3 (0x0f 0x3a)
>  Referrer: 3-byte escape 2
>  AVXcode: 3
>  # 0x0f 0x3a 0x00-0xff
> @@ -948,7 +958,7 @@ GrpTable: Grp7
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B)
>  3: LIDT Ms
>  4: SMSW Mw/Rv
> -5: rdpkru (110),(11B) | wrpkru (111),(11B)
> +5: rdpkru (110),(11B) | wrpkru (111),(11B) | RSTORSSP Mq (F3)
>  6: LMSW Ew
>  7: INVLPG Mb | SWAPGS (o64),(000),(11B) | RDTSCP (001),(11B)
>  EndTable
> @@ -1019,8 +1029,8 @@ GrpTable: Grp15
>  2: vldmxcsr Md (v1) | WRFSBASE Ry (F3),(11B)
>  3: vstmxcsr Md (v1) | WRGSBASE Ry (F3),(11B)
>  4: XSAVE | ptwrite Ey (F3),(11B)
> -5: XRSTOR | lfence (11B)
> -6: XSAVEOPT | clwb (66) | mfence (11B)
> +5: XRSTOR | lfence (11B) | INCSSP Rd (F3),REX.W
> +6: XSAVEOPT | clwb (66) | mfence (11B) | CLRSSBSY Mq (F3)
>  7: clflush | clflushopt (66) | sfence (11B)
>  EndTable
>  
> 

