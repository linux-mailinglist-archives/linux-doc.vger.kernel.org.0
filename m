Return-Path: <linux-doc+bounces-96950-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZojFsefV2pnYAAAu9opvQ
	(envelope-from <linux-doc+bounces-96950-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 16:57:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D875FAA0
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 16:57:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=VzVlT6Lu;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96950-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96950-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 809DF301C2F4
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 14:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BD147CC96;
	Wed, 15 Jul 2026 14:54:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388513F4100
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 14:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127269; cv=none; b=Mt4+SiXG52hPmQ7ExOPnmo/wMQxq3+RnmdUyF7B0Mc4F8lqGTDBvBrpmsNCkrZjcdjmMJFj12R/IWgPqqKghK36KNUMczYuIfGDmvfBcGZHat9DI8SnXnGnM+xzrhjTsLb5l/BFFAeOt8MpA3QriQc4KmwQO/H/dS/N8u6fN1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127269; c=relaxed/simple;
	bh=R+l0BoEIULdGpPMTKiBinIBNKvPrlGhKO6LL/ImEs7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqGYsvhmUvimQHrdcuh6izhmd7h0BC0JW6MRNStcP2jKsKaNNbJmlMUEufYU9AowNgyQ/F/J9KuLr/yLw3vmSWwyoiiKaM/EtF6P3h+II6K3+H4Wl/DcrmwO8Liv5rzI8r7NO7/aL7LjsQvcugkAM4EXeQcMlNNn8a9FiY9rIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VzVlT6Lu; arc=none smtp.client-ip=91.218.175.180
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784127253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jOShTpG1lf1o8AyRmdTFIb3iL+dIT2emRuFOvlyVsDs=;
	b=VzVlT6Lu2OjZRRsil4JjB9tukxpjUfkgyxgjqjyPj44/SFXsG+C/D4NZW6so6DBI1mf01u
	yYFF6IhC5NJe9BUo8yO3xJnlKvGZ24WfpBHJcGbWk2XHS+H3GVeOtdGep8rDNyTqZagKaL
	hbXDKUSTjocfTUK+pONAw5eCiyVVnmo=
From: Leon Hwang <leon.hwang@linux.dev>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ij@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Lance Yang <lance.yang@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 0/2] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
Date: Wed, 15 Jul 2026 22:53:25 +0800
Message-ID: <20260715145328.54597-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nvidia.com,linux.dev,nokia-bell-labs.com,gmail.com,icloud.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96950-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ncardwell@google.com,m:kuniyu@google.com,m:idosch@nvidia.com,m:ij@kernel.org,m:leon.hwang@linux.dev,m:chia-yu.chang@nokia-bell-labs.com,m:yuuchihsu@gmail.com,m:bronzed_45_vested@icloud.com,m:kerneljasonxing@gmail.com,m:lance.yang@linux.dev,m:jiayuan.chen@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,linux.dev:from_mime,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA1D875FAA0
X-Rspamd-Action: no action

Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
address an unreleased SKBs issue related to TCP sockets.

Issue:
When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
current implementation does not clear the socket's receive queue. This
causes SKBs in the queue to remain allocated until the socket is
explicitly closed by the application. As a consequence:

1. The page pool pages held by these SKBs are not released.
2. The associated page pool cannot be freed.

RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
CLOSE_WAIT state, "all segment queues should be flushed." However, the
current implementation does not flush the receive queue.

Solution:
Add a per-namespace sysctl (net.ipv4.tcp_purge_receive_queue) that,
when enabled, causes the kernel to purge the receive queue when a RST
packet is received in CLOSE_WAIT state. This allows immediate release
of SKBs and their associated memory resources.

The feature is disabled by default to maintain backward compatibility
with existing behavior.

Note: the user-space issue, the root cause of the unreleased SKBs, has
been fixed by https://github.com/IBM/sarama/pull/3384.

Changes:
v1 -> v2:
* Update 'tp->copied_seq', 'tp->urg_data', and 'sk->sk_peek_off' like
  'tcp_disconnect()'.
* Drop "memory leak" words in commit msg. (per Eric)
* Add two packetdrill tests. (per Eric)
* v1: https://lore.kernel.org/netdev/20260225074633.149590-1-leon.huangfu@shopee.com/

Leon Hwang (2):
  tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
  selftests/net: packetdrill: Add two tcp_purge_receive_queue tests

 Documentation/networking/ip-sysctl.rst        | 18 ++++++++
 .../net_cachelines/netns_ipv4_sysctl.rst      |  1 +
 include/net/netns/ipv4.h                      |  1 +
 net/ipv4/sysctl_net_ipv4.c                    |  9 ++++
 net/ipv4/tcp_input.c                          | 22 ++++++++++
 .../tcp_purge_receive_queue_disabled.pkt      | 40 ++++++++++++++++++
 .../tcp_purge_receive_queue_enabled.pkt       | 42 +++++++++++++++++++
 7 files changed, 133 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt

-- 
2.55.0


