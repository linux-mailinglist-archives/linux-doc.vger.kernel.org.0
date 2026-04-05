Return-Path: <linux-doc+bounces-82498-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKK8FmC50mlEaAcAu9opvQ
	(envelope-from <linux-doc+bounces-82498-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 21:34:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3639F783
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 21:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 544B430022D2
	for <lists+linux-doc@lfdr.de>; Sun,  5 Apr 2026 19:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B68831F9AA;
	Sun,  5 Apr 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVCFfRMq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC48322527;
	Sun,  5 Apr 2026 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417690; cv=none; b=GZZrSGhkysSFFb51VkmS6jI++02sjM+BHCb4rSA1JpYvSE66Z5DHgjUnfarvhhB1qDmM4wh6GDzZMu/WlkQIoa9Y/y6iIpVWgmQS1u/YW0AM10q/4K9MbrCtQ83CkRXZz+2CajSyqtA/2mYU+x8yoqKwrVnIsacLO93cpgKC+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417690; c=relaxed/simple;
	bh=/fECXG9ZqJc3oNxKEN0/I4QGArOiiZWi2ZzFXVLlCxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJ4T5hEUBx9g/yn29/BAO73HEQQdiivXx9+TXDhV/s1B9w8N1S2Z5VjT9PMqT+eJwmrFGZ+Hnwwg+hrkHClgXmRcVMjiO/T4aPcdoWOsJSkWCvipx/onWf1pLS0lCKkwTVXwDdfizZVwI1iqU8yZqTUVZv7LT437EMUVHvCb270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVCFfRMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A251C116C6;
	Sun,  5 Apr 2026 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775417689;
	bh=/fECXG9ZqJc3oNxKEN0/I4QGArOiiZWi2ZzFXVLlCxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVCFfRMqh+BmLtZVTBRUNQ4utPUU/7ZQhftpX/nZWdxjrENl275FkHIY8afZ7rWK6
	 93k2TTtiKOokm9nHGy3GlvFW7lCjMxjhaHAyOXITgKYBS3ie40n9g8Dis7CaysFIKP
	 rMhtJWDsc2Hwm08Gaf0YYwjJuUmqpHqRvGT3fHU1+T+0CboLLswbTIiJ6ahqNPz+d0
	 8mGnYjNW/WuYvmxYrR716spSN/YBciK2341Bc4hgRVDGLrGEIGUWk+WjAL9gBaxJv5
	 LJ8ufGFZ9tivD7H8j/SYo42pjqY3HeWk96QYY0cA5oGEJjz0uTOyNw4M9hfwJ6yn54
	 wDfWJgsymaHJQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: (sashiko review) [RFC PATCH v2 3/9] Docs/mm/damon/design: document fail_charge_{num,denom}
Date: Sun,  5 Apr 2026 12:34:41 -0700
Message-ID: <20260405193441.110298-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405151232.102690-4-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82498-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEB3639F783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

TL; DR: sashiko gave me a sounds-good suggestion.  I will make a change on the
next revision of this patch.

Forwarding full sashiko review in a reply format with my inline
comments below, for sharing details of my view and doing
followup discussions via mails if needed.

> # review url: https://sashiko.dev/#/patchset/20260405151232.102690-4-sj@kernel.org
> # start of sashiko.dev inline review
> commit c4d090b9bc99178548ec06da52d6f75e0b392a34
> Author: SeongJae Park <sj@kernel.org>
> 
> Docs/mm/damon/design: document fail_charge_{num,denom}
> 
> Update the DAMON design document to describe the new fail_charge_num and
> fail_charge_denom parameters. These parameters configure the DAMOS action
> failed region quota charge ratio.
> 
> > diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> > index afc7d52bda2f7..8a8b04b5e8537 100644
> > --- a/Documentation/mm/damon/design.rst
> > +++ b/Documentation/mm/damon/design.rst
> > @@ -565,6 +565,27 @@ interface <sysfs_interface>`, refer to :ref:`weights <sysfs_quotas>` part of
> >  the documentation.
> >  
> >  
> > +.. _damon_design_damos_quotas_failed_memory_charging_ratio:
> > +
> > +Action-failed Memory Charging Ratio
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +DAMOS action to a given region can fail for some subsets of the memory of the
> > +region.  For example, if the action is ``pageout`` and the region has some
> > +unreclaimable pages, applying the action to the pages will fail.  The amount of
> > +system resource that is taken for such failed action applications is usually
> > +different from that for successful action applications.  For such cases, users
> > +can set different charging ratio for such failed memory.  The ratio can be
> > +specified using ``fail_charge_num`` and ``fail_charge_denom`` parameters.  The
> > +two parameters represent the numerator and denominator of the ratio.
> 
> Should this documentation include the fallback and default behavior when
> fail_charge_denom is set to 0?
> 
> Looking at the core kernel implementation in
> mm/damon/core.c:damos_charge_quota(), the code checks for
> !quota->fail_charge_denom and falls back to charging the entire region size to
> avoid a division-by-zero error.
> 
> Additionally, since struct damon_sysfs_quotas is allocated using kzalloc(),
> fail_charge_denom is 0 by default. Would it be helpful to explain this default
> 0 state and the resulting fallback behavior here?

Good suggestion, I will add that.

> 
> > +
> > +For example, let's suppose a DAMOS action is applied to a region of 1,000 MiB
> > +size.  The action is successfully applied to only 700 MiB of the region.
> > +``fail_charge_num`` and ``fail_charge_denom`` are set to ``1`` and ``1024``,
> > +respectively.  Then only 700 MiB and 300 KiB of size (``700 MiB + 300 MiB * 1 /
> > +1024``) will be charged.
> > +
> 
> [ ... ]
> 
> 
> # end of sashiko.dev inline review
> # review url: https://sashiko.dev/#/patchset/20260405151232.102690-4-sj@kernel.org


Thanks,
SJ

# hkml [1] generated a draft of this mail.  You can regenerate
# this using below command:
#
#     hkml patch sashiko_dev --for_forwarding \
#             20260405151232.102690-4-sj@kernel.org
#
# [1] https://github.com/sjp38/hackermail

