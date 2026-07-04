Return-Path: <linux-doc+bounces-94960-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HfJRFkklSWryygAAu9opvQ
	(envelope-from <linux-doc+bounces-94960-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 04 Jul 2026 17:22:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B7707D55
	for <lists+linux-doc@lfdr.de>; Sat, 04 Jul 2026 17:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=NSxfTgz5;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94960-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94960-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC222301B168
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jul 2026 15:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2A83C13F9;
	Sat,  4 Jul 2026 15:22:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557363BE165;
	Sat,  4 Jul 2026 15:22:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178561; cv=none; b=g5hl9lWwnx+uqmdbWde7Z5KfbkOVwVQn7jyynev89vW35wOB7zrVoyUqp0SckyZVPzo3rmaTzXrPHnG9q1dWyOZDchZRa/UiYvJGSpvDeJVT8SalQam7aQzVdmp7pJhPNl5nd3gexp6EUADoqP8gEVBvcyugodCoDIwC6PQb/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178561; c=relaxed/simple;
	bh=QwCmdO6E5azStg51AC3NudnyfHzPC1nm99e48+x9EcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at5opAcYCDKmAN93XqJKc8pH5sQPe3OJ/LlRLYS+ZJQl/U/qVIePG+ZKFTIewPnnUn8khOOp09UTv8yDaxZSoH7iUqmn6014N9Z8VxzKOSjnFgmqV5u5WAiTHoBhLHTnr4PyaaNDxO4NH4RKwt4My8If/lhSYNr4iXBisUH8ESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NSxfTgz5; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qcla6IH6/IEV19XiTYQqUJaFkJTRhWFhu35QeOgffrs=; b=NSxfTgz54eNwS83Px9BQETaHt5
	Cx0HuPK5FbKIEybVKRplQ0qfI0vQtumRG8ZQOOKgBj0nojyxa2/0GDDbN2HYtVG54vaUcLn5jIX6l
	jfr/EB1TwbyxzDFjcr1os9yHIbfX/xlMkZ2B57pXVXiGpHLbX4fVF2Wh1VQnHqAWeAn/hjS4MlAMH
	mZwoS2RNWElashHQoOgvCdSZxbMNtOSXGRz65Pveax/1DBvsAyTbIQhNu5Q9SwlDSRtNQf0H0TOzD
	EIsGJBc/55eXTN8ojJqVnV9G8IVFDz/m+nESVxx3MJx+4ZwFSmZhZ/WvAacu7paz14R4ocMmHsnDS
	0XOq9f/A==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2CC-0000000C7ES-3NIq;
	Sat, 04 Jul 2026 15:22:20 +0000
Date: Sat, 4 Jul 2026 16:22:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, peterz@infradead.org,
	luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
Message-ID: <akklLLPZ1fbcZRML@casper.infradead.org>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704015859.536580-2-gourry@gourry.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gourry@gourry.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:lance.yang@linux.dev,m:marc.herbert@linux.intel.com,m:kees@kernel.org,m:leitao@debian.org,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:nathan@kernel.org,m:xur@google.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94960-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E2B7707D55

On Fri, Jul 03, 2026 at 09:58:58PM -0400, Gregory Price wrote:
> +config SYSCALL_USER_DISPATCH
> +	bool "Syscall User Dispatch"
> +	depends on GENERIC_ENTRY
> +	default y
> +	help
> +	  Syscall User Dispatch lets a thread have its own system calls outside
> +          an allowed IP address range to be intercepted and redirected to a
> +          userspace signal handler.

I was very confused when I read this.  IP expands to Internet Protocol
long before it gets to Instruction Pointer in my brain.

