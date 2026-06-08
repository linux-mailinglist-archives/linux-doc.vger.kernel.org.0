Return-Path: <linux-doc+bounces-91271-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6dBRC9oSJmoTSAIAu9opvQ
	(envelope-from <linux-doc+bounces-91271-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 02:54:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666B652096
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 02:54:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=d74sReTm;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91271-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91271-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE05C300A777
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 00:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544A2282F00;
	Mon,  8 Jun 2026 00:54:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B23218ADD;
	Mon,  8 Jun 2026 00:54:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880086; cv=none; b=SY5UtM4YUtU5ggRrHI7/gbV4QB1814xDogIRyW9g7EJpkP926NS1HQNOg6MKRhspyqUNjJ2u5n6qoVLndpzbRzcKUX04LuZZL8BR+lVhdEzpxhuPVkWffHIyyg3WAxE6snWD9LuWUocr4dD3gKSRE3OlcGkcZEotxCc5h06/ZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880086; c=relaxed/simple;
	bh=Q1It54qPZCIHkTS1MWLyMPYIfa7EccnfSemfTvR7Naw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl79TAGLQJV6IwNbw4Lw7KZ0fgnuLGtfa15vn8gGbZV/55amt1Cfv/bYpWjVFLmGVFVEKZOtI8Qz+U7ue9Rl5lEWy2qSY3wgj2DKME1ROVNnAPLV3wGFOWECbheD8OsehbC9tdA7hbrxDksSdU+5HOkvHy7zh3SzxIqU3DLEY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d74sReTm; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ShFQ9EorUm+nbRjCcbJiwMVsx6NcpvU826vdjnfw00=; b=d74sReTmUzlCHb8pju1NuBfO64
	6Nrh++6QnCPceWpTv6jX9T+4/mmJCkIP9D2r8mpjNKwb56r1fIJN/ra12W08SyRtGnOmIUbf67q0p
	xabFjc5uWsEBzGUS+FrSU5jvsRIShY2R6HUizhgGM5BWdoboTg8wP7Eu24wk5oKjLFaLGDv46+CaQ
	jnzaN7rmB9/Jm7hbQJGx72B5olnm1ItCG7brwKZTXdRyXqj1SaRNvGwnMSInxcfoFYtKRIKzzOCgM
	PYzKX5ERmF27oQlVjc8LJKQdPoVySpnhiRMxVacFjQvh6irRl4qOUR4HIqvrBa9HklU9SvFr0nkN+
	9SKDwW8A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWOG3-00000002fAh-2YK8;
	Mon, 08 Jun 2026 00:54:27 +0000
Message-ID: <826629c7-4acf-45f6-8191-1973986da4b2@infradead.org>
Date: Sun, 7 Jun 2026 17:54:26 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation/arch/x86: remove obsolete vdso32=2
 compatibility note
To: Thorsten Blum <thorsten.blum@linux.dev>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607151614.79567-5-thorsten.blum@linux.dev>
 <20260607151614.79567-8-thorsten.blum@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260607151614.79567-8-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91271-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,infradead.org:from_mime,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5666B652096



On 6/7/26 8:16 AM, Thorsten Blum wrote:
> Commit b0b49f2673f0 ("x86, vdso: Remove compat vdso support") removed
> compat vDSO support and documented vdso32=2 as an alias for vdso32=0.
> 
> However, since commit c06989da39cd ("x86/vdso: Ensure vdso32_enabled
> gets set to valid values only"), vdso32_setup() accepts only 0 and 1.
> 
> Remove the obsolete vdso32=2 compatibility note and document only the
> supported values.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Great to see that we are keeping the docs up-to-date.
Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 97007f4f69d4..ce1c630d6859 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -8249,15 +8249,12 @@ Kernel parameters
>  
>  	vdso32=		[X86] Control the 32-bit vDSO
>  			vdso32=1: enable 32-bit VDSO
> -			vdso32=0 or vdso32=2: disable 32-bit VDSO
> +			vdso32=0: disable 32-bit VDSO
>  
>  			See the help text for CONFIG_COMPAT_VDSO for more
>  			details.  If CONFIG_COMPAT_VDSO is set, the default is
>  			vdso32=0; otherwise, the default is vdso32=1.
>  
> -			For compatibility with older kernels, vdso32=2 is an
> -			alias for vdso32=0.
> -
>  			Try vdso32=0 if you encounter an error that says:
>  			dl_main: Assertion `(void *) ph->p_vaddr == _rtld_local._dl_sysinfo_dso' failed!
>  
> 

-- 
~Randy

