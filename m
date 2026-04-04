Return-Path: <linux-doc+bounces-82474-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK8sIyh80WkjKQcAu9opvQ
	(envelope-from <linux-doc+bounces-82474-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 04 Apr 2026 23:01:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1F39C74B
	for <lists+linux-doc@lfdr.de>; Sat, 04 Apr 2026 23:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C819300D143
	for <lists+linux-doc@lfdr.de>; Sat,  4 Apr 2026 21:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD0025A2C6;
	Sat,  4 Apr 2026 21:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djJY5HVr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F1137923;
	Sat,  4 Apr 2026 21:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336485; cv=none; b=Nly9xJzMxIy5UJ/b8iISLDimfeQA4FuKg5vXnn+VCoNSBe8W2BfHOyxwnmX9HpHOqx+yLy0naeayrzgtxzTZstW7mUXZOpZEnfipkSp7TgPOK8fIbQzpW8vKKuSQ2S5M5K+YUcy8fodWe4kEbR1tiujJ7YDfqZLdBWrwesif9gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336485; c=relaxed/simple;
	bh=BE7WCOjZCyh3D0O3nA0Pw0gvP5pQ6dq1vt184ZQYo8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXb60D6KLegFY5lQn8rIWbaQh5Rzx75975UAdXhg3fizj6NG1aRBLdWr2JFkvhHHsE8ikvDxQrvrqSjh7y70iFcPfy1ABEqWuRfFDAMsz9PztqwitjKaOatJruM+lc6MN2wHKU+WRu6/8LwRNCOze6zPabxWBISENsHKmBvl8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djJY5HVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E307CC19421;
	Sat,  4 Apr 2026 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775336485;
	bh=BE7WCOjZCyh3D0O3nA0Pw0gvP5pQ6dq1vt184ZQYo8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djJY5HVr7Z5Iz/LPL7rFSferVpA/SvHCZN3DD9pCOxHKKFnUgEkj5z7wcMMCuwWFD
	 FVXmBVGBZ/EqUaUzmBTPu0PmmJhyFodz9TMjVeHj2uLXL93WLFxNhx4LFUCm2nTWfB
	 c/XyfM+qqIG7nbG7sCEO4LZVrebBrjpXHR5jJoBRPJn4CDEp1aNggi7zhilMvECetD
	 R/YfQKXHTXGTIErUNqvttWPacVb83Q+0hAygiOof20RiEXXM8CXsHpAVl/1jHryAyi
	 3Ki9lTMMFUJ1YjKE6+hRn3P/tCTvACkCwAvp4TNCazoTqiTJ9Pm0pOgpkKdZzrrY4U
	 to08EN6ITZUhg==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: (sashiko review) [RFC PATCH 4/9] Docs/admin-guide/mm/damon/usage: document fail_charge_{num,denom} files
Date: Sat,  4 Apr 2026 14:01:15 -0700
Message-ID: <20260404210116.87508-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260404163943.89278-5-sj@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82474-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8E1F39C74B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dropped individual recipients from Cc list, to reduce unnecessary traffic.

TL; DR: sashiko found real issues.  I will fix those in the next revision.

Forwarding sashiko review in a reply format with my inline
comments below, for details of my view and doing discussions
via mails if needed.

> # review url: https://sashiko.dev/#/patchset/20260404163943.89278-5-sj@kernel.org
> # start of sashiko.dev inline review
> commit 5f8a4cfde3d93d0a4d4ac3d9a57f14f310c43e02
> Author: SeongJae Park <sj@kernel.org>
> 
> Docs/admin-guide/mm/damon/usage: document fail_charge_{num,denom} files
> 
> Update DAMON usage document for the DAMOS action failed regions quota charge
> ratio control sysfs files.
> 
> > diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
> > index 534e1199cf091..3d6af6ce72d82 100644
> > --- a/Documentation/admin-guide/mm/damon/usage.rst
> > +++ b/Documentation/admin-guide/mm/damon/usage.rst
> [ ... ]
> > @@ -398,6 +401,13 @@ the background design of the feature and the name of the selectable algorithms.
> >  Refer to :ref:`goals directory <sysfs_schemes_quota_goals>` for the goals
> >  setup.
> >  
> > +You can set the action-failed memory quota charging ratio by writing the
> > +numerator and the denominator for the ratio to ``fail_charge_num`` and
> > +`fail_charge_denom`` files, respectively.  Reading those file will return the
> 
> This isn't a bug, but fail_charge_denom has a single leading backtick and
> double trailing backticks.
> 
> Additionally, should "Reading those file" be "Reading those files"?

Good catch!  I will fix those in the next spin.


Thanks,
SJ

> 
> > +current set values.  Refer to :ref:`design
> > +<damon_design_damos_quotas_failed_memory_charging_ratio>` for more details of
> > +the ratio feature.
> > +
> >  The time quota is internally transformed to a size quota.  Between the
> 
> 
> # end of sashiko.dev inline review
> # review url: https://sashiko.dev/#/patchset/20260404163943.89278-5-sj@kernel.org

# hkml [1] generated a draft of this mail.  You can regenerate
# this using below command:
#
#     hkml patch sashiko_dev --for_forwarding \
#             20260404163943.89278-5-sj@kernel.org
#
# [1] https://github.com/sjp38/hackermail

