Return-Path: <linux-doc+bounces-92936-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmAlASBMNWobrwYAu9opvQ
	(envelope-from <linux-doc+bounces-92936-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:03:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655336A63D6
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OqrsLayO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92936-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92936-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6AE73019C89
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 14:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF5D28CF6F;
	Fri, 19 Jun 2026 14:03:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3E28BAB9
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 14:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877788; cv=none; b=D4k/HX6XEWkHKBkcqEl9ggl73P9O+1bLUnpRpmNb9emXepLkISMzsr2Lhlv1Y8ypTTOCqhRoEwpEO9YGFocYa98tqokHIFawwS8SihmmK8mshy9ZLoI63OVK/NTUPyKVvCmo9a5sMbc/e+WDLGQOvjqu91cCmOLwLc/0dFwokhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877788; c=relaxed/simple;
	bh=NjD26cPZucYiZhPKqeeXc9vvIsln892dzhCDlrHC/aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EW6aQUalLR4t8YQjdyoPRVLYzOvV+QXgSMOWmw/fJ6d6dcVnYjvgj3AScC35fkA31eifXftO9JPsIqSlq/Ao8uNf7BCczTCrw2Swh2ic4s5Gc9NIkh8ueOQyyJWtVQfcFK91XjJWYGdveTeH/zzGrH4zcrRDplZGAX4Ty8a0coQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqrsLayO; arc=none smtp.client-ip=209.85.214.196
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c6bb8a5980so15694915ad.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781877786; x=1782482586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxPfVXYEwRUOjidRITayDcPKiGXFhdpBi7nTlByb0pQ=;
        b=OqrsLayOtOAIEaHpyWu1Iq3DNcEZYhW2Ltwfm9tePoZX87nArpZ2YBFSyMrNHxCVH8
         68/Vm5jCwuUm4XojYTfdrEha671C3DF/3GZNHY7cw7Wa7AOjyHFVGl/4miDQRI1FnhAI
         dER7lUSKE+tpQ0gzr1SW2GvbVV8FdvEeEaVLn3Gi+idRWtmCObHAc7BUxQDLr91G3C91
         yUMZnxOJeQRC/njBBsTubX+9FWA/ErKYZ218bjjG85I2mIlbe+FQospezDjVVWC9KEoY
         OmYa5gi0RvsCzM/Wn9z54HPD9efgu8B2Bn3OTGKzp2OpWWjKlfZpJOJjlhW+w8KLyKu5
         VN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877786; x=1782482586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxPfVXYEwRUOjidRITayDcPKiGXFhdpBi7nTlByb0pQ=;
        b=QJ+3mMQbSve8WMx6BSXlv0oEECv4Nu9+DY2hXAZOvXodA4aksYNNJ1FaRG0SQ1UkTn
         /gfFpyM8od7XGf6VodZV64iO/pBMamG9mvOzHz17wJD87vDYL7JWCZqarF+IvYmqDB2H
         Kr7+VOgHKy+6JkQiEj51lpOS+V/gSr2stAHYZunB5pZi94br6wD6+7YZJMP5VtyzuOx8
         ASc/ZFP+EZozQlADCV5fPnUBsykgc6PrMdDIwEgHHK8Xa8Pq9c0m3XnFXG5btO9fJ52w
         zkzIshs68Aq7dAy0OdufjMQE9UTrCrmaZPsm5u/SN+JKVduYCDJmLNlgKJwT7u5bd8t5
         kmUA==
X-Forwarded-Encrypted: i=1; AFNElJ+b2JxPB/Tb71iZQmxc26KfqQuPH/mwCTteNbdAyMOCGlHgno5Ii7CnXhqRX6ghkzEIzVYTiypUfAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXohMx7ttFpzemhuKf/ERDO5t0XjKNsexgM5fJTlgWvhM+173
	I5/iNU5u396P8Iyp8pDzmGq1IACiTxOUNBA84Ucn2fHa6eD2SabG35NH
X-Gm-Gg: AfdE7clVTHchEtKk6HQCVbEO8RjmABeONqzCf8VJg/NvhDwcvH+0WFhs5q1xWo3DG3t
	E/i+cRqxzpHl3JPc4vEzst7d6ApDGOEhP7uWN/Mg23Ic0ArxsYHU7aWdfYLBtw4aTosEGy/Sml1
	sHY+HRuQKRgV7wg5AkXkOcgdmsHdnI5nyrVXOlEvDpXnyCAjj3ycZd0XuhZOCSIBSDpZN6mxnhz
	sL+muwnY/n3QfC/Ed4HaUDTUh/UCyV9bHIGt/i9bq/GssXNsndTwtdu/UXBOnnhp+LVfTavL5vI
	eM8ht0FD+BvyBEBNI6tcKEQYPT3cHUOzqDIpyZcttSmYUoANC8H4glIHJeoBgxEYHmd9Smpulr8
	rFriy9Jbcu9CEfKrsYY016lMh1hDGte+JQu1kJjv3pFgAd2WW5hzgOhC7xbs+ojUL37LEb7a79/
	hodC6EjLLfsqSJPPtAEQ==
X-Received: by 2002:a17:902:e5c1:b0:2c1:f29a:b554 with SMTP id d9443c01a7336-2c718fe286dmr36976925ad.21.1781877785707;
        Fri, 19 Jun 2026 07:03:05 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc1:3c11:741b:44f:bd4b:7c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c229cbsm24795845ad.79.2026.06.19.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:03:05 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH 1/3] docs/zh_CN: add llvm.rst translation anchor
Date: Fri, 19 Jun 2026 22:02:39 +0800
Message-ID: <20260619140245.1982921-2-qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[hust.edu.cn,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-92936-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiujiandong1998@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 655336A63D6

Add the kbuild_llvm_zh label for local cross-references.

Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
---
process/changes.rst refers to this anchor.

 Documentation/translations/zh_CN/kbuild/llvm.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documentation/translations/zh_CN/kbuild/llvm.rst
index f87e0181d8e7..5fdf281a614a 100644
--- a/Documentation/translations/zh_CN/kbuild/llvm.rst
+++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
@@ -5,6 +5,8 @@
 :Original: Documentation/kbuild/llvm.rst
 :Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
 
+.. _kbuild_llvm_zh:
+
 ==========================
 使用 Clang/LLVM 构建 Linux
 ==========================
-- 
Jiandong Qiu <qiujiandong1998@gmail.com>


