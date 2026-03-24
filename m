Return-Path: <linux-doc+bounces-80834-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PB7JyzcwWmJXQQAu9opvQ
	(envelope-from <linux-doc+bounces-80834-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 01:34:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731F2FFBB4
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 01:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1421F304EA8C
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 00:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B937C26ED45;
	Tue, 24 Mar 2026 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lff1/uUm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3830927C162;
	Tue, 24 Mar 2026 00:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312181; cv=none; b=R6ehG9lesYUfJz2cUpeaECAWTWiZ06rLpHgoc+7fbasQ9C8BSJ0JnvD+uaY+MjlnLtgA26Ev8Fue40l3tkExv2Y8aoZFwJB1IhR7jYosZ3CdfzsumPGeLWf5NJ/u5OvTj3mqSkLAK8sPZT2A7HDNGD4Fr1STRVezymxrcjXgd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312181; c=relaxed/simple;
	bh=84oF5StXlVFM1n0EH38q9LyOhne9+NiaW3HGzpjiGRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZrpc2pIlVQalLF5yiPAvvkXV5AxBxjUB+Bmrab8jB/S7brK0B10A8RRQfVYBrbuFUAqqTnegExvdUhC0CeHhdAE+pJtPDdU+mepy1heKqnlMYXuj+3bL6TFLgXFi5fP5UzchudW3YnbwPvK9nwmGOXJGGQdyDo/+QA4cKXdqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lff1/uUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC1DC4CEF7;
	Tue, 24 Mar 2026 00:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312180;
	bh=84oF5StXlVFM1n0EH38q9LyOhne9+NiaW3HGzpjiGRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lff1/uUmxbVvOZ9EJJ+4R89lBZdIrsToD8UvgKOAnB6ajDrqzszez4G+SFVcJ4V8M
	 5Yw3fOb7PsbHI2QqRTVb+IN5qoORgfqZmlYw8o9oko/5A+W+x3Jx6hJlV86HG2b6Af
	 n/OZgE42YkjRq88gbmAnTD5iib5OtKZ8VNtxJdR+TJL6W8PkZ2tDAl1i5qy2JC7pV/
	 eITXzooZcjeIrDn6H3NGF3gdSLT1xVO9WkoGNRNkoSBvNGS7rRM55AlfndhHL3N/1U
	 cxsg/zcZVd8lLWgvAowQ9MyXr2ctDeNOcPLYt/8ljBMHP/v2hWj15OCw0DZ0ja3zX6
	 KRLlp1KCfxQcA==
From: SeongJae Park <sj@kernel.org>
To: gutierrez.asier@huawei-partners.com
Cc: SeongJae Park <sj@kernel.org>,
	artem.kuzin@huawei.com,
	stepanov.anatoly@huawei.com,
	wangkefeng.wang@huawei.com,
	yanquanmin1@huawei.com,
	zuoze1@huawei.com,
	damon@lists.linux.dev,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: (sashiko review) [RFC PATCH v2 1/1] mm/damon: support MADV_COLLAPSE via DAMOS_COLLAPSE scheme action
Date: Mon, 23 Mar 2026 17:29:36 -0700
Message-ID: <20260324002936.86653-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323145646.4165053-2-gutierrez.asier@huawei-partners.com>
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
	TAGGED_FROM(0.00)[bounces-80834-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Rspamd-Queue-Id: 0731F2FFBB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Forwarding Sashiko review for doing discussions via mails.

# review url: https://sashiko.dev/#/patchset/20260323145646.4165053-2-gutierrez.asier@huawei-partners.com
# start of sashiko.dev inline review
commit eaed291e6fae91842b1836c68bab867d53525db5
Author: Asier Gutierrez <gutierrez.asier@huawei-partners.com>

mm/damon: support MADV_COLLAPSE via DAMOS_COLLAPSE scheme action

This commit introduces a new DAMON action, DAMOS_COLLAPSE. It allows
DAMON to synchronously collapse an address range by calling madvise
with MADV_COLLAPSE.

Link: https://lore.kernel.org/damon/20260313000816.79933-1-sj@kernel.org/

[ ... ]
> diff --git a/tools/testing/selftests/damon/sysfs.py b/tools/testing/selftests/damon/sysfs.py
> index 3aa5c91548a5..c6476e63f4fb 100755
> --- a/tools/testing/selftests/damon/sysfs.py
> +++ b/tools/testing/selftests/damon/sysfs.py
> @@ -123,11 +123,12 @@ def assert_scheme_committed(scheme, dump):
>              'pageout': 2,
>              'hugepage': 3,
>              'nohugeapge': 4,
> -            'lru_prio': 5,
> -            'lru_deprio': 6,
> -            'migrate_hot': 7,
> -            'migrate_cold': 8,
> -            'stat': 9,
> +            'collapse': 5
> +            'lru_prio': 6,

Will this cause a Python syntax error when executing the selftest? It looks
like there is a missing comma after 'collapse': 5, which might break the
execution of the DAMON sysfs test suite.


# end of sashiko.dev inline review
# review url: https://sashiko.dev/#/patchset/20260323145646.4165053-2-gutierrez.asier@huawei-partners.com
#
# hkml [1] generated a draft of this mail.  It can be regenerated
# using below command:
#
#     hkml patch sashiko_dev --for_forwarding \
#             20260323145646.4165053-2-gutierrez.asier@huawei-partners.com
#
# [1] https://github.com/sjp38/hackermail

Sent using hkml (https://github.com/sjp38/hackermail)

