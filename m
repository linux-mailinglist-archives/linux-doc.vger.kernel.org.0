Return-Path: <linux-doc+bounces-94179-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MY9ALGLZQ2qekAoAu9opvQ
	(envelope-from <linux-doc+bounces-94179-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:57:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D76E5A51
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:57:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mKqN86No;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94179-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94179-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FFAC301FF2E
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0044743C06F;
	Tue, 30 Jun 2026 14:57:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D12609FD;
	Tue, 30 Jun 2026 14:57:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831453; cv=none; b=sGSvzPQeAQyT+qvZVs8zU+mQkCZKKXpoIpymnobhE6setlfhxbL6kA+wxDDkffGqh0t4TFimgpxjkcuCoE0WpO5xDRtQd4K7JcLU53m7rQfL8DzLJcDU59ZDh9ZUQAnnWAicrXhRZZf4ATyzg7mbb/3krURnr+++jpY1ZG8OHi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831453; c=relaxed/simple;
	bh=wCS3CGlTAPFqjpzIeJR1CFEGc4FBDpqHNkDW/1nY3eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESt4s5RW05eZoBj/9cjnXc0nU888CPwh+HNakVPf+HVlfN354DKN2vjjrK1DJQOH64FMIhgqXaEkqE24dj6X5ddRizaVEINyavHJFgdITxv8dgTbYbt+I3Pw5SfXEaugJqd6P6cLP3vwj73KoL3xIqsS1wymsQkrEfunAKUGUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKqN86No; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35631F000E9;
	Tue, 30 Jun 2026 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831452;
	bh=Rt/iGbOFCZMV9bCDf5rxqRe3XsLLEE61YR1XtIhNQok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mKqN86NodSgPmPa0daU/LTKKagv0DcFCeGMhS6MgVwObdnzmatyb5UisR30Aa67Xk
	 UF8Yikd4V0jvra1ltipSVud//K1T/IbdgT0XbO+HgUp9mX4tyeXS3/nNd0FXWYurSb
	 GeFtNYI1dABj6rRvj/tn6uBv7VbcA+YNI+vCD04myI1Sg6Svkd0+P2ENuvY//ghV1i
	 0uW5zDuVnefztjVi8KSuS5DqaDXi1RgNx+np4UHs+Lcj4U/Rl1ywlHHxoKE+EnF5/d
	 HyQ1jyi3BzKD6JnuwYd9olgGQdLoHVj/hjNNwDE1tSYfGEocOE4Vgnc4fNc/dJMZAB
	 LHuQYbCiN4W6A==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/11] mm/damon: update, optimize, and clean up doc, tests, and code
Date: Tue, 30 Jun 2026 07:57:24 -0700
Message-ID: <20260630145724.93141-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630141726.92246-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94179-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:brendan.higgins@linux.dev,m:davidgow@davidgow.net,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 433D76E5A51

On Tue, 30 Jun 2026 07:17:14 -0700 SJ Park <sj@kernel.org> wrote:

> Patches 1 and 2 update the design and ABI documents for recently added
> DAMON features.  Patches 3-7 add or update more unit and self tests for
> DAMON to cover recently changed or added functions and sysfs files.
> Patch 8 optimizes damon_commit_target_regions() to skip unnecessary
> adjacent ranges setup.  Patches 9-11 clean and fix up recently added
> DAMON sysfs interface code for readability.

Sashiko found a few things that could be good future works, but none of those
is a blocker of this series, in my opinion.  Please read the full thread [1] in
lore.kernel.org if you want more details of Sashiko findings and my replies.

[1] https://lore.kernel.org/20260630141726.92246-1-sj@kernel.org


THanks,
SJ

[...]

