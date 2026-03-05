Return-Path: <linux-doc+bounces-78105-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MGUHAcIqmlwJwEAu9opvQ
	(envelope-from <linux-doc+bounces-78105-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 23:47:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0872190F4
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 23:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793E730238F8
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 22:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC5926F291;
	Thu,  5 Mar 2026 22:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Kx7guGZm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BEE35979;
	Thu,  5 Mar 2026 22:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750816; cv=none; b=mTyE/oKk7KxZmrJTeKOxTkW62BzzfxRQw/YT7BH6haaNaJn0O8Rte5QUIcPzAkdz134587uk+1Rb3Q+vvgTpBJgUCTWapWqsaTDClr3cSM8IFC3h9UARL+4kZ1dvUtfbODoXkdmOHUbp3u2UIRPqSziJoacjFvIAEjZ15kO3SzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750816; c=relaxed/simple;
	bh=j4SprgG7NYA15WGQIqQHBoA3p0h8QwcF4WjL7ErW8XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lisfYm8njeUeH45e0mcSZchtKHR6JvqKhwjdNnftfH56Hcdkc9R+XLjpPjeRqdZRpR5Mmglgf6JeJMBLK8U0cP97wYYW2LTOwuC8+0Swma7//g0OUKKGmaATr75Rzg2BamEZ+yaAn8QIlYddHxL2FqvOqk2K0ZVnWY7vb5D4KTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Kx7guGZm; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Mk4Lr4038825
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:46:06 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Mk4Lr4038825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772750771;
	bh=5wke7KOC44iXG0XflOD3EgBG0wf5fVB5DLf2DxKi37M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kx7guGZm3oEejY0AVoLKKpr4Lo6MImVUCJ7n9+ZOV/OAJv35XeoHuswdI9PkRdT7V
	 JwuXV2ag1UJNJ2UfJDWBnra8pIAfnyoPT/zt1MQx9CMeSHTewUQgIJZUsCyWx7mP6e
	 18WXimnyH+VIl4Ly2xNadSdRYIudx/Ci1+jNHbcSnIESxrpQrxd7KIT0mZrzH1ARXC
	 PUQ62nMPB8M6AdhUOc/e0ppf4q9m2+oPVpJ+0ABLmW8RpeSGiiUca/5lbeSJonH+7W
	 qIXLy6P5Rdd2H8aHacCKjLR4bPMLOYZh5bTI+kkbL1/nGdyedwnO0pm1jDNU0zaAMZ
	 66hvzMhHrjZOQ==
Message-ID: <e3d63c9c-cf1c-4a78-8975-9cbe38568830@zytor.com>
Date: Thu, 5 Mar 2026 14:45:59 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/vsyscall: Disable LASS if vsyscall mode is set
 to EMULATE
To: Sohil Mehta <sohil.mehta@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Brendan Jackman <jackmanb@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Nam Cao <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Tony Luck <tony.luck@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305214026.3887452-1-sohil.mehta@intel.com>
 <20260305214026.3887452-5-sohil.mehta@intel.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305214026.3887452-5-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9B0872190F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78105-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[zytor.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,zytor.com:dkim,zytor.com:email,zytor.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-05 13:40, Sohil Mehta wrote:
> The EMULATE mode of vsyscall maps the vsyscall page with a high kernel
> address directly into user address space. Reading the vsyscall page in
> EMULATE mode would cause LASS to trigger a #GP.
> 
> Fixing the LASS violation in EMULATE mode would require complex
> instruction decoding because the resulting #GP does include the
> necessary error information, and the vsyscall address is not
> readily available in the RIP.
> 
> The EMULATE mode has been deprecated since 2022 and can only be enabled
> using the command line parameter vsyscall=emulate. See commit
> bf00745e7791 ("x86/vsyscall: Remove CONFIG_LEGACY_VSYSCALL_EMULATE") for
> details. At this point, no one is expected to be using this insecure
> mode. The rare usages that need it obviously do not care about security.
> 
> Disable LASS when EMULATE mode is requested to avoid breaking legacy
> user software. Also, update the vsyscall documentation to reflect this.
> LASS will only be supported if vsyscall mode is set to XONLY (default)
> or NONE.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> Eventually, the plan is to get rid of the EMULATE mode altogether. Linus
> and AndyL seem to be okay with such a change. However, those changes are
> beyond the scope of this series.
> 
> v2:
>  - Picked up Dave's review tag
>  - Removed unnecessary CR4 clearing during vsyscall_setup().
>    CR4.LASS is enabled much later via a late_initcall().
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 +++-
>  arch/x86/entry/vsyscall/vsyscall_64.c           | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..64df2c52b2e5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -8376,7 +8376,9 @@ Kernel parameters
>  
>  			emulate     Vsyscalls turn into traps and are emulated
>  			            reasonably safely.  The vsyscall page is
> -				    readable.
> +				    readable.  This disables the Linear
> +				    Address Space Separation (LASS) security
> +				    feature and makes the system less secure.
>  
>  			xonly       [default] Vsyscalls turn into traps and are
>  			            emulated reasonably safely.  The vsyscall
> diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
> index b34c8763d5e9..215ae07dd3c7 100644
> --- a/arch/x86/entry/vsyscall/vsyscall_64.c
> +++ b/arch/x86/entry/vsyscall/vsyscall_64.c
> @@ -62,6 +62,11 @@ static int __init vsyscall_setup(char *str)
>  		else
>  			return -EINVAL;
>  
> +		if (cpu_feature_enabled(X86_FEATURE_LASS) && vsyscall_mode == EMULATE) {
> +			setup_clear_cpu_cap(X86_FEATURE_LASS);
> +			pr_warn_once("x86/cpu: Disabling LASS due to vsyscall=emulate\n");
> +		}
> +
>  		return 0;
>  	}
>  

Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>


