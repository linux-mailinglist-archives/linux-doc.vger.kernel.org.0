Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F9C38F36E
	for <lists+linux-doc@lfdr.de>; Mon, 24 May 2021 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhEXTDF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 May 2021 15:03:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:60158 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233038AbhEXTDD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 24 May 2021 15:03:03 -0400
IronPort-SDR: XhwgcM9DXuJrZkTBujnPPtr9nSvLYsWk5vnd0Qf0QtTJPtmvGbfBcyoYr3f/qHsuAjIUrWeNnn
 hGOqwoxVEtgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="287578054"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="287578054"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 12:01:33 -0700
IronPort-SDR: FZK/D5upNX7zZ71hyU8iOibDUc93w6Wps6qzVJ5oCvRuBzWisT0tqWl4Jmkmnq73AueVz2uaZm
 bXeRo4VyQBhA==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="435385494"
Received: from yyu32-mobl1.amr.corp.intel.com (HELO [10.255.72.237]) ([10.255.72.237])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 12:01:31 -0700
Subject: Re: [PATCH v24 9/9] x86/vdso: Add ENDBR to __vdso_sgx_enter_enclave
To:     Sean Christopherson <seanjc@google.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
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
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
References: <20210401221403.32253-1-yu-cheng.yu@intel.com>
 <20210401221403.32253-10-yu-cheng.yu@intel.com> <YKv1o9XCMrLzZ5xW@google.com>
From:   "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
Message-ID: <8bc0bfb1-27f4-541e-f80c-97d16d5733bb@intel.com>
Date:   Mon, 24 May 2021 12:01:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKv1o9XCMrLzZ5xW@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/24/2021 11:51 AM, Sean Christopherson wrote:
> On Thu, Apr 01, 2021, Yu-cheng Yu wrote:
>> ENDBR is a special new instruction for the Indirect Branch Tracking (IBT)
>> component of CET.  IBT prevents attacks by ensuring that (most) indirect
>> branches and function calls may only land at ENDBR instructions.  Branches
>> that don't follow the rules will result in control flow (#CF) exceptions.
>>
>> ENDBR is a noop when IBT is unsupported or disabled.  Most ENDBR
>> instructions are inserted automatically by the compiler, but branch
>> targets written in assembly must have ENDBR added manually.
>>
>> Add ENDBR to __vdso_sgx_enter_enclave() branch targets.
>                                            ^
>                                            |- indirect
> 
> After reading the changelog, I was expecting ENDBR on every label.
> 

Sorry about the confusion.

>> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Jarkko Sakkinen <jarkko@kernel.org>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> ---
>>   arch/x86/entry/vdso/vsgx.S | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/x86/entry/vdso/vsgx.S b/arch/x86/entry/vdso/vsgx.S
>> index 86a0e94f68df..c63eafa54abd 100644
>> --- a/arch/x86/entry/vdso/vsgx.S
>> +++ b/arch/x86/entry/vdso/vsgx.S
>> @@ -4,6 +4,7 @@
>>   #include <asm/export.h>
>>   #include <asm/errno.h>
>>   #include <asm/enclu.h>
>> +#include <asm/vdso.h>
>>   
>>   #include "extable.h"
>>   
>> @@ -27,6 +28,7 @@
>>   SYM_FUNC_START(__vdso_sgx_enter_enclave)
>>   	/* Prolog */
>>   	.cfi_startproc
>> +	ENDBR
>>   	push	%rbp
>>   	.cfi_adjust_cfa_offset	8
>>   	.cfi_rel_offset		%rbp, 0
>> @@ -62,6 +64,7 @@ SYM_FUNC_START(__vdso_sgx_enter_enclave)
>>   .Lasync_exit_pointer:
>>   .Lenclu_eenter_eresume:
>>   	enclu
>> +	ENDBR
> 
> It would be better to move this below the comment about EEXIT.  As is, it looks
> like a misplaced annotation on the AEP.  The AEP doesn't need ENDBR, it's the
> EEXIT target that needs ENDBR because EEXIT is treated as an indirect branch.
> 
> Might also be helpful for future readers to explicitly state in the changelog
> that EEXIT is considered an indirect branch.
> 
> I.e.
> 
>>   	/* EEXIT jumps here unless the enclave is doing something fancy. */
> 	ENDBR
>>   	mov	SGX_ENCLAVE_OFFSET_OF_RUN(%rbp), %rbx
>> @@ -91,6 +94,7 @@ SYM_FUNC_START(__vdso_sgx_enter_enclave)
>>   	jmp	.Lout
>>   
>>   .Lhandle_exception:
>> +	ENDBR
>>   	mov	SGX_ENCLAVE_OFFSET_OF_RUN(%rbp), %rbx
>>   
>>   	/* Set the exception info. */

Thanks, I will fix that.

Yu-cheng
