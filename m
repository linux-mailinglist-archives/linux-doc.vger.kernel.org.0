Return-Path: <linux-doc+bounces-87823-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P4oBF6gXCGoPZAMAu9opvQ
	(envelope-from <linux-doc+bounces-87823-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 09:07:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0155A8E7
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 09:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3206C3013D61
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 07:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0BA37DE83;
	Sat, 16 May 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="OYB6ySIp"
X-Original-To: linux-doc@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster6-host7-snip4-8.eps.apple.com [57.103.76.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F6239562
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915236; cv=none; b=Mf3+PblJKUYTmNEEZvyLoefjTdB5T1VtG+CZQeyj9gyXHIeqzVa6mY+eoD33pCuQ002GvzyV/Dt0lOOQd52Sqy1SdJ4Dopqqz+MJkVf2OZBVWfoX0cSmniJOUbrapeh+edyZ7IArceTmOZNv3uNH+yCp2TKCjuS+PaDp2O7o9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915236; c=relaxed/simple;
	bh=73insC5T0AeVlaEyZnP8POsvpSIMoEvhr0e71OpkB+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=su6uKfrWTBXW4oD/Q0AM5GzR5gqWvZtLtpVhOs/QH70LWhXQ9IaM4SHuXy60Z2dZW3gql7hO4mql+OhQQAcRv5Hgaxe5X/wIIBBvzsLRfF0YMMeuP1kwHJ1yyvgZiXxPEXRJuHaQcm8/fp/t1NpYpNZuiq0Pf9B6pURgAqrx9L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=OYB6ySIp; arc=none smtp.client-ip=57.103.76.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 5883C18005A4;
	Sat, 16 May 2026 07:07:12 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEG1sIUhhXE1gTVl8OXQIwUBtfAkIPHBNWFRMLU1ZRGFwdQAhUClkVC0EFXXcCURxWDVdDVARfUEsbDloXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BeCF4fTBwdDlgGEh1QHA5RBVsARglNAlsHXAJGDEgdVANeBl0IVVAFUg5BFVoZWAgFUgRAeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778915234; x=1781507234; bh=cnwn2KMhgJMjHIBc+zqe94/lk6fW6pUCJCcxgef4qAU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=OYB6ySIpevBN2FPgI4FNm/pqcrRG1/47F6OCi0ZvA1eARkZsdLQ3jZlKJUKqay09xUqbLK24eo8RC/FHsRPDn7FzcHXwlcsnGxv4UQPzm0qiWtNl4dsVL8I2stosaIP8HKWerLgibASH7m+p3DqlSOxVryzvQIrhmTtX8u/y7QNU/62Fy1SZSKJFqbkamMHf6gcody3ivoOn31G7BEM7R43Az71qp3tubUPth6/uo5QwhX6bRc2Qo3LC+/M6ZlXGrDfDj+gRqwVcnoORIx5fq5FExl2mdCkKVC/fVvcmmcisFKsp8OQVwmYqclaUxX7o0sBVHpSnZkx/FVSvs8HklA==
Received: from localhost.localdomain (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id E7E191800348;
	Sat, 16 May 2026 07:07:09 +0000 (UTC)
From: Cheesecake <cheesecake2960@icloud.com>
To: corbet@lwn.net
Cc: W_Armin@gmx.de,
	skhan@linuxfoundation.org,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheesecake <cheesecake2960@icloud.com>
Subject: [PATCH] docs: fix typo in uniwill-laptop.rst
Date: Sat, 16 May 2026 16:06:50 +0900
Message-ID: <20260516070650.9454-1-cheesecake2960@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _cxffX7dRJAOLSoIEQcndxFqpTPlQ2JO
X-Authority-Info-Out: v=2.4 cv=PfzyRyhd c=1 sm=1 tr=0 ts=6a0817a1
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=sIGCgqHK338A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=v3ZZPjhaAAAA:8
 a=qOMYXKSGN7icZ86_DFIA:9
X-Proofpoint-GUID: _cxffX7dRJAOLSoIEQcndxFqpTPlQ2JO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDA2OCBTYWx0ZWRfXxJR26vZ2KklV
 33j3lbos/6Iu955eVPvDOMeRjCO0rZrmtBIOXsl3kQJTPQPrP9ga8muep8i9/JxnqArSbyS/nOS
 dVKCVmxKU+6AJUIY88diwP1ka6USdIXmkABMXX5j5gyi23vFOrlsgpF/kHd6l2KWuPwtTelVY1H
 Avn0kmYTcSEWl9nwDYvNLwlHOqslsWosqcmzhTgdseGhzo8gEp2jIPEmqsOSxu6/rUQhZdcEr89
 wNfgxs2njGSR77a2CHr03gPS6wwgARr0yP3/Ff10LQHTN+RUw33Yc9i369Q6HpIwPR0yx2hauI9
 19XFeqRnh9lkK2TDqxp164kt/VRbLDIlK6yAvZihLFiXneBXlYzl50J1G0+2gY=
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=
X-Rspamd-Queue-Id: A5F0155A8E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,linuxfoundation.org,vger.kernel.org,icloud.com];
	TAGGED_FROM(0.00)[bounces-87823-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cheesecake2960@icloud.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[icloud.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:email,icloud.com:mid,icloud.com:dkim]
X-Rspamd-Action: no action

Replace "benifit" with "benefit".

Signed-off-by: Cheesecake <cheesecake2960@icloud.com>
---
 Documentation/wmi/devices/uniwill-laptop.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
index e246bf293..65583b239 100644
--- a/Documentation/wmi/devices/uniwill-laptop.rst
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -189,7 +189,7 @@ Indexed IO
 
 Indexed IO with IO ports with a granularity of a single byte can be performed using the ``RIOP``
 (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
-provide no benifit when compared to the native IO port access functions provided by the kernel.
+provide no benefit when compared to the native IO port access functions provided by the kernel.
 
 Special thanks go to github user `pobrn` which developed the
 `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
-- 
2.54.0


