Return-Path: <linux-doc+bounces-88697-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JMdMOsZUDmrl9wUAu9opvQ
	(envelope-from <linux-doc+bounces-88697-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 02:41:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326B59D5CA
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 02:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 821AA302C6F7
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 00:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D499225FA29;
	Thu, 21 May 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga2OTG2r"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3D20299B;
	Thu, 21 May 2026 00:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323795; cv=none; b=O0WJk8OwYPPWVJy1i1eXiqwUcBcSlRwcmeMJRTH9I9bvKc1iNU3yKZ3WuxFlbDMPqg9SOnR57jPefrvpQDjCpm159g95yq/mQQTwMRXuxUZXBnE0Ta8TEqRPp2SOCfjE8xwbTxcwg5cqTGiDdEKZ76501L9O186h+uMS26KuNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323795; c=relaxed/simple;
	bh=GQbUav63hwMhI0xVHdqZmXSSmN3FmuzYDpsanY4V+Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSgC5w6kg7JNnvxotGUl78Xx/gZ0QIEt4A0cs43tuWhc/qaYrykvAMGYE1yrIhMYTykjxCpklMqnGfuM+nd3cEc5bGmuZvHD/qFz84E7YFpVY8g40XEjfjttQyzMXvfM02wS11QamRTw04LFzpYp9AhKiihoK5sirN7AveSbYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga2OTG2r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F91F000E9;
	Thu, 21 May 2026 00:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779323792;
	bh=FtVPml42S6/vWtnPxk8KNVWBhpuWSECUt44EvPJpKtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ga2OTG2r4BlEhHPm9VSy9erfp6P7UHoEFYKvlUwXpBSAu6g7jcVwFlHlvn7FCujRo
	 rjPDV6t19Vpa8Q5qXljpD92PB8tLHQwrX2rUDtjslsxB1MND9UuFpDVTq7yDHHpq9J
	 xKGGYS0aawEjFOBfyX+dIDktOB3yZQiFTPoHQqZhMck+qo0HeLJY8vaMy0NOtqS/Xs
	 MbFZklaXmH7ilEN4NJ/wq18TZzCKaXCS+jCV8GBobGSCe3HE+it+w1/NPvgsAJymUW
	 Ah1D9tZgW0wwMZgz7N5738SaSuJGJJFKG7ThWbLjddNBf+pAgnCP3Xqk+HUBUWLkIC
	 0bixCEiezzLZg==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH 3/5] mm/damon/core: floor effective quota size at minimum region size
Date: Wed, 20 May 2026 17:36:23 -0700
Message-ID: <20260521003624.84471-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALa+Y14AKLXSP8HhOMQomXczok-BS7aderfj_tYG9qdS9bKgvg@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88697-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4326B59D5CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 11:37:50 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On Sun, May 17, 2026 at 11:47 AM SeongJae Park <sj@kernel.org> wrote:
> >
> > On Sat, 16 May 2026 14:03:55 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
[...]
> Dropping patches 1 and 3.

No worry, thank you for clarifying the all details!

> 
> Patches 2, 4, and 5 are independent of this scaffolding; I'll
> reply on each thread separately with the relevant context.

Sure, let's keep the discussion go on :)

> 
> Thanks again for the careful review.

Thank you for sharing patches!


Thanks,
SJ

[...[

