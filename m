Return-Path: <linux-doc+bounces-86569-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPcNO4h2/mkWrQAAu9opvQ
	(envelope-from <linux-doc+bounces-86569-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 01:49:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C24FCE40
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 01:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D304301F9C9
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 23:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD633630A7;
	Fri,  8 May 2026 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LWZd135X"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B639F9D9;
	Fri,  8 May 2026 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284166; cv=none; b=bSP87b4lCYXE9XqiQUpIaqDYTyUlE1FUSEDv24hFUPHRLfBe91UhzpeFr992kC5YofnoZlXJaVsi/f07SmmQuRj2jrps9hRgxUzPVkPfmPVuUf07cNpG/K1Wp/4lPurHZhTNpm4aeLcBNBMXhn2bknsoHOnRixGgYhZiQpD8e6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284166; c=relaxed/simple;
	bh=YKhq8YGrlFIH1geXnhTe1skjB8oYVKcRGftTy+NP8L4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dYvsvPloUkhHXuvu/9LSzeQV4UBNWIAEVhvvESDoVAVsNLFn36HClHPCK64pOWlK345+yxzgAdUfZ2ge720BoWY2LJtREV5nbmStOR3RfRfNyUUl6LFWb575BEI48cfnUx+1FCdmXf0CMfeGPHkaqSRACb4fDb0jUqsSCJ6gwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LWZd135X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5993C2BCB0;
	Fri,  8 May 2026 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778284166;
	bh=YKhq8YGrlFIH1geXnhTe1skjB8oYVKcRGftTy+NP8L4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LWZd135Xea4AAPbLnha0JSwfadnRy4XvPlCmeuwvvIKjrf0e6kkC2TEWO8ffIEUhJ
	 jtMbqzNASCd3jzJH91EXnYSj7OXh8krRwMxZmRsJirXFfjiAKr0seZizVh40bawMxw
	 XyGhiqA2G/0Bj3TnSguZ3Krz3QMT2DfGuNkacySU=
Date: Fri, 8 May 2026 16:49:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-Id: <20260508164925.20e09fba0277f0bc8ffc9a3d@linux-foundation.org>
In-Reply-To: <af5Z2IvtS5pVorSl@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
	<20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
	<af5Z2IvtS5pVorSl@laps>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 745C24FCE40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86569-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, 8 May 2026 17:47:04 -0400 Sasha Levin <sashal@kernel.org> wrote:

> >> 19 files changed, 1451 insertions(+), 1 deletion(-)
> >
> >wowzers.  I'm looking at samples/livepatch/livepatch-sample.c wondering
> >"why"?
> 
> Yup, a bit chunky, but over half of it is documentation and testing, and the
> actual functional code is largely the securityfs interface.

So we can't use livepatch here?

