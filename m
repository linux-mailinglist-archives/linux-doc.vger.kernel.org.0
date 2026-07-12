Return-Path: <linux-doc+bounces-96467-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZmUhK4KsU2pbdQMAu9opvQ
	(envelope-from <linux-doc+bounces-96467-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:02:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A3745140
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 17:02:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YLxzHDi2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96467-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96467-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B043032F44
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 15:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E303133B970;
	Sun, 12 Jul 2026 15:00:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2333A708;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868456; cv=none; b=fdEJz1hyV0olcJO64bl/vyjreEWoKDOLsPuqeJw6Nly+Ahrv16+Zomqi4OXy93vVK/iap/InXxAl3Caoqf7lyhDqo29x28PThqxx/X1NyyJpgUc5VlO8tPPlZ01mXo7g8Qj5tvtIY1yPeTB+F3A9xmX3iOcXKhUpexfm1zzgWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868456; c=relaxed/simple;
	bh=gey0uTPa+aj8w7FZkkxBOLbD+VZYX6x0DCUUqQvORZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ngFCSLzkkt7V/yTdPthLFlV9VWPzGCCRbKuCfUilLqCQkCmlB2LoMLJTILCl34gUcRSS36nNny84zsX2Lbs7Py+sM1irvfJaRDQVS7LMYaJ8ZoBgw8hqY2U56NyhhN8Yi2XpBGABB7IvI82tYHDU48XTViod9AXlC7ydkWuS3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLxzHDi2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6A51F000E9;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868454;
	bh=t/LFr3+Gj9o97JmZCl7mK4mXvU/1eyDTt45QrUC+hqY=;
	h=From:To:Cc:Subject:Date;
	b=YLxzHDi2t8ijUUtF7n3oVS2pbANjx6PIDRYNKTxGHES1wHkNz5d3lXbdZNBlXSA81
	 GoY5vAIHK983M6Qfhm/T59BjioeMDCUmIuCXudpMVE3WXSsdNNptFKEp8gemyRxIX4
	 gBq4prHN5oMHqGbDARo6kP9+qRgJrAeYDjn5bipHJjZWdRVueTkDQmpHasQJgMQFgt
	 LBiEKlCQ/cC/iIEMSdqYLDhYB/KISpyLuuxT8nVdUjy5sw9a3caapZ0Y5Ns6+8RVum
	 oujtQmrYzPa3VLklM2W6TPFTAfibCIYDSKT+fBmCJcQ3N/yXCmixlIrf1lXcf9gq1/
	 3KqpnbLlXKf5g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wivfo-00000003j0u-35Ho;
	Sun, 12 Jul 2026 17:00:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 0/2] A couple of fixes for maintainers_include.py
Date: Sun, 12 Jul 2026 16:59:38 +0200
Message-ID: <cover.1783868309.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96467-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:mchehab@kernel.org,m:mchehab+huawei@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 226A3745140

Hi Jon,

It follows a couple fixes for maintainers_include when generating
maintainer's profile entries.

Regards,
Mauro

Mauro Carvalho Chehab (2):
  docs: maintainers_include: don't output duplicated profile entries
  docs: maintainers_include.py: output subsystem name if available

 Documentation/sphinx/maintainers_include.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.55.0


