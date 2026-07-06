Return-Path: <linux-doc+bounces-95169-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fUI9HOfMS2r1aQEAu9opvQ
	(envelope-from <linux-doc+bounces-95169-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:42:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF3712BC1
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="AfHkA/fv";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95169-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95169-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 181C8306708E
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3D83E51F4;
	Mon,  6 Jul 2026 15:29:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2327D3A8723
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351758; cv=none; b=DGfAeYnsAgg4l4SogTiu00W312T0o0kH9bob7QcVXsL0fSC0uO262Zy5qu/kVNyWkHJiIFmoY2BepWpz1nKv4/5QhgJjvjQSYvYF3lr5d1Vu8BnKycyjxEx6GA6Iy2irfvbeXfqrnU7/DSLam+cmAmN/IYPqhN7vsN9cDTfO71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351758; c=relaxed/simple;
	bh=x5HuJc8ryRcujdAvfssRfuCUtU/zCfH7JZqYpQDH/Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OBPDer0GrdpQCVimTZsBrk0Z+1z51jiIxO8qNAJt7f+ld1FQn/PAQl3fGO6UI2oL64zqTfoFfMxTl2sK7ICn4cC48s+vGTKWL5lanXCWF2NYureOZ8FoMLfHXc6BoVZ0TpZrUEtXfaEmpRb8OLiCScXO9HZjMtVyYrg9RLTDBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AfHkA/fv; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2069954f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783351755; x=1783956555; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+EaBgmuYdNNpZcqgX7l88URVM0gQj+bKH7LdozPRw=;
        b=AfHkA/fvL3A/rk7KwsBj1Hx/r9dskaifpZxY+7jjR4KV0wrOlC6zKT8JW8wLXoK+i9
         eEpd3YSPrI/K1ZoyaIc8cISOUl94+fIoo2yNvxoWCyrjkO+ywnHXRsEOzS8MH3LrJ+VW
         fYglRgDKJfQZy3zyuy74RthRouhVRfGgxSqjw1E//FpBH+hcRnxUd2gxb8WxOIxAsgD4
         s3fwmmXNKXeWRbLh8c0d4KO7RDfaxnx9XXea3qoBslnLZHDOZkDhOTIJNCUj+F2Hxieb
         ksGrUHJceoUzLe7OPBG3VUPdDJ1LhFTF7R1U6T4KOCQqGeplvG/4CUasBxCA8JagJqHO
         snPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351755; x=1783956555;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh+EaBgmuYdNNpZcqgX7l88URVM0gQj+bKH7LdozPRw=;
        b=O+w5WbuiolkMyZBgWWdRUfhUuf8wTZ+zGzw66Q+NAoPoWChnGxE++xVowRXUeiTIlk
         AHmym6X6+8am42E8226zm9MWhiBGgyK8e20QoiwngNR6NKsjzQjhAltgWRfpdH2svSSa
         m/u+oFSkB0O4n0tKL22yG8QvR5NZoN4cS5CC8Cf0ejN01tcxDfGwhawp0FHf8bhzjZ6c
         nmycwmxOv1pzLVLi5M7tXxHS0cfFCIfd49T1p3uStvL/xRAmusTyHxbUGuVHvCb8iWJ2
         UJ94CKSQRwk91G9pGmQdDCboXUoNy/5cGkA2Fw05+9gaLEEYkZlTvNXXf1ui6bVjFrdv
         rmrg==
X-Forwarded-Encrypted: i=1; AHgh+RoN7oNMBbJaJc1ut7ALhSF48csFAaXaHojGnyvXHyZLXfn8qB2jE0cd8lk3TF9DK83TzLaGK2vkWZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhr/5dc3Mta7k8dNRNGYv2+scRIouYRPdnneSbRwrSuHp+nz1p
	SQLPCNK0pIkogWJ0qcJyR0E5mTx1mVppFHV6ovCB7hUiCi7oNwX4jN2cMoYECSTQINY=
X-Gm-Gg: AfdE7cmNMfifNTl6Z4hDMS9GjnJWEj2Xu9W9o2WJfj5KphnMMW9rBn/pW10IdMXnQ1x
	OeLVGkTmuCpVh9+uNa7nAk3IN1phTaa9wfn35y0FCDlrkMLY/2dbtPmvEUmYgeH538Uriw1nAmO
	eo9xnLdCRA9zAfoWzRE/hfsCLdNhAA6WczLQ1yaJnGl/2v2lu0wTL+YbooSmKOsDDwJwFMBA6CR
	wqnUpH1ywSR9XePGi77py3tWUP4VdBnu857jeJXv0NNhdxOGWSSgel5C7lK/f4fPNWK32ayucDI
	5lCk2i2aAZt0m1b6Jx1UWo3Of8kMKRPRZimYzrAr9hQEsD5E5Oc1Ip4+jo02pyypBhQWr8cXsEI
	iX9xtHiOWXMeOORhA+1If1IvPeS9gjNKGDL6zh5htuCx0TUBSnKyqk7od5b7pCOUNc2ZEnY5Nhe
	i8iA==
X-Received: by 2002:a05:600c:3b2a:b0:493:df47:8d9f with SMTP id 5b1f17b1804b1-493df478db8mr3788435e9.10.1783351755505;
        Mon, 06 Jul 2026 08:29:15 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:157e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e19f3af52sm5839852137.3.2026.07.06.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:29:14 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Jul 2026 12:28:43 -0300
Subject: [PATCH] docs/bpf: Document BPF_STRICT_BUILD=0 to tolerate test
 build failures
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260706-b4-bpf_strict_build_docs-v1-1-5324d605c7b0@suse.com>
X-B4-Tracking: v=1; b=H4sIAKrJS2oC/yWMUQqDMBAFryL73VArEkuvUkrYxI1uaaPsRimId
 29sP+fxZjZQEiaFW7WB0MrKUypwOVUQRkwDGe4LQ1M3tu5qa3xr/BydZuGQnV/41bt+Cmrwith
 FbC01EYo+C0X+/NL3x5918U8K+egdD49KxgumMB7TJDxwOr9RMwns+xfDqGyonAAAAA==
X-Change-ID: 20260706-b4-bpf_strict_build_docs-a8aa7fa46e2f
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1783351752; l=1578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=x5HuJc8ryRcujdAvfssRfuCUtU/zCfH7JZqYpQDH/Ak=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHr+osZxhUqq7pE2zp7ADICTSyXNXxqw773pIlwgLCWR9KitoP8KxoHnsuxC5prSUiXwEd4ESYq
 f3uzdQk9NIQU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com,linux.dev,etsalapatis.com,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:eddyz87@gmail.com,m:memxor@gmail.com,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rbm@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rbm@suse.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95169-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EEF3712BC1

When the kernel config does not fully match the BPF selftest config
fragment, some tests may fail to compile. BPF_STRICT_BUILD (defaulting to
1) makes any such failure fatal. Mention the option so that developers are
aware they can set it to 0 to skip broken tests and keep the build going,
which is particularly useful during bringup or when testing on constrained
(e.g. distribution) configurations.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 Documentation/bpf/bpf_devel_QA.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 45bc5c5cd793..edf8107a7beb 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -479,7 +479,10 @@ for details.
 
 To maximize the number of tests passing, the .config of the kernel
 under test should match the config file fragment in
-tools/testing/selftests/bpf as closely as possible.
+tools/testing/selftests/bpf as closely as possible. If not possible,
+however, you can set ``BPF_STRICT_BUILD=0`` when invoking ``make``
+to tolerate individual compilation failures and continue building
+the remaining tests rather than treating each failure as fatal.
 
 Finally to ensure support for latest BPF Type Format features -
 discussed in Documentation/bpf/btf.rst - pahole version 1.16

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260706-b4-bpf_strict_build_docs-a8aa7fa46e2f

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>


