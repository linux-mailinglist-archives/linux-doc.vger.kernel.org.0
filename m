Return-Path: <linux-doc+bounces-86028-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPasKPIF+2mbVQMAu9opvQ
	(envelope-from <linux-doc+bounces-86028-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 11:12:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F84D865A
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 11:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E241308858D
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CE835F5E4;
	Wed,  6 May 2026 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H7dHiUlk"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1973CBE70;
	Wed,  6 May 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058438; cv=none; b=g96zGKlKO+8z7N55DTK/yKtMCC83WcmMUYbXqN1fIcH9un+LPgrGzUmg8rlxb8XR4M7K2z76+1IzK78tDm1an7YuPsR4ZaEFDqVQqQYdjsLjLLrXCYarTTYaYJkxzfVAdVt90BtUM8NsLd4yPKbVPPy5z7g0gqpm/Ip6U6Hm0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058438; c=relaxed/simple;
	bh=Zc0YSgeQi3Xu2OmDuesox3uQhMleeKiM6hRzwSIBGNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOE5hv/Eyi41ch7XLtW/dc1jqy6RIMGdo/a9U5ll4hGnfltbTgRwhVgL5btyoWAgyu6D5WMC7R2OEyNqj3AdbqNTOhfgB3/wlS8DIArNVrpnxyzqHfWEO8LO6WiOwn/0F9lrvW67R0Ixvg1sLcuidfDdp3syilswgswVoMH19CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H7dHiUlk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A3E1A9A;
	Wed,  6 May 2026 02:07:10 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B1463F7B4;
	Wed,  6 May 2026 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778058436; bh=Zc0YSgeQi3Xu2OmDuesox3uQhMleeKiM6hRzwSIBGNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7dHiUlkBpg5qyf1/EBCrKzuTGLvjy5ZeSy9+aY/QsnroAUQp5J21lCIDA2v/Pkt1
	 HJzasdeYp7tVYr3X7w4tzNYHMeQUDEXZXHs1N2YhCxKLIQkqIK90wqW9VmSRCYcDQG
	 68UA96YVVyLM03oo3v7U/DkzQtdve9qm8JcYiv0g=
Date: Wed, 6 May 2026 10:07:03 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] Documentation: maple_tree: Point out constraint when
 using xa_{mk, to}_value
Message-ID: <5pw2rphajsj2xgjwhkbkjfv2njwz6bimyjxckdnytwfxkibinn@ev5eisyjtbha>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-2-weilin.chang@arm.com>
 <afkCZkHcn58S3GLD@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afkCZkHcn58S3GLD@casper.infradead.org>
X-Rspamd-Queue-Id: 011F84D865A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kvack.org,vger.kernel.org,oracle.com,google.com,gmail.com,lwn.net,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-86028-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[weilin.chang@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim]

On Mon, May 04, 2026 at 09:32:38PM +0100, Matthew Wilcox wrote:
> On Mon, May 04, 2026 at 05:57:45PM +0100, Wei-Lin Chang wrote:
> > Using xa_{mk, to}_value when storing values loses the information of
> > the top bit from the left shift, point that out in the doc.
> 
> I don't know if that's necessary ... it's obvious when looking at the
> function:
> 
> static inline void *xa_mk_value(unsigned long v)
> {
>         WARN_ON((long)v < 0);
>         return (void *)((v << 1) | 1);
> }
> 
> and if you ignore it, you'll find out.  But if this needs to be
> documented anywhere, it's in the kernel-doc for xa_mk_value()
> and not in the maple tree docs.

Yeah this makes sense, thanks for having a look.

Thanks,
Wei-Lin Chang

