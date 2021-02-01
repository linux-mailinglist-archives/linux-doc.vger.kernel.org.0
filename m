Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6DD30B319
	for <lists+linux-doc@lfdr.de>; Tue,  2 Feb 2021 00:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhBAXGC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Feb 2021 18:06:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:9419 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhBAXGB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Feb 2021 18:06:01 -0500
IronPort-SDR: 4U/UvTiftl/J9gw1mwGjVgINF54jk4j9WJeYjCGaaI0WQzfCSvReE6b2efevk3RhO/U/y1GCM1
 OP4qlWEKiKFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199673313"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="199673313"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 15:05:20 -0800
IronPort-SDR: Sk7ncts+73AGCaMMi91HA/0PjCNQTioKvWsv3VXI82btE/75sAijj26QN65AICsr5CwY/e+CNw
 iUGkiuQO9LZw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="358781936"
Received: from yyu32-mobl1.amr.corp.intel.com (HELO [10.212.112.229]) ([10.212.112.229])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 15:05:17 -0800
Subject: Re: [PATCH v18 05/25] x86/fpu/xstate: Introduce CET MSR and XSAVES
 supervisor states
To:     Dave Hansen <dave.hansen@intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
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
        Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210127212524.10188-1-yu-cheng.yu@intel.com>
 <20210127212524.10188-6-yu-cheng.yu@intel.com>
 <7793b36e-6386-3f2e-36ca-b7ca988a88c9@intel.com>
 <43f264df-2f3a-ea4c-c737-85cdc6714bd8@intel.com>
 <0a5a80c0-afc7-5f91-9e28-a300e30f1ab3@intel.com>
 <465836bd-9c80-fed9-d9af-89275ff810eb@intel.com>
 <cd8f4889-fbe4-fc0e-0686-9c9ecc4a125b@intel.com>
From:   "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
Message-ID: <a6550292-cd99-a5e2-df7b-d43f6cc8fed0@intel.com>
Date:   Mon, 1 Feb 2021 15:05:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cd8f4889-fbe4-fc0e-0686-9c9ecc4a125b@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/1/2021 2:59 PM, Dave Hansen wrote:
> On 2/1/21 2:43 PM, Yu, Yu-cheng wrote:
>> On 1/29/2021 2:53 PM, Dave Hansen wrote:
>>> On 1/29/21 2:35 PM, Yu, Yu-cheng wrote:
>>>>> Andy Cooper just mentioned on IRC about this nugget in the spec:
>>>>>
>>>>>       XRSTORS on CET state will do reserved bit and canonicality
>>>>>       checks on the state in similar manner as done by the WRMSR to
>>>>>       these state elements.
>>>>>
>>>>> We're using copy_kernel_to_xregs_err(), so the #GP *should* be OK.
>>>>> Could we prove this out in practice, please?
>>>>>>
>>>> Do we want to verify that setting reserved bits in CET XSAVES states
>>>> triggers GP?  Then, yes, I just verified it again.  Thanks for
>>>> reminding.  Do we have any particular case relating to this?
>>>
>>> I want to confirm that it triggers #GP and kills userspace without the
>>> kernel WARN'ing or otherwise being visibly unhappy.
>>
>> For sigreturn, shadow stack pointer is checked against its restore token
>> and must be smaller than TASK_SIZE_MAX.  Sigreturn cannot set any
>> MSR_IA32_U_CET reserved bits.
> 
> That would be nice to at least allude to in the changelog or comments.
> 

Ok.

>>> What about the return-to-userspace path after a ptracer writes content
>>> to the CET fields?   I don't see the same tolerance for errors in
>>> __fpregs_load_activate(), for instance.
>>>
>>
>> Good thought.  I have not sent out my revised PTRACE patch, but values
>> from user will be checked for valid address and reserved bits.
> 
> Wait a sec...  What about *THIS* series?  Will *THIS* series give us
> oopses when userspace blasts a new XSAVE buffer in with NT_X86_XSTATE?
> 

Fortunately, CET states are supervisor states.  NT_x86_XSTATE has only 
user states.
