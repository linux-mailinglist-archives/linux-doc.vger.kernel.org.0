Return-Path: <linux-doc+bounces-1156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940E7D77A6
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 00:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917061F2272B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 22:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47466347DD;
	Wed, 25 Oct 2023 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UySnnW7a"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25134195
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 22:13:51 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B715113A
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 15:13:49 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso1831845e9.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698272028; x=1698876828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9y7oLBOcWU9GNaJgQJI7wONbOuLyQxAlNsa9af8QYnk=;
        b=UySnnW7al8+QuV6V1CZiGO+jPm3lkuCO8K76JbdSksvCKjd3Cii01aqnRL7lWuui+A
         K2ZJgreRaGqpihIT8VUupBzEkY+c69+gZFk0oMCyIAXjNsahPnPZoyhl1BrbOIDyg4ru
         +5v8mF/qeieQEu2NFbuwcrC5aN9gGfE0uquX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698272028; x=1698876828;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y7oLBOcWU9GNaJgQJI7wONbOuLyQxAlNsa9af8QYnk=;
        b=Uh8d8/JqGDFW13ZzJ/o69PWfefd1aQOMATjEhZXxAxWcnk78VDYr7pcfvKerHIOvC2
         wHnQj7vboP+5omXGdrrZoJoq7ix1In4rOw0sUdooNWQkyy/ipybDP8GcWt/X2iyHybDs
         u9zfSE1bPcY+yQvIsBmWnMHnT4MvM6zWA5BZmbpv5osEhBhH/uUtVBx6Ws30PGGPgkqC
         2FvGj7Tm9cAMscjv4/dHghpi4uHT9Ru6JvzV8TMefHOjiH9EDTMrYuvdmGU2tziwZUs/
         lt6ucLhxip2VeV/yRan0gMHdJwSaqNJOyDdORx80Kwo+11d/y7IVTfsvUTJMYjBtuGqX
         w4RA==
X-Gm-Message-State: AOJu0YyBRcNBNgkmAswzOMEJBIF5QMRPtZqDxpMDP3D7FZe2svrDu0b6
	8Az2rNS6zBkWVURkXjeZF1Nejg==
X-Google-Smtp-Source: AGHT+IGW8wzVl6/K3XPdoqO9+fiTsoVkl9WkvVk02kCMb8fhluVzqxu9kLGiTwMv1llU1w4NWUQ5CQ==
X-Received: by 2002:a05:600c:c84:b0:406:8494:f684 with SMTP id fj4-20020a05600c0c8400b004068494f684mr12165364wmb.23.1698272028151;
        Wed, 25 Oct 2023 15:13:48 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
        by smtp.gmail.com with ESMTPSA id dj18-20020a0560000b1200b0032d96dd703bsm12927265wrb.70.2023.10.25.15.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 15:13:47 -0700 (PDT)
Message-ID: <0ee3e3cd-01b2-4662-ba08-d137663f1699@citrix.com>
Date: Wed, 25 Oct 2023 23:13:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/6] x86/bugs: Add asm helpers for executing VERW
Content-Language: en-GB
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, tony.luck@intel.com, ak@linux.intel.com,
 tim.c.chen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 Alyssa Milburn <alyssa.milburn@linux.intel.com>,
 Daniel Sneddon <daniel.sneddon@linux.intel.com>,
 antonio.gomez.iglesias@linux.intel.com,
 Alyssa Milburn <alyssa.milburn@intel.com>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>
 <20231025220735.gpopnng76klkbuu3@desk>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20231025220735.gpopnng76klkbuu3@desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2023 11:07 pm, Pawan Gupta wrote:
> On Wed, Oct 25, 2023 at 10:10:41PM +0100, Andrew Cooper wrote:
>>> +.align L1_CACHE_BYTES, 0xcc
>>> +SYM_CODE_START_NOALIGN(mds_verw_sel)
>>> +	UNWIND_HINT_UNDEFINED
>>> +	ANNOTATE_NOENDBR
>>> +	.word __KERNEL_DS
>> You need another .align here.  Otherwise subsequent code will still
>> start in this cacheline and defeat the purpose of trying to keep it
>> separate.
> Right.
>
>>> +SYM_CODE_END(mds_verw_sel);
>> Thinking about it, should this really be CODE and not a data entry?
> Would that require adding a data equivalent of .entry.text and update
> KPTI to keep it mapped? Or is there an easier option?

Leave it right here in .entry.text , but try using SYM_DATA() and
friends.  See whether objtool vomits over the result or not.

And if objtool does vomit over the result, then leaving it as it is in
this patch with SYM_CODE() is good enough.

>
>> P.S. Please CC on the full series.  Far less effort than fishing the
>> rest off lore.
> I didn't realize get_maintainer.pl isn't doing that already. Proposing
> below update to MAINTAINERS:
>
> ---
> From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Date: Wed, 25 Oct 2023 14:50:41 -0700
> Subject: [PATCH] MAINTAINERS: Update entry for X86 HARDWARE VULNERABILITIES
>
> Add Andrew Cooper to maintainers of hardware vulnerabilities
> mitigations.
>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2894f0777537..bf8c8707b8f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23382,6 +23382,7 @@ M:	Thomas Gleixner <tglx@linutronix.de>
>  M:	Borislav Petkov <bp@alien8.de>
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> +M:	Andrew Cooper <andrew.cooper3@citrix.com>

Oh, right.  Perhaps R rather than M seeing as I can't make any time
commitments, but sure.

~Andrew

