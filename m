Return-Path: <linux-doc+bounces-92174-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qvGECVJbLGpZPwQAu9opvQ
	(envelope-from <linux-doc+bounces-92174-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:17:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A875967BF3B
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:17:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=B50uc+n8;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92174-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92174-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740B73243AE4
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC43379990;
	Fri, 12 Jun 2026 19:17:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956552F7EF7;
	Fri, 12 Jun 2026 19:17:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291837; cv=none; b=BNsjd6Yv1Mz3DBh00j0eVY+ky8QiOQrWN0y5SzYB6iJOwSZIX3JJyE0kbAGSVzNGaMTT6tqIFvybmnwKuUIGY97ryKBh9GGL/qjz6B/NdypOo+kwie52oladPzCBl7a4yZlMnjot9op1+PolBZY5/e3SRVLsnqRLL37l6ZjjK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291837; c=relaxed/simple;
	bh=OwNFJwn6yQkAESIY+s+Av0XQ0kNUs3+OGgsFW4Z6wRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ku/XmSGJOe8HLVOonzQKXih63HiGJktvJs3pgmJRFUR8ZIvi2Am/aLg1C7qbSekalXt6YGpsv6jJBOljHyN2IpDsO5jpRnA5djVd4V9RM1GRQ0vctqomJ9ESz4chITovzy0Hu0cty0FAji3tD7Wssv7yfk5y8bpCYIpMoanqhs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=B50uc+n8; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A346640430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781291835; bh=HH2moNpZWt+XN8tXRSKqJX51PwUlhD/ypigBEwKqVGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B50uc+n8SBBYjg70I3kRVsmnmUKcnKuIrmrZCYuEnV3ObcFO5GSJqKiwUjw+b9NZ/
	 MYYeaKnItIe4jFDsrzZRiitkI4duonYB0L/MFQ+NKKZhD/P8vVuDH1Evmp7kPiWpRx
	 z+eJ0zrEtOKFZUpGe1ifoAqueR1sWKsRFU6pxlWfXd2f8NNJK/WiDeFcJtCQAgQt59
	 OlU0HBB9M/QY4VXufYDWDqtngGEYtwcRJK+60SVzbpF5DhDJ0nFfgVzQ2fav/4jvQa
	 cJtNDppeMCYjSGOl+QiCeQiz9W2C2arD5leaSg1eN5b/PCtgWv/nmQZ0TwouTRAgbh
	 1MkpAqIRQry+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A346640430;
	Fri, 12 Jun 2026 19:17:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Vineet Gupta
 <vgupta@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, "open list:SYNOPSYS ARC ARCHITECTURE"
 <linux-snps-arc@lists.infradead.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/SAMSUNG S3C, S5P
 AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "open
 list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH] v2 Documentation: arch: fix brackets
In-Reply-To: <20260612095432.177759-2-manuelebner@mailbox.org>
References: <20260612095432.177759-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:17:14 -0600
Message-ID: <87qzmb7emd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:vgupta@kernel.org,m:skhan@linuxfoundation.org,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92174-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[mailbox.org,kernel.org,linuxfoundation.org,linaro.org,samsung.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A875967BF3B

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing and remove needless parentheses, brackets and curly braces.
> Fix typos.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> [v1] -> [v2]
> "(i.e cache geometries)" -> "(e.g., cache geometries)"
> "Excer[t" -> "Excerpt"
> add Reviewed-by: Randy Dunlap
> fixed my own typos.
> ---
>  Documentation/arch/arc/arc.rst                 |  2 +-
>  .../arm/samsung/clksrc-change-registers.awk    |  2 +-
>  Documentation/arch/arm/vlocks.rst              |  4 ++--
>  .../arch/arm64/memory-tagging-extension.rst    |  2 +-
>  Documentation/arch/powerpc/vas-api.rst         |  2 +-
>  Documentation/arch/sparc/oradax/dax-hv-api.txt | 18 +++++++++---------
>  Documentation/arch/sparc/oradax/oracle-dax.rst |  2 +-
>  Documentation/arch/x86/x86_64/fsgs.rst         |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)

As Krzysztof pointed out, you formatted the subject incorrectly, meaning
that the maintainer has to clean it up for you.  I have applied the
patch and done that this time, but please pay attention to the
formatting in the future.

Thanks,

jon

