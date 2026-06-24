Return-Path: <linux-doc+bounces-93338-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j+3EEDo1O2rxSggAu9opvQ
	(envelope-from <linux-doc+bounces-93338-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 03:39:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CE6BAD03
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 03:39:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=agloJ5ob;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93338-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93338-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FBE7303BBA8
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 01:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CD6272816;
	Wed, 24 Jun 2026 01:38:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F74224B05
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 01:38:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265137; cv=none; b=EWPLHSMji8ETsJaex/IeobQfAjaN5CS2giUuAarXem1+eBuSOiz6P8TNBroGZT49BH9Aiui2KyXKS5cI/vXXhddVBc1Q4WI1HvEH2ZubplUr+O50OaGg2Cb5U1vdYZ0mimxHicNGI0U/f5okTq08Z/FyGZlQpZ8TeRw61ldksGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265137; c=relaxed/simple;
	bh=LuenfKuE2XF9i6IuQPIldaiUHoOlOAgK6Sr1AFryE9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TgHAZEYCJUvyHZ6xFDrYWraSVt9M/X8y3fP6uSAzoLUlRtqYT0guvSve0FMItXJpvJgCd711Kk5+bQb+p5Q1q8P9Jy5slP4BhkBORDuG3dQ9vC+QkC8S2E6xSVgLwMaij9EjT+P8bPY8A6KHz+9pYIEO4auRlER//gy3YCOqyJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agloJ5ob; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bf854d5feso1121609eec.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782265134; x=1782869934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfRNCmPCt9LvTDCCGINPsDLcIaMHwr+ZAPWGB2/yR1c=;
        b=agloJ5obW3+n1fZzKWYWarfzY6gjWCM0jLZk53kHknOBUGD7PckJvt3/LU78t2N3u8
         8jpOxYnT8cCNDBZ1fWwP+33Cdpx6YqDBobHJ/hwqVY+cM/dLtjmj23RG5SsMcQtaNs5b
         COCytL0rY4U31b0rqtj8K9CmPTV7diC7ywFUBETjKwo8wm9KENg5vAKidY6/73/D6L27
         Dg0Jbd5q1qrXjaM/WNS6yZXGjGrK89JiTKWL2aZf12jvbY0gbOo77Sb1XUOuOkBsZ87j
         kA1uutgjImC8MBwgHuR1Ae4HoyRDGOADxjXpMPr7QopSV3c1/dLu3glfA3vZWPVfgQUv
         3K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782265134; x=1782869934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfRNCmPCt9LvTDCCGINPsDLcIaMHwr+ZAPWGB2/yR1c=;
        b=a+YfFMab5JG6F5/5B7E8H+tshS15fpxZylEeADWYQHeBCramsFOf+zB2qprYvGCaDM
         cP6Rkgmf4ATRMBJV/Huy/28zFFojpXIhZV5X861rRySSgfNH7vxWkK/DO1WF6Swzouza
         1sq4u3QTMToUBx899tL1KOQN6MkeErszxzHjJkaluhUO1+/ocJCxKtiial3oUmXcFjMw
         4fG0L0bzI3+wX1+mUmogdk8J7TaFBcvloAZUR+bkJbKbNmrv3n3GsknukBds7Sz3ikMI
         HgRgwnNGSp2JSB2lCn4zPQw9FM29hgQN9cuas6L2t1rSE3BNwRguMKkPGpx4NlTJ3fMp
         UTsQ==
X-Gm-Message-State: AOJu0YyKvmngSGfl/jtoPs8Hdbl/lc+HMcrQ1Tad58weCSJWgPyJScbf
	7khilt3LJ94fo61OJCN/IQW3cAdCXN2fPJKr/sCdsuZL4ubuWs5TF9AokZzCcTX4
X-Gm-Gg: AfdE7cmfJEOP8HmVXmVEwS9tYIDCqlKVkHXrREOCYuSphYXrvjoJloqucforB1Lw0os
	2hciS7VPIjT32AKXWjJA34x53qHntUkvA/fZi141bu70iF48VuFrogClAw7Xow9qlllgijhgYA8
	D6QdxiWKNsXSj83rjgfueJq3QblVZ0/MSvPz3UN/s/Vt97eO88obuL0E9wK5d9M2Z8z4ZtzXTo1
	OOXy14cLkNHwVDpuPWT/2sm0UhePb5ftZIP4cFu6iMStKr8F4a77CPTL51zsFLKTAeVWsgjJPVP
	Pz8RZlPk3Myxk+I5ItTTCwJHdYo2IH/lJgoj2ZcR6vc9pPsIPtTbe7AewdOZRfqVgf1LF1JgncB
	ECYtIgmknMclMs8PB7Y1y9rl4hhlz9+sMaBhNgCNvKXfY4yerU7FvADXagEP6AGgTJ8lb5JSNbo
	4fkLJ41Q==
X-Received: by 2002:a05:7300:3081:b0:30c:536e:3a8e with SMTP id 5a478bee46e88-30c68c421aamr1693118eec.7.1782265134083;
        Tue, 23 Jun 2026 18:38:54 -0700 (PDT)
Received: from localhost ([2a09:bac5:55fa:18be::277:a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba57dc4sm19297898eec.9.2026.06.23.18.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:38:53 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Documentation: dev-tools: scripts/container prefers Podman
Date: Wed, 24 Jun 2026 09:38:50 +0800
Message-ID: <20260624013850.1853171-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-93338-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:gtucker@gtucker.io,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coibyxu@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coibyxu@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D17CE6BAD03

Obviously scripts/container prefers Podman over Docker. Putting podman
before docker also makes it consistent with following parts of the doc
and the help text of the tool.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/dev-tools/container.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 452415b64662..9e23f79d5ae1 100644
--- a/Documentation/dev-tools/container.rst
+++ b/Documentation/dev-tools/container.rst
@@ -40,7 +40,7 @@ Available options:
 
 ``-r, --runtime RUNTIME``
 
-    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
+    Container runtime name.  Supported runtimes: ``podman``, ``docker``.
 
     If not specified, the first one found on the system will be used
     i.e. Podman if present, otherwise Docker.
@@ -75,8 +75,8 @@ working directory and adjust the user and group id as needed.
 
 The container image which would typically include a compiler toolchain is
 provided by the user and selected via the ``-i`` option.  The container runtime
-can be selected with the ``-r`` option, which can be either ``docker`` or
-``podman``.  If none is specified, the first one found on the system will be
+can be selected with the ``-r`` option, which can be either ``podman`` or
+``docker``.  If none is specified, the first one found on the system will be
 used while giving priority to Podman.  Support for other runtimes may be added
 later depending on their popularity among users.
 
-- 
2.54.0


