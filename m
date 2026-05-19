Return-Path: <linux-doc+bounces-88317-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDZ/DgusC2omLAUAu9opvQ
	(envelope-from <linux-doc+bounces-88317-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 02:17:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1882575773
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 02:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF2EF3024975
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 00:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9827918DB01;
	Tue, 19 May 2026 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUjWG8Q9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB5188713;
	Tue, 19 May 2026 00:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149831; cv=none; b=VbnKn5QmTTXEBcx/Z+0btcgkO+6w3RfYB6N4ccKrjHuVY/Gn0+twvg++UkTrWfqaadCPad85c+G71dvz53WrI+kSivfJc8NAYhJT+UQfAproc9FhpTRrnzjXbHx1LpY4ppTVte4unxJmQfGWuKTiEJLWt+RurFTipBVNyo377YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149831; c=relaxed/simple;
	bh=mxj47XeUru82Pt8pJLXY53mHkRiq7hhv4CRlGK/7boc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEHFs8V5W5hBuceRmTH+WukvQJpG01FutjEvMXymVX0mIP/xHRLaV7ybi1bTxD2sRUDuZ26Arb0hqF3IqNZ6+6W5tBQ1/Yd/wj0nOfpOGZrOtBH1BDRzgEAwgXtIPSIwhpqJYQATXDa1IMp2wBZRDWTZlIf/OeA+d9981aQMjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUjWG8Q9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E85C2BCB7;
	Tue, 19 May 2026 00:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779149831;
	bh=mxj47XeUru82Pt8pJLXY53mHkRiq7hhv4CRlGK/7boc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUjWG8Q9IZC2UVyUGXZLtuyJapt1DpiayMo95tUuaJqADSEPmFRR6ncWdoX128Hrr
	 HdXVxjLRCd0ugRtu827ZGvGiFdI0BuhNYHvalrXtm1asqbysmPjS9/4GslKv9xRTwU
	 3/Z+qtMpBh9EeSrfMKoNX7+yzb8M9tcEwAdKkjEroTvTU3KpRF1x8/nN93rC9zjEHH
	 2o2czCRoJikBmL/UfCVe5ookbOUyjI9Pjt9w+lx/JPvzxofklUuogJwY3rvj7W9PVx
	 Z8bezuqzz/JkmZSX6Upinw8jKDI8Uv4gJvDeeUIA9X4kUyiL8IXkq+d8tsIIwklvLR
	 RFqJjt6MzqRVA==
From: SeongJae Park <sj@kernel.org>
To: Maksym Shcherba <mshcherba2000@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: Re: [PATCH 2/6] mm/damon/sysfs: implement update_schemes_quota_goals command
Date: Mon, 18 May 2026 17:17:02 -0700
Message-ID: <20260519001703.99264-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518190932.42270-2-maksym.shcherba@lnu.edu.ua>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88317-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C1882575773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 22:09:28 +0300 Maksym Shcherba <mshcherba2000@gmail.com> wrote:

> Add the logic to copy the current_value from the internal
> damos_quota_goal structure to the damos_sysfs_quota_goal sysfs structure.
> Introduce the DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS command
> and integrate it with the sysfs interface via the 'state' file.

Could you please further elaborate why you think this change is needed?  What
is the expected use case and benefit?

Seems the following patches of this series depend on this patch.  I will hold
review of more details in this and following patches until the above high level
question is answered.


Thanks,
SJ

[...]

