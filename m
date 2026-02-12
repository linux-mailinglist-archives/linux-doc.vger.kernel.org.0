Return-Path: <linux-doc+bounces-75888-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCZjL+1yjWn42gAAu9opvQ
	(envelope-from <linux-doc+bounces-75888-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 07:27:57 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D012AA33
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 07:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D151030BCF0C
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 06:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4634296BB6;
	Thu, 12 Feb 2026 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTrL55GO"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EEE28BAB9;
	Thu, 12 Feb 2026 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770877674; cv=none; b=ay0TcfaMbqGuxzVU093GQyKMAI9XiPRJatlH2IgfMkxrfwVPrHVO5waHEh9vihSEugIw2T8HQPoUHF5JESHB7eFeaQcxm8kDOiF+JaRB9kxe4UMBKB6KwQYizL4mx/QzASmcX2km8xxXj70r9StYzHJkLctBXhzf639ot7sKe0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770877674; c=relaxed/simple;
	bh=xRTSeaOTTgMyO66UkzQ4P/Can2kfHXf/45m+O2x5X48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHO8kKOkIoq+5tzWLyrOiemicE2SIfmrpTHDcxyDpud+aXHgA1xXmcKgqbviXVWELRQYML2PLiQyJ8Ak5sDROxYubVkFBE2V8DNZzJKRIa4OmN3CyXHiF5rsT2oTdoYEHfvRDP3NisBwp5H1xooyCdp/T6G400+8tz30Bm/7atM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTrL55GO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7D1C4CEF7;
	Thu, 12 Feb 2026 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770877674;
	bh=xRTSeaOTTgMyO66UkzQ4P/Can2kfHXf/45m+O2x5X48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTrL55GOA6WSIMk2LGZGpq/envakKOJR8mq6Jzjt0WuoU3AZQTCa3ORPRNdhsn248
	 0ad8cHGlfx/I//RAd7PemtOcW/kffXjKkGbrGgmgIANhWMfvE06q9/69s2xU6AXi6R
	 xxcKW1/GRQ37wsabZkLpbBCNk8mmOCVpnGuWvvIAgjvqpxVVm8l5RB6S/uZZ5wzQYx
	 nV2zlQ5T5GNGFKDMvTJBBN81UFAmKsxQE9JHGVTFvN6exgAhvbxwYlLyAdPWqsleQf
	 rSRo3Q9OFX5Y8s5pXxzInZYyip1fBaoFxhP7UELoSdUaiGeWuUSh2P5+yXTpxlpEOc
	 fDeyilgDKIhgQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	Honggyu Kim <honggyu.kim@sk.com>,
	Yunjeong Mun <yunjeong.mun@sk.com>
Subject: Re: [RFC PATCH 0/5] mm/damon: Add node_sys_bp quota goal metric for PA-based migration control
Date: Wed, 11 Feb 2026 22:27:49 -0800
Message-ID: <20260212062750.70451-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128012539.72119-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75888-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,micron.com,sk.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 521D012AA33
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 17:25:37 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Tue, 27 Jan 2026 10:52:53 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> 
[...]
> > An immediate-stop feature could still be useful for the broader community.
> 
> Thank you for the feedback.  I will take more time on thinking about how to
> implement this.

I just posted an RFC patch series for this:
https://lore.kernel.org/20260212062314.69961-1-sj@kernel.org


Thanks,
SJ

[...]

