Return-Path: <linux-doc+bounces-76223-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAFpK1kBlmlHYAIAu9opvQ
	(envelope-from <linux-doc+bounces-76223-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 19:13:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5517D1589BC
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 19:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F30823064669
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 18:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BED347BB9;
	Wed, 18 Feb 2026 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxjp1ngr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD343346AEB
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438276; cv=none; b=SnCLNDjydpMsGJr/wnruLqNulFoLhuQmXpFiAgelfEPZ/5UODMrOWAzqak+/vQasC9lefXc8vb30TY3S0OJE8r3l9VfIcns16GZa6mwwsp03nbfYhMjkeCCHFK2dKI5zUO+lTOUQYPOruf2zdyzN9vWm8AsgHjsL7+J3ersbG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438276; c=relaxed/simple;
	bh=uGK41uj6PP/iNYJl90nhzFCAJOq4jOu74IyB8IEiN9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHNDApRDEvI6Azf7duVxkjyTMgqDnxx4Xt7Ye0APMs6PJwBkE/i6IjDs5B8cQjdAgxkfk8gTHan3F5SG+Q8RpTDKh0WUG75DfQXtoRDcP2ElUJBSk4//YvIOJzRuty8S6VmGuQVOImdhYB3SyaYLbV2iiEdl14UcRIYyanhkzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxjp1ngr; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-794911acb04so1754547b3.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771438273; x=1772043073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1wgGIa8//Y21Q1yl9IMhAVoEJrPKjw/0p7B3ammqNo=;
        b=Sxjp1ngrbm61KM1SssCgtg53oRQ57xddq335xU0Tr5P9gbgY3OvVgSzoHEjupl7Qiz
         qeShLNItOV+R3zhWkx+a49rTqh4sozGV9SvpO82vAtoBN+Rj7nV8rVpv8Lk92TbpqBcZ
         bfCZLNXGQubvFMGEUg5p7dAxzqmq5zAWL9tXQmhlx+F1w8Ka8X8lZdHUhRcCus/5dNPS
         sOYNDLYVwrz+8awLMJhb4QWtGUz1zXTFYwd5lR0zUkRgiPSYjJ/SsGcHqhck9Ihw//ac
         37aNH6AxotXpF3p2ChXd3VIXZJQMovwbHgWXD9xpsMQAaslXWg2P+pLSz/fzEZAiD8Kd
         RblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438273; x=1772043073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1wgGIa8//Y21Q1yl9IMhAVoEJrPKjw/0p7B3ammqNo=;
        b=Art4ySSzfla8OAO/dwWfYry2kQslnNsckxqIAe0HbtkwN4poqLxRO++YaHtWGuIxAW
         LEoxWbpu6qCPxlct0fTywZZ7030UuEvweQPMEotIH8HzvlRsZpKf5QfYvcNzPV5j+mkS
         Ypk1ob5E6JcYBxM8oZeMz7GtV5UltQCJMpKK7J0AutzRCbFRHhFJww//E2XtGXL1uPoc
         VDL5EA8yvIxje36NyqfdPvTe14CqWWQaX6BRPJiUcCfHaS8Zb62UgkfUbJI1lQuEFWGq
         2hZGwlXXn7hrssClmoEGIACd49cvQ916ZpF4d9Pw0T5rGl/yIxVyGZWJJehbw0/LybaG
         A89Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvPfM/DBL/8ZMxm1z7ztwFeSaBR6/6K3SawUD7dnjNwQBYonIXdzIP7mDkL2BWQ0dg1RagHqHTjBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3r/brzX+GYqmaluE5db2kNUcbKGxR90UFxBwJ3Z6H4ezAFTB
	cEKcMzZ8y9KehD6EnH/pxDVKW5mJKqMGWkbKsw2XMBD8wEQrOs0ifgtDSGExcp12
X-Gm-Gg: AZuq6aLIm5QpvFEDS9zHieM0XnMCbDRQeYbh7EjC7SrGiGU/601pTZCNcYe+nF+s7Ba
	vDCjgpKp0sNVpVCs7zFaIMeXoRJn1g+uarbDPK+L3EqDKbn1C8Lz5EYUyqejS1JRx+YTdbtwVXf
	WC1J3oYezgW7GTqs8x3LxmSJNV6C5n3pCkDVXWqsTTwQD2a9P+JhvejCj9taANW4yGUjlJ9AKaj
	qSni+DzOp3MbAsRzX3cjqK1hjclNIARRfMne+HBtUVN4letjp5ZvrjHiA08Ob1zI1dA/74hKp4O
	P1wLTPU5UbKsTQroioyDD6Xrv6lQnR/7kc8aJZmYnW4p5PQxVAsG4PkbXTaauXD90f5sLRtr5ys
	q6ew7iEEfBO4aDvwfhCuzkowo3dm24bWN9Q2aJqYpBB8rUizLjkF71gnWC3ZCroh6ctvfXV9HBR
	OGLJL8FzH21HT5FVQHS0UmeA==
X-Received: by 2002:a05:690c:dc6:b0:798:3a6:3f4 with SMTP id 00721157ae682-79803a60431mr1995927b3.43.1771438273356;
        Wed, 18 Feb 2026 10:11:13 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:54::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c257ed5sm124246567b3.45.2026.02.18.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:11:13 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 18 Feb 2026 10:10:38 -0800
Subject: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
In-Reply-To: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-76223-lists,linux-doc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:mid,meta.com:email]
X-Rspamd-Queue-Id: 5517D1589BC
X-Rspamd-Action: no action

From: Bobby Eshleman <bobbyeshleman@meta.com>

Update the vsock child_ns_mode documentation to include the new the
write-once semantics of setting child_ns_mode. The semantics are
implemented in a different patch in this series.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index c10530624f1e..976a176fb451 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -581,9 +581,9 @@ The init_net mode is always ``global``.
 child_ns_mode
 -------------
 
-Controls what mode newly created child namespaces will inherit. At namespace
-creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
-initial value matches the namespace's own ``ns_mode``.
+Write-once. Controls what mode newly created child namespaces will inherit. At
+namespace creation, ``ns_mode`` is inherited from the parent's
+``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
 
 Values:
 
@@ -594,6 +594,10 @@ Values:
 	  their sockets will only be able to connect within their own
 	  namespace.
 
+``child_ns_mode`` can only be written once per namespace. Writing the same
+value that is already set succeeds. Writing a different value after the first
+write returns ``-EBUSY``.
+
 Changing ``child_ns_mode`` only affects namespaces created after the change;
 it does not modify the current namespace or any existing children.
 

-- 
2.47.3


