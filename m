Return-Path: <linux-doc+bounces-95345-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XWCXHvDTTGrFqQEAu9opvQ
	(envelope-from <linux-doc+bounces-95345-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:24:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216871A53E
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:24:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="n5/pMC7x";
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95345-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95345-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C622306F11D
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 10:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE6E3E1221;
	Tue,  7 Jul 2026 10:22:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC213E2AD8
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 10:22:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419746; cv=none; b=VJgTwGin6SSk8mnn1HccuwaZOhkLLEEiDHfnFbIROLhwU9jEIrV9n9/zuk6YhezvcLGWdItwdTtoU2msC9K7IQNE3vyZGMhJjmiq3pF7mVateHmE1mgQBEanqGV2sMPYNIyhkPPPm9Hrr9jw9H+1pSr2h5/+kIx/NZH97g3HmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419746; c=relaxed/simple;
	bh=N3mlkE+V8OacYwpttMQ2zP/Vz4zdha1L7zeYJjcI1Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DB2VKcMK06bjHZa+lWtJFU9U7LyYk0wqUFNzLFnRGi540Rzq8kbUSWOKGUM0x/sJ8Gh1PwJqs/fusMPfIZwXLVfGSbqP25lMixUwHPz4CFN6lPslKdEPgMp+rFwX2tlyqo5wyfJtUukJiTNMwpTuaw2l15mUir6AhQhDQQ/A/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n5/pMC7x; arc=none smtp.client-ip=95.215.58.181
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783419732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eWcDQnYOYYrvM2ZYBY8bvALrAF2J5/f2P4vYcNggq1c=;
	b=n5/pMC7xiQirBMKCLQ5d5nmVfVzXRJFumz1+KMOioOerExgZhdvJ3fDoVB1ldAp8Md5NGi
	Q3kyRsrA/UbBjKtAbKn6TN+u6mwDhx2b+ekZGCPRx64pRkaJ8J60EII34xp1i9eNGWbk59
	M0ifxb7j2AdjwwNtu2D+wLPiSOvWV3I=
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 0/3] Docs/admin-guide/cgroup: update controller interface docs
Date: Tue,  7 Jul 2026 18:21:45 +0800
Message-ID: <20260707102148.692250-1-guopeng.zhang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95345-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[guopeng.zhang@linux.dev,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:cgroups@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:guopeng.zhang@linux.dev,m:zhangguopeng@kylinos.cn,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guopeng.zhang@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:from_mime,linux.dev:dkim,linux.dev:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:email,rdma.events:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2216871A53E

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

Hi,

This small series updates cgroup controller documentation to match the
interfaces exposed by the current code.

Patch 1 drops a stale interface-file count from the misc controller
documentation.

Patch 2 documents the RDMA v1 interface files that are already exposed
by the controller and already documented for cgroup v2.

Patch 3 notes that the io.latency-specific depth, avg_lat and win
io.stat fields are only emitted when blkcg_debug_stats is enabled, and
qualifies the usage text that suggests using avg_lat to pick a latency
target.

Thanks,
Guopeng

Guopeng Zhang (3):
  Docs/admin-guide/cgroup-v2: drop stale misc interface file count
  Docs/admin-guide/cgroup-v1: document rdma.peak, rdma.events and
    rdma.events.local
  Docs/admin-guide/cgroup-v2: note blkcg_debug_stats gates io.latency
    stats

 Documentation/admin-guide/cgroup-v1/rdma.rst | 66 ++++++++++++++++++++
 Documentation/admin-guide/cgroup-v2.rst      | 16 +++--
 2 files changed, 76 insertions(+), 6 deletions(-)

-- 
2.43.0

