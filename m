Return-Path: <linux-doc+bounces-93761-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5qYOEInYPmouMQkAu9opvQ
	(envelope-from <linux-doc+bounces-93761-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 21:52:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C546E6CFED0
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 21:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=Qf2sQZ3Y;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93761-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93761-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA0230BAE0D
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8EC3BAD9F;
	Fri, 26 Jun 2026 19:50:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403662EA47C
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 19:50:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782503428; cv=none; b=qWcE7QRWj5wBoxd6YaRGl9niHbRVMY/T8m0HY73maMA9j+6fs+iVchWRUHABxrjHMVluLFvEsKv3PtMxmTXP5Hc7wrwDDBqh+jj+aHDHnqObths2+fj3O1JXgha3ii/r0iEUrdfR5LcXv9H8xlyXqkZjv11Ymu23orK3KPVnWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782503428; c=relaxed/simple;
	bh=qP39YovkqofRgywqdEQqpFd8SwiD+IXWqUfXEhxzx6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WVUmHJtV5ZerQUwJTXZq0/IR8Bxxb2BctFt/Iqt3uADYl/vlFHBSsVTe9cbOTgXQOt3MaDJafOa1tfa/SiSWfpINj4Vg1ff+R/5LwfgZfNdQmjyfcclNn5A+yFmRO+e1TaEL9O0LPisA1isscRzavGVYhJK05yx5yKU8KZ2NkLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qf2sQZ3Y; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=xI1u9Q8uX0oUdnnJTDPwrrwr6Ur+M3wOGd6jcoA8Reg=; b=Qf2sQZ3YXPhJEh71iZjOXYOh3b
	cxcltYyaGAcU82KxRb8CmSoqB7FVjImnP/24ACglTdrME2i3uhlZ/8DNuubkVTzWSJzQpQ37XApN6
	L9u0fsqnjHHozqi+HDFknO4emt4pv8O1IWbFeVNs2lp5+9YcQesVgafFiT1IJ7W5FK070uBhRbFVO
	ChkbBEr31GM5cdoMdPsjY07kAmDCb+39jl5eRBENwIIKATtke3MrRNWTl7gO9FWDQVMRCw78kh4v/
	bjsOAWxgikIT92awobyuiKM5lvx8/vUp5+0Ou98crAQuKzfKJKKJHc+sjtrpx+nEjFwht3eFXtG35
	xt+JXfKg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdCZ5-0000000Bnsc-08pY;
	Fri, 26 Jun 2026 19:50:15 +0000
Message-ID: <005e9767-3fa8-4108-83bc-db0da77ab7bc@infradead.org>
Date: Fri, 26 Jun 2026 12:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix openSUSE libelf-devel package name
To: David Disseldorp <ddiss@suse.de>, linux-doc@vger.kernel.org
References: <20260626044804.14258-1-ddiss@suse.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260626044804.14258-1-ddiss@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ddiss@suse.de,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93761-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C546E6CFED0



On 6/25/26 9:48 PM, David Disseldorp wrote:
> The proposed "zypper install ... libelf-dev" invocation results in an
> error:
>   'libelf-dev' not found in package names. Trying capabilities.
>   No provider of 'libelf-dev' found.
> 
> openSUSE and derivitives (Tumbleweed, Leap and SLES) use a "devel"
> suffix instead of "dev".
> 
> Link: https://build.opensuse.org/projects/openSUSE:Factory/packages/elfutils/files/elfutils.spec
> Signed-off-by: David Disseldorp <ddiss@suse.de>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index cb178e0a62084..f6b31d7207ff6 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -446,7 +446,7 @@ distributions:
>   * openSUSE and derivatives::
>  
>       sudo zypper install bc binutils bison dwarves flex gcc git make perl-base \
> -       openssl openssl-devel libelf-dev
> +       openssl openssl-devel libelf-devel
>  
>  In case you wonder why these lists include openssl and its development headers:
>  they are needed for the Secure Boot support, which many distributions enable in

-- 
~Randy

