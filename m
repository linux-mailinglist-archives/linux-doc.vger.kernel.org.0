Return-Path: <linux-doc+bounces-87699-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ8jFYxlB2qE1gIAu9opvQ
	(envelope-from <linux-doc+bounces-87699-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 20:27:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 690995562F7
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 20:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0182B302EF78
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 18:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE093EEACB;
	Fri, 15 May 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fipa0HJd"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A823EEAC0;
	Fri, 15 May 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869518; cv=none; b=eEOibQP4qo97eR300XqYRsV702tAX9/lAJd0ioiFVItvdiNK72qyMX57WTZTFZXI5+vZyiITC84lucVV6i1rfDEsR8M3MjLN+4PlDoLkALQUwAyo7eXtXkg8i/7D+M/jj9UQfQ9zU75pqTPbB1aJN5uXwPE08FBmGwefZRixSok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869518; c=relaxed/simple;
	bh=+D39WEqyomb+nNPmuTRr+bLaKZEw4mD9zXtCoFo/EFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FeNRna/9qfnCz+3Ec+mx12J961P8Ksg+7kHlvXZB5KDHjIgv/UWTTdHefCcmTf/LNXP1ILts6UzB1uFGWiYYWuEUvvkrAUttiPg0J1ySfwrC3NWCEV9qnYlUywHOFqrctbDUKecdJbr1Ctl9vHdJreAaaQPVK15E5af3mRUaN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fipa0HJd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=XrAQLDba89PLjVWu5sBEja37v+TAXs5K9v4QTmQpbDY=; b=fipa0HJdm8Yh9vCyZBaGmhgfc0
	SXNxG1UHA66FL5ff6j+qGpV1O+zpevSGZ9myd35yTG6APJdzQv+ThIGmjYa3ZZ8UrNgQ4RLT490EE
	RQw3q3VWFBQlgMO6r4mvxzpR/mGe5KJqjER5HP4kFzNnXqPk1dWLNKvJ0mUr/NkGXmhE9dnTUsAnM
	GCnJtou0QgOw2N3x9xtqGFGw/LSORUTl6sF0MFS6ghPKKfc+vhAQy5M6OAQMWBIhVTa/9nlo/Nd19
	3JtGDHcZiJb1qKQ5lxwyVmsPLhCe8NosMAva40n0ljMKlNwjdrNAu074atB3v0oIzvsN5JUBFWwRV
	WWhZqwmA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxDg-000000095H1-2aRW;
	Fri, 15 May 2026 18:25:08 +0000
Message-ID: <e20c670c-8224-4bbe-aed3-8c5f498d37e8@infradead.org>
Date: Fri, 15 May 2026 11:25:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: sysctl/net: Remove ax25, netrom, rose entries
To: Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515180200.1490926-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260515180200.1490926-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 690995562F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87699-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Action: no action



On 5/15/26 11:01 AM, Costa Shulyupin wrote:
> These networking subsystems were removed in commit dd8d4bc28ad7
> ("net: remove ax25 and amateur radio (hamradio) subsystem"),
> but the sysctl directory table still listed them.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/sysctl/net.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> index 0724a793798f..3db464e006a3 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -36,12 +36,11 @@ Table : Subdirectories in /proc/sys/net
>   ========= =================== = ========== ===================
>   802       E802 protocol         mptcp      Multipath TCP
>   appletalk Appletalk protocol    netfilter  Network Filter
> - ax25      AX25                  netrom     NET/ROM
> - bridge    Bridging              rose       X.25 PLP layer
> - core      General parameter     tipc       TIPC
> - ethernet  Ethernet protocol     unix       Unix domain sockets
> - ipv4      IP version 4          vsock      VSOCK sockets
> - ipv6      IP version 6          x25        X.25 protocol
> + bridge    Bridging              tipc       TIPC
> + core      General parameter     unix       Unix domain sockets
> + ethernet  Ethernet protocol     vsock      VSOCK sockets
> + ipv4      IP version 4          x25        X.25 protocol
> + ipv6      IP version 6
>   ========= =================== = ========== ===================
>  
>  1. /proc/sys/net/core - Network core options

-- 
~Randy

