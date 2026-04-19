Return-Path: <linux-doc+bounces-83777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOvDFLcb5GmyRAEAu9opvQ
	(envelope-from <linux-doc+bounces-83777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 02:03:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AE422A3F
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 02:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AAF430254AA
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F5D40DFBF;
	Sun, 19 Apr 2026 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xfn5zTdI"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52EB33EF;
	Sun, 19 Apr 2026 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776556977; cv=none; b=A8TU2PnI5JljzldFAFjDDoXEjp8bYx+BMbuLqMCMowJVKcCQuge4gCdqDwhBJGrx4vCTzz+YuWdsCAt5CkbzKYuloqVGn9RuaGgNgY3dsH1qGsp8aUyScAsaltL24UKa6xpCw8HuTGdNBEfLkYGNb9ByEP5/b1AfTLj43UTLnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776556977; c=relaxed/simple;
	bh=Z2HtKXwss1Fvy22jGFscj09RjnJ4eW9+WFBRTUiwM84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r37aSa538Ff4yX8KrxsocHcw6AeWtC8qM3E4Ns7B/zs9cnkZQtcMk5Dnmhtws9nvkxh12Hc1vm8Z38GpXoDntE4JmP3aHhsKMOVIKwa2jIpzXQxc0kvuLXw13MemtAa9B4KG/AMnlcNFmxkUCQeWRXGuSo71CqJ0NjE7s/eINrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xfn5zTdI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xO3w8Ml/3fPEZ9ruq+khZ/hM4mLNm47009rtCiApahE=; b=xfn5zTdI8FH1CRyTXViCEPB1zA
	n68XTcEOdfRu/KOHa93bkHX+M/lqQQVN+1L+AmMJ2FqA8oPtWzDO8GomOlpZ5wy8zhPH1uLOTaRWE
	Tk4D2pr8D/aroGS7QO81u/JPw89zMeZlWPr7tCJq82QhVHSxFV/+ZC3t5BCmtW0Q+9nJXv2tFALjf
	J0FfZHLGczQRG9sIyHpsXXix44ypteG69ssP5+Vjfa4q6Y71AMTfqzlENc/ubNNZ5YK9wQMr/EZn+
	tM+BWZn/ogLPoEPEfZKfdlQELZrYSl0D7ozBS4GCdZG77YnF+l48OqT+jH5TDpYwnoHmBMKrYzT4g
	fFfCDnQQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEFcm-00000005Lj5-0LDa;
	Sun, 19 Apr 2026 00:02:56 +0000
Message-ID: <63c25cd9-2145-40c7-b1bc-463214d5df6c@infradead.org>
Date: Sat, 18 Apr 2026 17:02:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] MAINTAINERS: add an entry for media maintainers
 profile
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, Dan Williams <djbw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
 <361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <361c00348573e45b4e06b674b2b45e47dc65c938.1776405189.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83777-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,infradead.org:dkim,infradead.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD7AE422A3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 11:11 PM, Mauro Carvalho Chehab wrote:
> The media subsystem has a maintainers entry profile, but its entry
> is missing at MAINTAINERS.
> 
> Add it.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0b106a4dd96..620219e48f98 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16115,6 +16115,7 @@ S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media.git
> +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
>  F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/driver-api/media/

I now see 2 P: entries for MEDIA INPUT INFRASTRUCTURE
and 2 P: entries for X86 ARCHITECTURE.
(don't know how/why)

-- 
~Randy


