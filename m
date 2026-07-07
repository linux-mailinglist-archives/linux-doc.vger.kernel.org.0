Return-Path: <linux-doc+bounces-95272-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w766LJ1CTGrWiQEAu9opvQ
	(envelope-from <linux-doc+bounces-95272-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 02:04:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D899716694
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 02:04:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=jRyjemAb;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95272-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95272-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2744302D96B
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 00:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D303FFD;
	Tue,  7 Jul 2026 00:04:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC114ABE;
	Tue,  7 Jul 2026 00:04:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783382682; cv=none; b=acis9Fv0gv2xmdOMNK9ZcT9I6OViPDEfKZTsryoc2wOEln4FkOygDolq7w19qdBjzNhK8Sfi0f9CNQsUmqpeNHKKH7oMGzlNHfYxf3TXDIZhbch5BE3kbcPq7dIq3Mz6gjB1pS5AJq6xY5IZcOVapeZ9AZJKjbPFPedAwtxXiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783382682; c=relaxed/simple;
	bh=4K15lUYlCT2M8aHdYBpqCJdEfhnL4ojMLyt6K+OBoWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCVaNI6RpelADJqPo1sH8gIkAeyzjF8t4IjHihh6Lc6KqZHelbST9+LHIrzp5zFsJli/itv3X9TYkXAOp3jYrLweWI1DfZUqJdvRBD+QBlqbXLQzhYLA6K8vfENeGWgszlpxg06g9Ldiq/cyfcxPK3eddyIvRT2GAz0Yt4r6Lfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jRyjemAb; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wBEE3bGdJJeaKsBMj2QzhwubA7UQnhJ2zebSKEE6TDU=; b=jRyjemAbpHk2JMkzX9tuEyJ6Y7
	nleU1Cl6Q9OBmS9A6uRm9DXMmvqZTQeZGjKCpoekH0HL/f5cgDFba1HvlK4zcZTiolyl4M4V58qA4
	4VnBEHAez89C7wXwCdNj3cZrtfySyLKWn7fyutsxBqPNJmFWimPrnv/WsKItGoE2/D1MtOsYEG2bj
	eIIF80mC7O08eFYqhq7qmuIW1plc50i/vs3QlngyArq3tcr96k9YPB1rdOVlPpdAlILXb1+sajOYX
	ljhvFT2+6IZ9lrf2XQQqXi9rr32Xs4v0t+9iyRLIkm/Vdtzu9TqcBLYstz/ZMrNCj1i5hAjDXc5UX
	VfNczXNQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtIf-0000000DoWM-0NSW;
	Tue, 07 Jul 2026 00:04:33 +0000
Message-ID: <9811a0ae-5acf-4124-a1e4-4a4d6c267aa0@infradead.org>
Date: Mon, 6 Jul 2026 17:04:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/arch/x86/amd-memory-encryption.rst: Fix
 typo
To: =?UTF-8?Q?C=C3=A9dric_Hannotier?= <hannotiercedric@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260704125516.49944-1-hannotiercedric@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260704125516.49944-1-hannotiercedric@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95272-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hannotiercedric@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D899716694



On 7/4/26 5:55 AM, Cédric Hannotier wrote:
> The MSR address has one 0 too many: 0xc00100010 → 0xc0010010.
> 
> Signed-off-by: Cédric Hannotier <hannotiercedric@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/arch/x86/amd-memory-encryption.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
> index bd840df70..92edb26a5 100644
> --- a/Documentation/arch/x86/amd-memory-encryption.rst
> +++ b/Documentation/arch/x86/amd-memory-encryption.rst
> @@ -53,7 +53,7 @@ CPUID function 0x8000001f reports information related to SME::
>  			   system physical addresses, not guest physical
>  			   addresses)
>  
> -If support for SME is present, MSR 0xc00100010 (MSR_AMD64_SYSCFG) can be used to
> +If support for SME is present, MSR 0xc0010010 (MSR_AMD64_SYSCFG) can be used to
>  determine if SME is enabled and/or to enable memory encryption::
>  
>  	0xc0010010:

-- 
~Randy

